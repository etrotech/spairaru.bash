#!/usr/bin/env bash
# ######################################################################################
# CONFIGURATOR CONTROLLER UTILITY GROUP
# ######################################################################################
CfgrtrCtlr() (


# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# STATEFUL STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# HAS
# ======================================================================================
	hs() {


		# [ arguments ]
		local -a _ax=("$@") ;

		# [ result ]
		local _rslt=$tru ;


		# POSITIONED ARGUMENT --------

		# [ positoined_arguments ]
		local -a _pax=` \
			s_gtCblPax \
		` ;


		# [ file_absolute_path ]
		local fl_abs_pf__="${_pax[0]}" ;

		# [ key ]
		local ky__="${_pax[1]}" ;


		# PRECHECK : FILE PATH --------

		if [[ ! -f "$fl_abs_pf__" ]] ;
		then 

			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_CblMpa \
				"File Path" \
				--pos "1st" \
			;

			return $fls ;

		fi ;


		# PRECHECK : KEY --------

		if [[ -z "$ky__" ]] ;
		then 

			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_CblMpa \
				"Key" \
				--pos "2nd" \
			;

			return $fls ;

		fi ;


		# PRECHECK : FILE PATH --------

		if [[ -z "$fl_abs_pf__" ]] ;
		then 

			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_DfltRej \
				"%s does not exist." \
				"File Path" \
			&& s_ivkPptTpl_DfltBlkCnt \
				"${ANSI_F_LG}%s${_ANSI}${ANSI_F_CN}%s${_ANSI}" \
				"`s_gtIco fl`" \
				"${pf/$PWD\//\./}" \
			;

			return $fls ;

		fi ;


		# NAMED ARGUMENT --------

		# [ named_arguments ]
		local -A _nax=` \
			s_gtCblNax \
				--sec "section" \
				--sec-nov 1 \
		` ;


		# [ section ]
		local -a sec="${_nax[sec]}" ;


		# MAIN PROCESS : DETERMINE SECTION AND KEY --------

		# [ section_conditions ]
		local _sec ;

		# [ key_conditions ]
		local _ky ;


		# A ) Section is Giving

		if [[ "$sec" ]] ;
		then

			_sec="$sec" ;

			_ky="$ky__" ;


		# B ) Key Contains Section

		elif [[ "$ky__" =~ .*\..* ]] ;
		then

			_sec="` \
				echo \
					$ky__ \
				| sed \
					-r \
					-e \
					's/(.*)\..*/\1/g' \
			`" ;

			_ky="` \
				echo \
					$ky__ \
				| sed \
					-r \
					-e \
					's/.*\.(.*)/\1/g' \
			`" ;


		# C ) Section is not Giving

		else

			_ky="$ky__" ;


		fi ;


		# MAIN PROCESS : CHECK FILE --------

		# [ lanes ]
		local -a _lnx=(` \
			s_rdCnfFl \
				"$fl_abs_pf__" \
				--sec "$_sec" \
				--ky "$_ky" \
		`) ;


		[[ ${#_lnx[@]} -eq 0 ]] \
		&& _rslt=$fls \
		;


		# POST PROCESS : REPORT STATUS --------

		return $_rslt ;


	} ;



# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# I/O STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# ADD
# ======================================================================================
	ad() {


		# [ arguments ]
		local -a _ax=("$@") ;

		# [ result ]
		local _rslt=$tru ;


		# POSITIONED ARGUMENT --------

		# [ positoined_arguments ]
		local -a _pax=` \
			s_gtCblPax \
		` ;


		# [ file_absolute_path ]
		local fl_abs_pf__="${_pax[0]}" ;

		# [ key ]
		local ky__="${_pax[1]}" ;

		# [ value ]
		local vlu__="${_pax[2]}" ;


		# NAMED ARGUMENT --------

		# [ named_arguments ]
		local -A _nax=` \
			s_gtCblNax \
				--sec "section" \
				--sec-nov 1 \
				\
				--mx "mutiple" \
		` ;


		# [ section ]
		local sec="${_nax[sec]}" ;

		# [ mutiple ]
		local mx="${_nax[mx]}" ;


		# PRECHECK : FILE PATH ARGUMENT --------

		if [[ -z "$fl_abs_pf__" ]] ;
		then 

			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_CblMpa \
				"File Path" \
				--pos "1st" \
			;

			return $fls ;


		fi ;


		# PRECHECK : KEY --------

		if [[ -z "$ky__" ]] ;
		then 

			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_CblMpa \
				"Key" \
				--pos "2nd" \
			;

			return $fls ;


		fi ;


		# PRECHECK : VALUE --------

		if [[ -z "$vlu__" ]] ;
		then 

			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_CblMpa \
				"Value" \
				--pos "3rd" \
			;

			return $fls ;


		fi ;


		# PRECHECK : FILE PATH EXISTENCE --------

		if [[ -z "$fl_abs_pf__" ]] ;
		then 

			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_DfltRej \
				"%s does not exist." \
				"File Path" \
			&& s_ivkPptTpl_DfltBlkCnt \
				"${ANSI_F_LG}%s${_ANSI}${ANSI_F_CN}%s${_ANSI}" \
				"`s_gtIco fl`" \
				"${pf/$PWD\//\./}" \
			;

			return $fls ;

		fi ;


		# MAIN PROCESS : DETERMINE SECTION AND KEY --------

		# [ section_conditions ]
		local _sec ;

		# [ key_conditions ]
		local _ky ;


		# A ) Section is Giving

		if [[ "$sec" ]] ;
		then

			_sec="$sec" ;

			_ky="$ky__" ;


		# B ) Key Contains Section

		elif [[ "$ky__" =~ .*\..* ]] ;
		then

			_sec="` \
				echo \
					$ky__ \
				| sed \
					-r \
					-e \
					's/(.*)\..*/\1/g' \
			`" ;

			_ky="` \
				echo \
					$ky__ \
				| sed \
					-r \
					-e \
					's/.*\.(.*)/\1/g' \
			`" ;


		# C ) Section is not Giving

		else

			_ky="$ky__" ;


		fi ;


		# MAIN PROCESS : BUILD ENTRY --------

		# [ section_entry ]
		local _sec_nty ;

		[[ "$_sec" ]] \
		&& _sec_nty="\[${_sec}\]" \
		;


		# [ key_entry ]
		local _ky_nty ;

		[[ "$_sec" ]] \
		&& _ky_nty="\t" \
		;
		
		_ky_nty+="${_ky} = ${vlu__}" ;


		# MAIN PROCESS : ADD SECTION --------

		if \
			[[ $_sec_nty ]] \
			&& ! s \
				doc \
					hs \
						"$fl_abs_pf__" \
						"$_sec_nty" \
		; 
		then


			! s \
				doc \
				isMpty \
					"$fl_abs_pf__" \
			&& local _gap_ln='\^\|' \
			;


			s \
				doc \
					wrt \
						"$fl_abs_pf__" \
						"$_gap_ln" \
						"${_sec_nty}"'\^\|' \
			;


		fi ;


		# MAIN PROCESS : ADD KEY --------

		# [ lanes ]
		local -a _lnx=(` \
			s_rdCnfFl \
				"$fl_abs_pf__" \
				--sec ${_sec} \
		`) ;

		# [ is_key_exists ]
		local _is_ky_ex ;
		
		[[ "` \
			echo \
				"${_lnx[@]}" \
			| sed \
				-n \
				-r \
				-e \
				's/('"${_ky}"'(\s+|\t+|)\=.*)/\1/p' \
		`" ]] \
		&& _is_ky_ex=$tru \
		|| _is_ky_ex=$fls \
		;


		# [ document_option ]
		local -a _doc_optx ;


		# A ) DOCUMENT IS EMPTY

		if [[ ${#_lnx[@]} -eq 0 ]] ;
		then


			[[ $_sec_nty ]] \
			&& _doc_optx+=(--aft "$_sec_nty") \
			;


			s \
				doc \
					wrt \
						"$fl_abs_pf__" \
						"$_ky_nty" \
						-f \
						"${_doc_optx[@]}" \
			;

			_rslt=$? ;


		# B ) KEY EXSISTS

		elif [[ $_is_ky_ex == $tru ]] ;
		then

			# i ) All Mutiple

			if [[ $mx == $tru ]] ;
			then

				if [[ "` \
					echo \
						"${_lnx[@]}" \
					| sed \
						-n \
						-r \
						-e \
						's/('"$_ky"'(\s+|\t+|)\=(\s+|\t+|)'"$vlu__"'.*)/\1/p' \
				`" ]] ;
				then

					_rslt=2 ;


				else


					[[ $_sec_nty ]] \
					&& _doc_optx+=(--aft '\[(\s+|\t+|)'"$_sec"'(\s+|\t+|)\].*((\s+|\t+|)'"$_ky"'(\s+|\t+|)\=.*)+') \
					|| _doc_optx+=(--aft '('"$_ky"'(\s+|\t+|)\=.*)+') \
					;


					s \
						doc \
							wrt \
								"$fl_abs_pf__" \
								"$_ky_nty" \
								--nfc \
								"${_doc_optx[@]}" \
					;

					_rslt=$? ;


				fi ;


			# ii ) Single Rewrite

			elif [[ $nfc == $tru ]] ;
			then 


				[[ $_sec_nty ]] \
				&& _doc_optx+=(--rplc '(\[(\s+|\t+|)'"$_sec"'(\s+|\t+|)\].*(\n|\r\n|$))(\s+|\t+|)'"$_ky"'(\s+|\t+|)\=.*') \
				|| _doc_optx+=(--rplc '(\s+|\t+|)'"$_ky"'(\s+|\t+|)\=.*') \
				;


				s \
					doc \
						wrt \
							"$fl_abs_pf__" \
							"\2${_ky_nty}" \
							--nfc  $nfc \
							"${_doc_optx[@]}" \
				;

				_rslt=$? ;


			# iii ) Otherwise

			else

				_rslt=2 ;


			fi ;


		# C ) KEY NOT EXSISTS

		else


			# [ fragments ]
			IFS='=' read -ra _frgmtx <<< "${_lnx[${#_lnx[@]}-1]}" ;

			# [ fragments ]
			IFS='.' read -ra _frgmtx <<< "${_frgmtx[0]}" ;


			[[ ${#_frgmtx[@]} -gt 1 ]] \
			&& _doc_optx+=(--aft '\[(\s+|\t+|)'"${_frgmtx[0]}"'(\s+|\t+|)\].*((\s+|\t+|)'"${_frgmtx[1]}"'(\s+|\t+|)\=.*)+') \
			|| _doc_optx+=(--aft '('"${_frgmtx[0]}"'(\s+|\t+|)\=.*)+') \
			;


			s \
				doc \
					wrt \
						"$fl_abs_pf__" \
						"$_ky_nty" \
						--nfc  $nfc \
						"${_doc_optx[@]}" \
			;

			_rslt=$? ;


		fi ;


		# POST PROCESS : REPORT STATUS --------

		return $_rslt ;


	} ;



# ======================================================================================
# GET
# ======================================================================================
	gt() {


		# [ arguments ]
		local -a _ax=("$@") ;

		# [ result ]
		local _rslt=$tru ;


		# POSITIONED ARGUMENT --------

		# [ positoined_arguments ]
		local -a _pax=` \
			s_gtCblPax \
		` ;


		# [ file_absolute_paths ]
		local fl_abs_pfx__="${_pax[0]}" ;

		[[ "${#_pax[@]}" -gt 0 ]] \
		&& fl_abs_pfx__=("${_pax[@]:0:${#_pax[@]}-1}") \
		;


		# [ key ]
		local ky__ ;

		[[ "${#_pax[@]}" -gt 1 ]] \
		&& ky__="${_pax[@]: -1}" \
		;


		# NAMED ARGUMENT --------

		# [ named_arguments ]
		local -A _nax=` \
			s_gtCblNax \
				--sec "section" \
				--sec-nov 1 \
				\
				--mx "mutiple" \
		` ;


		# [ section ]
		local -a sec="${_nax[sec]}" ;

		# [ mutiple ]
		local mx="${_nax[mx]}" ;


		# PRECHECK : FILE PATH ARGUMENT --------

		if [[ -z "$fl_abs_pfx__" ]] ;
		then 

			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_CblMpa \
				"File Path" \
				--pos "1st" \
			;

			return $fls ;

		fi ;


		# PRECHECK : KEY ARGUMENT --------

		if [[ -z "$ky__" ]] ;
		then 

			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_CblMpa \
				"Key" \
				--pos "2nd" \
			;

			return $fls ;

		fi ;


		# MAIN PROCESS : DETERMINE SECTION AND KEY --------

		# [ section_conditions ]
		local _sec ;

		# [ key_conditions ]
		local _ky ;


		# A ) Section is Giving

		if [[ "$sec" ]] ;
		then

			_sec="$sec" ;

			_ky="$ky__" ;


		# B ) Key Contains Section

		elif [[ "$ky__" =~ .*\..* ]] ;
		then

			_sec="` \
				echo \
					$ky__ \
				| sed \
					-r \
					-e \
					's/(.*)\..*/\1/g' \
			`" ;

			_ky="` \
				echo \
					$ky__ \
				| sed \
					-r \
					-e \
					's/.*\.(.*)/\1/g' \
			`" ;


		# C ) Section is not Giving

		else

			_ky="$ky__" ;


		fi ;


		# MAIN PROCESS : GET CONFIGURATION --------

		# [ all_configurations ]
		declare -A _all_cnfx="` \
			s_ldCnfFl \
				"${fl_abs_pfx__[@]}" \
		`" ;


		# A ) SECTION CONTAINED

		if [[ "$_sec" ]] ;
		then


			# [ section_configurations ]
			declare -A _sec_cnfx="${_all_cnfx[$_sec]}" ;


			if [[ "${_sec_cnfx[$_ky]}" ]] ;
			then

				
				if [[ \
					! "${_sec_cnfx[$_ky]}" =~ ^\( \
					|| $mx == $tru \
				]] ;
				then

					echo "${_sec_cnfx[$_ky]}" ;


				else

					# [ values ]
					declare -a _vlux="${_sec_cnfx[$_ky]}" ;

					echo "${_vlux[0]}" ;


				fi ;

			else

				_rslt=$fls ;


			fi ;


		# A ) NO SECTION CONTAINED

		elif [[ "${_all_cnfx[$_ky]}" ]] ;
		then

			if [[ \
				! "${_all_cnfx[$_ky]}" =~ ^\( \
				|| $mx == $tru \
			]] ;
			then

				echo "${_all_cnfx[$_ky]}" ;


			else

				# [ values ]
				declare -a _vlux="${_all_cnfx[$_ky]}" ;

				echo "${_vlux[0]}" ;


			fi ;

		else

				_rslt=$fls ;


		fi ;


		# POST PROCESS : REPORT STATUS --------

		return $_rslt ;


	} ;



# ======================================================================================
# DELETE
# ======================================================================================
	dl() {


		# [ arguments ]
		local -a _ax=("$@") ;

		# [ result ]
		local _rslt=$tru ;


		# POSITIONED ARGUMENT --------

		# [ positoined_arguments ]
		local -a _pax=` \
			s_gtCblPax \
		` ;


		# [ file_absolute_path ]
		local fl_abs_pf__="${_pax[0]}" ;

		# [ key ]
		local ky__="${_pax[1]}" ;


		# NAMED ARGUMENT --------

		# [ named_arguments ]
		local -A _nax=` \
			s_gtCblNax \
				--sec "section" \
				--sec-nov 1 \
				\
				--mx "mutiple" \
				\
				--rm_sec "remove_section" \
		` ;


		# [ section ]
		local sec="${_nax[sec]}" ;

		# [ mutiple ]
		local mx="${_nax[mx]}" ;

		# [ remove_section ]
		local rm_sec="${_nax[rm_sec]}" ;


		# PRECHECK : FILE PATH ARGUMENT --------

		if [[ -z "$fl_abs_pf__" ]] ;
		then 

			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_CblMpa \
				"File Path" \
				--pos "1st" \
			;

			return $fls ;


		fi ;


		# PRECHECK : KEY --------

		if [[ -z "$ky__" ]] ;
		then 

			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_CblMpa \
				"Key" \
				--pos "2nd" \
			;

			return $fls ;


		fi ;


		# PRECHECK : FILE PATH EXISTENCE --------

		if [[ -z "$fl_abs_pf__" ]] ;
		then 

			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_DfltRej \
				"%s does not exist." \
				"File Path" \
			&& s_ivkPptTpl_DfltBlkCnt \
				"${ANSI_F_LG}%s${_ANSI}${ANSI_F_CN}%s${_ANSI}" \
				"`s_gtIco fl`" \
				"${pf/$PWD\//\./}" \
			;

			return $fls ;

		fi ;


		# MAIN PROCESS : DETERMINE SECTION AND KEY --------

		# [ section_conditions ]
		local _sec ;

		# [ key_conditions ]
		local _ky ;


		# A ) Section is Giving

		if [[ "$sec" ]] ;
		then

			_sec="$sec" ;

			_ky="$ky__" ;



		# B ) Key Contains Section

		elif [[ "$ky__" =~ .*\..* ]] ;
		then

			_sec="` \
				echo \
					$ky__ \
				| sed \
					-r \
					-e \
					's/(.*)\..*/\1/g' \
			`" ;

			_ky="` \
				echo \
					$ky__ \
				| sed \
					-r \
					-e \
					's/.*\.(.*)/\1/g' \
			`" ;


		# C ) Section is not Giving

		else

			_ky="$ky__" ;


		fi ;


		# MAIN PROCESS : DELETE KEY --------

		# [ lanes ]
		local -a _lnx=(` \
			s_rdCnfFl \
				"$fl_abs_pf__" \
				--sec "$_sec" \
		`) ;


		# [ is_key_exists ]
		local _is_ky_ex ;
		
		[[ "` \
			echo \
				"${_lnx[@]}" \
			| sed \
				-n \
				-r \
				-e \
				's/('"$_ky"'(\s+|\t+|)\=.*)/\1/p' \
		`" ]] \
		&& _is_ky_ex=$tru \
		|| _is_ky_ex=$fls \
		;


		# [ document_options ]
		local -a _doc_optx ;


		[[ $_sec ]] \
		&& _doc_optx+=(--aft '\[(\s+|\t+|)'"$_sec"'(\s+|\t+|)\].*') \
		;


		# A ) KEY NOT EXISTS

		# - section has no entries
		# - key does not exists
		if [[ \
			${#_lnx[@]} -eq 0 \
			|| $_is_ky_ex == $fls \
		]] ;
		then

			_rslt=2 ;


		# B ) KEY EXISTS

		else

			# i ) Mutiple Removal

			if [[ $mx == $tru ]] ;
			then

				s \
					doc \
						ers \
							"$fl_abs_pf__" \
							'((\s+|\t+|)'"$_ky"'(\s+|\t+|)\=.*)+' \
							"${_doc_optx[@]}" \
				;


			# ii ) Single Removal

			else

				s \
					doc \
						ers \
							"$fl_abs_pf__" \
							'(\s+|\t+|)'"$_ky"'(\s+|\t+|)\=.*' \
							"${_doc_optx[@]}" \
				;


			fi ;


			_rslt=$? ;


		fi ;


		# MAIN PROCESS : DELETE SECTION --------

		if [[ \
			$_sec \
			&& $rm_sec == $tru \
		]] ;
		then


			# [ lanes ]
			local -a _lnx=(` \
				s_rdCnfFl \
					"$fl_abs_pf__" \
					--sec "$_sec" \
			`) ;


			[[ ${#_lnx[@]} -eq 0 ]] \
			&& s \
				doc \
					ers \
						"$fl_abs_pf__" \
						'(\s+|\t+|)'"$_sec"'(\s+|\t+|)\=.*' \
			;


		fi ;


		# POST PROCESS : REPORT STATUS --------

		return $_rslt ;


	} ;



# ======================================================================================
# LOAD
# ======================================================================================
	ld() {


		# MAIN PROCESSES --------

		s_ldCnfFl \
			"$@" \
		;


		# POST PROCESS : REPORT STATUS --------

		return $? ;


	} ;



# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# DEFAULT STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# CONSTRUCTOR
# ======================================================================================

	# [ arguments ]
	local -a _ax=("$@") ;


	# HELP --------

	s_isHlp \
		"$@" \
	&& echo "" \
	&& return $tru \
	;


	# VERSION --------

	s_isVer \
		"$@" \
	&& echo "" \
	&& return $tru \
	;


	# POSITIONED ARGUMENT --------

	# [ positoined_arguments ]
	local -a _pax=` \
		s_gtCblPax \
	` ;


	# [ method ]
	local mtd__="${_pax[0]}" ;

	# [ file_absolute_path ]
	local fl_abs_pf__="${_pax[1]}" ;


	# NAMED ARGUMENT --------

	# [ named_arguments ]
	local -A _nax=` \
		s_gtCblNax \
			--nfc "f" "enforce" \
	` ;


	# [ enforce ]
	local nfc="${_nax[nfc]}" ;


	# MAIN PROCESS : METHOD --------

	# - action is callable
	if [[ "`
		type \
			-t \
			$mtd__ \
			2>/dev/null \
	`" ]] ;
	then


		shift 1 ;


		"$mtd__" \
			"$@" \
		;


		return $? ;


	fi ;


	# POST PROCESS : REPORT STATUS --------

	return $fls ;


 ) ;
