#!/usr/bin/env bash
# ######################################################################################
# DATA UTILITY
# ######################################################################################
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ARRAY
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ======================================================================================
# DELETE ARRAY INDEX
# ======================================================================================
s_rmArrVlux() {


	# [ arguments ]
	local -a _ax=("$@") ;


	# POSITIONED ARGUMENT --------

	# [ target ]
	local -a tgt__ ;

	# [ subtraction ]
	local -a sub__ ;

	# [ passed_target ]
	local _psd_tgt=$fls ;


	for (( i=0 ; i<${#_ax[@]} ; i ++ )) ;
	do


		[[ "${_ax[$i]}" == -- ]] \
		&& _psd_tgt=$tru \
		&& continue ;


		[[ "$_psd_tgt" == $tru ]] \
		&& sub__+=("${_ax[$i]}") \
		|| tgt__+=("${_ax[$i]}") \
		;


	done ;


	# MAIN PROCESS : REMOVAL --------

	if [[ ${#tgt__[@]} -gt 0 ]] ;
	then

		for (( i=0 ; i<${#sub__[@]} ; i++ )) ;
		do


			# [ target ]
			local _tgt=;


			for (( ii=0 ; ii<${#tgt__[@]} ; ii++ )) ;
			do
				
				[[ "${sub__[$i]}" == "${tgt__[$ii]}" ]] \
				&& _tgt=$ii \
				&& break \
				;

			done ;


			[[ $_tgt ]] \
			&& unset a[$_tgt] \
			&& tgt__=("${tgt__[@]}") \
			;


		done ;

	fi ;


	# POST PROCESS : DISPLAY RESULT --------

	s_cnvArr2Str \
		"${tgt__[@]}" \
	;


} ;



# ======================================================================================
# DELETE ARRAY INDEX
# ======================================================================================
s_dlArrIdx() {


	# [ arguments ]
	local -a _ax=("$@") ;

	# [ result ]
	local _rslt=$tru ;


	# POSITIONED ARGUMENT --------

	# [ index ]
	local idx__="${_ax[0]}" ;


	# PRECHECK : KEY --------

	[[ -z "$idx__" ]] \
	&& return $fls \
	;


	# PRE PROCESS : REBUILD ARGUMENTS --------

	shift ;

	_ax=("$@") ;


	# MAIN PROCESS : EDIT --------

	# [ literal ]
	local -a _ltrl ;

	
	# [ indext ]
	for i in "${!_ax[@]}" ;
	do

		[[ $i -ne $idx__ ]] \
		&& _ltrl+=("'${_ax[$i]}'") \
		;

	done ;


	# POST PROCESS : OUT RESULT --------

	echo "(${_ltrl[@]})" ;


	# POST PROCESS : REPORT STATUS --------

	return $_rslt ;


} ;



# ======================================================================================
# CONVERT ARRAY TO STIRNG
# ======================================================================================
s_cnvArr2Str() {


	# [ arguments ]
	local -a _ax=("$@") ;


	# PRECHECK : KEYS --------

	[[ -z "${_ax[@]}" ]] \
	&& echo '()' \
	&& return $fls \
	;


	# POST PROCESS : OUTPUT RESULT --------

	echo "(" ;

	# [ index ]
	for i in "${!_ax[@]}" ; 
	do

		echo "${S_PPT_ITND}'${_ax[$i]}'" ;

	done ;

	echo ")" ;



	# POST PROCESS : REPORT STATUS --------

	return $tru ;


} ;



# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# DIECTIONARY
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ======================================================================================
# CONVERT DIECTIONARY TO STIRNG
# ======================================================================================
s_cnvDic2Str() {


	# [ arguments ]
	local -a _ax=("$@") ;


	# ARGUMENTS --------

	# [ dictionary_keys ]
	local -a dic_kyx__ ;

	# [ dictionary_values ]
	local -a dic_vlux__ ;

	# [ after_double_slash ]
	local _aftr_dbl_slh=$fls ;


	for (( i=0 ; i<${#_ax[@]} ; i++ )) ;
	do


		[[ "${_ax[$i]}" == -- ]] \
		&& _aftr_dbl_slh=$tru \
		&& continue \
		;


		[[ $_aftr_dbl_slh == $fls ]] \
		&& dic_kyx__+=("${_ax[$i]}") \
		;


		[[ $_aftr_dbl_slh == $tru ]] \
		&& dic_vlux__+=("${_ax[$i]}") \
		;


	done ;



	# PRECHECK : KEYS --------

	[[ -z "${dic_kyx__[@]}" ]] \
	&& echo '()' \
	&& return $fls \
	;


	# POST PROCESS : OUTPUT RESULT --------

	echo "(" ;

	# [ index ]
	for i in "${!dic_kyx__[@]}" ; 
	do

		echo "  [${dic_kyx__[$i]}]='${dic_vlux__[$i]}'" ;

	done ;

	echo ")" ;



	# POST PROCESS : REPORT STATUS --------

	return $tru ;


} ;
