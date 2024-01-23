#!/usr/bin/env bash
# ######################################################################################
# CONFIGURATIVE UTILITY
# ######################################################################################
# ======================================================================================
# READ CONFIGURATION FILE
# ======================================================================================
s_rdCnfFl() {


	# [ arguments ]
	local -a _ax=("$@") ;

	# [ result ]
	local _rslt=$tru ;


	# POSITIONED ARGUMENT --------

	# [ positoined_arguments ]
	local -a _pax=` \
		s_gtCblPax \
	` ;


	# [ file_path ]
	local fl_pf__="${_pax[0]}" ;


	# PRECHECK : FILE PATH ARGUMENT --------

	[[ -z "$fl_pf__" ]] \
	&& return $fls \
	;


	# PRECHECK : FILE PATH EXISTENCE --------

	[[ ! -f "$fl_pf__" ]] \
	&& return $fls \
	;


	# NAMED ARGUMENT --------

	# [ named_arguments ]
	local -A _nax=` \
		s_gtCblNax \
			\
			--sec "section" \
			--sec-nov 1 \
			--sec-xasgmt \
			\
			--ky "key" \
			--ky-nov 1 \
			--ky-xasgmt \
	` ;


	# [ sections ]
	local -a _secx="${_nax[sec]}" ;

	# [ keys ]
	local -a _kyx="${_nax[ky]}" ;


	# MAIN PROCESS : DETERMINE SECTION AND KEY --------

	# [ section_conditions ]
	local _sec_cndx ;

	# [ include_null_section ]
	local _icl_n_sec ;

	# [ key_conditions ]
	local _ky_cndx ;


	for (( i=0 ; i<${#_secx[@]} ; i++ )) ;
	do

		if [[ "${_secx[$i]}" ]] ;
		then

			[[ "$_sec_cndx" ]] \
			&& _sec_cndx+="|${_secx[$i]}" \
			|| _sec_cndx="${_secx[$i]}" \
			;


		else 

			_icl_n_sec=$tru ;


		fi ;

	done ;


	for (( i=0 ; i<${#_kyx[@]} ; i++ )) ;
	do

		[[ \
			"${_kyx[$i]}" \
			&& "$_ky_cndx" \
		]] \
		&& _ky_cndx+="|${_kyx[$i]}" \
		|| _ky_cndx="${_kyx[$i]}" \
		;

	done ;


	# MAIN PROCESS : MATCH RESULT --------

	# A ) SECTION 

	[[ "$_sec_cndx" ]] \
	&& _sec_cndx='
		match( $0 , /^\[(\s+|\t+|)('"$_sec_cndx"')(\s+|\t+|)\]/ , r ) \
		{ 
			is_tgt_sec=1
		}
	' \
	;


	# B ) KEY

	# [ binding ]
	local _bdg ;


	if [[ ${#_secx[@]} -gt 0 ]] ;
	then

		if [[ \
			${#_secx[@]} -eq 1 \
			&& $_icl_n_sec == $tru \
		]] ;
		then

			_bdg='! sec_nm && \' ;


		elif [[ $_icl_n_sec != $tru  ]] ;
		then

			_bdg='is_tgt_sec && \' ;


		else 

			_bdg='( ! sec_nm || is_tgt_sec ) && \' ;


		fi ;

	fi ;


	[[ "$_ky_cndx" ]] \
	&& _ky_cndx='
		'"$_bdg"'
		match( $0 , /(\s+|\t+|)('"$_ky_cndx"')(\s+|\t+|)=(\s+|\t+|)(.*)/ , r ) \
		{ 
			if ( sec_nm ) 
			{ 
				print sec_nm "." r[2] "=" r[5] 
			} 
			else 
			{ 
				print r[2] "=" r[5] 
			}
		}
			' \
			|| _ky_cndx='
		'"$_bdg"'
		match( $0 , /(\s+|\t+|)([^ \t]+)(\s+|\t+|)=(\s+|\t+|)(.*)/ , r ) \
		{ 
			if ( sec_nm ) 
			{ 
				print sec_nm "." r[2] "=" r[5] 
			} 
			else 
			{ 
				print r[2] "=" r[5] 
			}
		}
	' \
	;


	awk \
		'
		/^(\s+|\t+|)*#/ \
		|| /^(\s+|\t+|)*$/ \
		{ 
			next 
		}

		match( $0 , /^\[(\s+|\t+|)([^ \t]+)(\s+|\t+|)\]/ , r ) \
		{ 
			sec_nm=r[2]
			is_tgt_sec=0
		}
		'"$_sec_cndx"'
		'"$_ky_cndx"'
		' \
		"$fl_pf__" \
	| tr \
		-d \
		'\r' \
	;


	# POST PROCESS : REPORT STATUS --------

	return $? ;


} ;



# ======================================================================================
# LOAD CONFIGURATION FILE
# ======================================================================================
s_ldCnfFl() {


	# [ arguments ]
	local -a _ax=("$@") ;

	# [ result ]
	local _rslt=$tru ;


	# POSITIONED ARGUMENT --------

	# [ file_paths ]
	local -a fl_pfx__=` \
		s_gtCblPax \
	` ;


	# PRE PROCESS : GET LANES --------

	# [ lanes ]
	local -a _lnx ;


	for (( i=0 ; i<${#fl_pfx__[@]} ; i++ )) ;
	do 

		_lnx+=(` \
			s_rdCnfFl \
				"${fl_pfx__[$i]}" \
		`) ;

	done ;


	# PRECHECK : LANES --------

	[[ ${#_lnx[@]} -eq 0 ]] \
	&& return $fls \
	;


	# MAIN PROCESS : ORGANIZE VARIABLES --------

	local -A _cnfx ;


	for ln in "${_lnx[@]}" ;
	do


		# ▧ find 
		# ^ 					: from start
		# (([^\.]+)\.|) 		: capture anything until dot if present to group 1 and 2
		# (.*)\= 				: anything before = to group 3
		# (.*) 					: anything after = to group 4
		# ▨ replace
		# \2 					: section
		# \3 					: key
		# \4 					: value

		# [ section ]
		local _sec="` \
			echo \
				$ln \
			| sed \
				-r \
				-e \
				's/^(([^\.]+)\.|)(.*)\=(.*)/\2/g' \
		`" ;


		# [ key ]
		local _ky="` \
			echo \
				$ln \
			| sed \
				-r \
				-e \
				's/^(([^\.]+)\.|)(.*)\=(.*)/\3/g' \
		`" ;


		# [ value ]
		local _vlu="` \
			echo \
				$ln \
			| sed \
				-r \
				-z \
				-e \
				's/^(([^\.]+)\.|)(.*)\=(.*)/\4/g' \
		`" ;


		# [ between ]
		local _btw=' ' ;


		# A ) SECTION 

		if [[ $_sec ]] ;
		then


			# i ) KEY CONTAINS VALUE

			if [[ "${_cnfx[$_sec]}" =~ '['"$_ky"']=' ]] ;
			then


				# - value is not array type
				if [[ ! "${_cnfx[$_sec]}" =~ '['"$_ky"']="(' ]] ;
				then

					# ↓ This is use to encircle key value.

					# ▧ find
					# ^ 					: from start
					# (.*\[__key__\]=) 	: catch anything from start till key indicator meet to group 1
					# (.*) 					: catch anything after to group 2
					# ((__space__\[|).*) 	: catch anything from key value ends till the last ) to group 3
					# \) 					: last )
					# $ 					: end
					# ▨ replace
					# \1 					: group 1
					# \"\(\2\)\" 			: group 2
					# \3 					: group 3
					# \) 					: last )
					_cnfx[$_sec]="` \
						echo "${_cnfx[$_sec]}" \
						| sed \
							-r \
							-e \
							's/^(.*\['"$_ky"'\]=)(.*)(('"$_btw"'\[|).*)\)$/\1\"\(\2\)\"\3\)/g' \
					`" ;

				fi ;


				# ▧ find
				# ^ 					: from start
				# (.*\[__key__\]="\(.*) : catch anything from start till key indicator meet to group 1
				# (\).*\).*)$ 			: catch anything from key value ends till the last ) to group 2
				# \) 					: last )
				# $ 					: end
				# ▨ replace
				# \1 					: group 1
				# __space__ 			: optional space
				# \\\\\"__value__\\\\\" : value
				# \2 					: group 2
				# \) 					: last )
				_cnfx[$_sec]="` \
					echo "${_cnfx[$_sec]}" \
					| sed \
						-r \
						-e \
						's/^(.*\['"$_ky"'\]="\(.*)(\).*)\)$/\1'"$_btw"'\\\\\"'"${_vlu//\//\\\/}"'\\\\\"\2\)/g' \
				`" ;


			# ii ) KEY EMPTY

			else 


				[[ -z "${_cnfx[$_sec]}" ]] \
				&& _cnfx[$_sec]='()' \
				&& _btw='' \
				;


				# ▧ find
				# ^ 					: from start
				# (.*) 					: catch anything  from start till the last ) to group 1
				# \) 					: last )
				# $ 					: end
				# ▨ replace
				# \1 					: group 1
				# [__key__]= 			: key
				# \\\\\"__value__\\\\\" : value
				# \) 					: last )
				_cnfx[$_sec]="` \
					echo "${_cnfx[$_sec]}" \
					| sed \
						-r \
						-e \
						's/^(.*)\)$/\1'"$_btw"'['"$_ky"']=\\\\\"'"${_vlu//\//\\\/}"'\\\\\"\)/g' \
				`" ;


			fi ;


		# B ) NON SECTION 

		else 

			# i ) KEY CONTAINS VALUE

			if [[ "${_cnfx[$_ky]}" ]] ;
			then


				[[ ! "${_cnfx[$_ky]}" =~ ^\( ]] \
				&& _cnfx[$_ky]='("'"${_cnfx[$_ky]}"'")' \
				;


				# ▧ find
				# ^ 					: from start
				# (.*) 					: catch anything  from start till the last ) to group 1
				# \) 					: last )
				# $ 					: end
				# ▨ replace
				# \1 					: group 1
				# __space__ 			: optional space
				# \\\"\(__value__\)\\\" : value
				# \) 					: last )
				_cnfx[$_ky]="` \
					echo "${_cnfx[$_ky]}" \
					| sed \
						-r \
						-e \
						's/^(.*)\)$/\1'"$_btw"'\\\"'"${_vlu//\//\\\/}"'\\\"\)/g' \
				`" ;


			# ii ) KEY EMPTY

			else 

				_cnfx[$_ky]="$_vlu" \


			fi ;

		fi ;

	done ;


	# POST PROCESS : OUTPUT REUSLT --------

	echo "(" ;

	for ky in "${!_cnfx[@]}" ; 
	do

		echo "[${ky}]='${_cnfx[$ky]}'" ;

	done ;

	echo ")" ;


	# POST PROCESS : REPORT STATUS --------

	return $? ;


} ;
