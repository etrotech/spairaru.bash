#!/usr/bin/env bash
# ######################################################################################
# DOCUMENT UTILITY
# ######################################################################################
# ======================================================================================
# APPLY DOCUMENT ACTIONS
# ======================================================================================
s_aplyDocAtnx() {


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

	# [ action ]
	local atn__="${_pax[1]}" ;


	# MAIN PROCESS : REBUILD INPUTS --------

	local -a _ax=` \
		s_dlArrIdx \
			1 \
			"${_ax[@]}" \
	` ;

	local -a _pax=` \
		s_dlArrIdx \
			1 \
			"${_pax[@]}" \
	` ;


	# MAIN PROCESS : INSERT LAST LANEBREAK --------

	# [ last_lane ]
	local _lst_ln="${#_pax[@]}" ;


	(( _lst_ln -- )) ;


	# ▧ find 
	# $ 					: very end
	# ▨ replace
	# & 					: at the end
	# \\\^\\\\| 			: append linebreak
	_ax[$_lst_ln]="`
		echo "${_ax[$_lst_ln]}" \
		| sed \
			-r \
			's/$/&\\\^\\\|/g' \
	`" ;


	# MAIN PROCESS : EDIT DOCUMENT --------

	# ACTION ) ADD

	if [[ $atn__ == "ad" ]] ;
	then

		# i ) Relocation Rule Exists

		# 1 		: action
		# 2 		: file absolute path
		# 3... 		: contents
		if \
			s \
				doc \
					hs \
						"${_pax[@]}" \
		;
		then

			_rslt=2 ;


		# ii ) Relocation Rule not Exists
		else

			# 1 	: action
			# 2 	: content
			# 3 	: file absolute path
			# 4... 	: contents
			s \
				doc \
					wrt \
						"${_ax[@]}" \
			;

			_rslt=$? ;


		fi ;


	# ACTION ) REMOVE

	elif [[ $atn__ == "rm" ]] ;
	then

		# i ) Relocation Rule Exists

		# 1 		: action
		# 2 		: file absolute path
		# 3... 		: contents
		if \
			s \
				doc \
					hs \
						"${_pax[@]}" \
		;
		then

			# 1 		: action
			# 2 		: file absolute path
			# 3... 		: contents
			s \
				doc \
					ers \
						"${_ax[@]}" \
			;
				
			_rslt=$? ;


		# ii ) Relocation Rule not Exists
		else

			_rslt=2 ;


		fi ;


	# ACTION ) QUERY

	else


		# ▧ find 
		# $ 					: very end
		# ▨ replace
		# & 					: at the end
		# \n 					: append linebreak
		# _pax[$_lst_ln]="`
		# 	echo "${_pax[$_lst_ln]}" \
		# 	| sed \
		# 		-r \
		# 		-e \
		# 		's/$/&\\\n/g' \
		# `" ;


		# * index starts from 1, 1 is document path.

		# [ index ]
		for (( i=1 ; i < ${#_pax[@]} ; i ++ )) ;
		do

			echo "${_pax[$i]}" ;

		done ;


	fi ;


	# POST PROCESS : REPORT STATUS --------

	return $_rslt ;


} ;



# ======================================================================================
# GET DOCUMENT LANEBREAK CHARACTOR
# ======================================================================================
s_gtDocLnBrkChr() {


	# [ arguments ]
	local -a _ax=("$@") ;


	# POSITIONED ARGUMENT --------

	# [ positoined_arguments ]
	local -a _pax=` \
		s_gtCblPax \
	` ;


	# [ file_path ]
	local fl_pf__="${_pax[0]}" ;


	# PRECHECK : FILE ARGUMENT --------

	[[ -z "$fl_pf__" ]] \
	&& echo "$S_DOC_DFLT_LNBRK" \
	&& return $fls \
	;


	# PRECHECK : FILE EXISTENCE --------

	[[ ! -f "$fl_pf__" ]] \
	&& echo "$S_DOC_DFLT_LNBRK" \
	&& return $fls \
	;


	# MAIN PROCESS : MATCH FORMAT --------
	
	[[ \
		"` \
		cat \
			-A \
				"$fl_pf__" \
		`" \
		=~ "^M" \
	]] \
	&& echo '\r\n' \
	|| echo '\n' \
	;


	# POST PROCESS : REPORT STATUS --------

	return $tru ;


} ;



# ======================================================================================
# GET DOCUMENT OPTIONS
# ======================================================================================
s_gtDocOptx() {


	# [ arguments ]
	local -a _ax=("$@") ;


	# MAIN PROCESS : INSERT LAST LANEBREAK --------

	# [ options ]
	local -a _optx ;


	# [ argument ]
	for a in "${_ax[@]}" ;
	do


		# argument is double dash
		[[ "$_a" =~ --$ ]] \
		&& break \
		;


		# - options is not empty
		# - start with dash
		[[ \
			-n "$_optx" \
			|| "$a" =~ ^-
		]] \
		&& _optx+=("'$a'") \
		;


	done ;


	# POST PROCESS : OUT RESULT --------

	echo "(${_optx[@]})" ;


	# POST PROCESS : REPORT STATUS --------

	return $tru ;


} ;



# ======================================================================================
# COMMENT OUT DOCUMENT LINES
# ======================================================================================
s_coDocLnx() {


	# [ arguments ]
	local -a _ax=("$@") ;


	# POSITIONED ARGUMENT --------

	# [ positoined_arguments ]
	local -a _pax=` \
		s_gtCblPax \
	` ;


	# NAMED ARGUMENT --------

	# [ named_arguments ]
	local -A _nax=` \
		s_gtCblNax \
			--rtn_typ "return_type" \
			--rtn_typ-dflt "arr" \
			--rtn_typ-nov 1 \
	` ;


	# [ return_type ]
	local rtn_typ="${_nax[rtn_typ]}" ;


	# PRECHECK : CONTENT ARGUMENTS --------

	[[ "${#_pax[@]}" == 0 ]] \
	&& s_cnvArr2Str \
	;


	# MAIN PROCESS : COMMENT OUT CONTENTS --------

	# [ lines ]
	local -a _lnx ;

	# [ comment_out_mark ]
	local _co_mrk="#" ;


	# [ index ]
	for i in "${!_pax[@]}" ;
	do


		# - if line is not start with "# "
		if [[ ! "${_ax[$i]}" =~ '^'"$_co_mrk"' ' ]] ;
		then

			_lnx[$i]="# ${_ax[$i]}" ;

		fi ;


		_lnx[$i]="` \
			echo \
				"${_lnx[$i]}" \
			| sed \
				-r \
				-e 's/\\\\\^\\\\\|\'"$_co_mrk"' /\_\_\@\_\_/g' \
				-e 's/(\\\\\^\\\\\|)/\1\# /g' \
				-e 's/\_\_\@\_\_/\^\|\\\\\^\\\\\|\'"$_co_mrk"' /g' \
		`" ;


	done ;


	# MAIN PROCESS : OUTPUT RESULT --------

	if [[ "$rtn_typ" =~ ^(str|string)$ ]] ;
	then

		echo "${_lnx[@]}" ;


	else

		s_cnvArr2Str \
			"${_lnx[@]}" \
		;


	fi ;


} ;



# ======================================================================================
# CONVERT DOCUMENT LINES TO LINE
# ======================================================================================
s_cnvDocLnx2Ln() {


	# PRECHECK : CONTENT ARGUMENTS --------

	[[ ! "$@" ]] \
	&& echo "" \
	;


	# PRE PROCESS : BUILD CONTENTS --------

	# [ converted_line ]
	local _cnvtd_ln ;


	# [ line ]
	for ln in "$@" ;
	do

		[[ "$_cnvtd_ln" ]] \
		&& _cnvtd_ln="$_cnvtd_ln"'\^\|'"$ln" \
		|| _cnvtd_ln="$ln" \
		;

	done ;


	# MAIN PROCESS : OUTPUT RESULT --------

	echo "$_cnvtd_ln" ;


} ;
