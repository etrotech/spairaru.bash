#!/usr/bin/env bash
# ######################################################################################
# CALLABLE UTILITY
# ######################################################################################
# ======================================================================================
# GET POSITIONED ARGUMENTS
# ======================================================================================
s_gtCblPax() {


	# [ self_arguments ]
	local -a _slf_ax=("$@") ;

	# [ target_arguments ]
	local -n _tgt_ax="_ax" ;


	# NAMED ARGUMENT --------

	# [ defaults ]
	local -A _dfltx ;

	# [ last_default_index ]
	local _lst_dflt_idx ;


	# [ index ]
	for (( i=0 ; i<${#_slf_ax[@]} ; i++ )) ;
	do


		# - not start with dash
		[[ ! "${_slf_ax[$i]}" =~ ^- ]] \
		&& continue \
		;


		# - option is target
		if [[ "${_slf_ax[$i]}" == -- ]] ;
		then


			# - option value not starts with dash
			[[ ! "${_slf_ax[$i+1]}" =~ ^- ]] \
			&& local -n _tgt_ax="${_slf_ax[$i+1]}" \
			;


			break ;


		fi ;


		# [ index ]
		# ^\-(\-|)				: start with single or double hyphen
		# \K 					: reset the start of the match
		# w+					: match anyword
		# (?=\-|) 				: positive lookahead to match until the next hyphen or the end of the line
		local _idx="` \
			echo "${_slf_ax[$i]}" \
			| grep -Poz '^\-(\-|)\K\w+(?=\-|)' \
			| tr -d '\0'
		`" ;


		# - label is not empty
		[[ ! "$_idx" ]] \
		&& continue \
		;


		# [ suffix ]
		# ^\-(\-|)				: start with single or double hyphen
		# \w+\- 				: match anyword untill next hyphen
		# \K 					: reset the start of the match
		# w+					: match anyword
		# (?=\-|) 				: positive lookahead to match until the next hyphen or the end of the line
		local _sfx="` \
			echo "${_slf_ax[$i]}" \
			| grep -Poz '^\-(\-|)\w+\-\K\w+(?=\-|)' \
			| tr -d '\0'
		`" ;


		# A ) DEFAULT

		if [[ "$_sfx" =~ ^(dflt|default)$ ]] ;
		then

			if [[ "${_slf_ax[$i+1]}" =~ ^- ]] ;
			then

				continue ;


			else


				_dfltx[$_idx]="${_slf_ax[$i+1]}" ;


				[[ \
					-z $_lst_dflt_idx \
					|| $_lst_dflt_idx < $_idx \
				]] \
				&& _lst_dflt_idx=$_idx \
				;


				continue 2 ;


			fi ;

		fi ;

	done ;


	# PRECHECK : TARGET ARGUMENTS --------

	[[ -z "${_tgt_ax[@]}" ]] \
	&& echo "()" \
	&& return $fls \
	;


	# PRE PROCESS : DETERMINE ARGUMENT POSITION --------

	# [ positioned_arguemnt_position ]
	local _pa_pos ;


	# - first argeument starts with hyphen
	[[ "${_tgt_ax[0]}" =~ ^- ]] \
	&& _pa_pos="r" \
	|| _pa_pos="f" \
	;


	# MAIN PROCESS : FILTER ARGUMENTS --------

	# [ target_positioned_arguemnts ]
	local -a _tgt_pax ;


	# [ passed_double_hyphen ]
	local _psd_dbl_hypn=$fls ;


	# [ index ]
	for (( i=0 ; i<${#_tgt_ax[@]} ; i++ )) ;
	do


		# - positioned_arguemnt_position is front
		# - argument starts with hyphen
		[[ \
			"$_pa_pos" == "f" \
			&& "${_tgt_ax[$i]}" =~ ^- \
		]] \
		&& break \
		;


		# - positioned_arguemnt_position is rear
		if [[ "$_pa_pos" == "r" ]] ;
		then 


			# - argument is double hyphen
			[[ "${_tgt_ax[$i]}" == -- ]] \
			&& _psd_dbl_hypn=$tru \
			&& continue \
			;


			# - passed_double_hyphen is not yet
			[[ "$_psd_dbl_hypn" == $fls ]] \
			&& continue \
			;


		fi ;


		_tgt_pax+=("${_tgt_ax[$i]}") ;


	done ;


	# MAIN PROCESS : BUILD DEFAULTS --------

	if [[ $_lst_dflt_idx ]] ;
	then

		for (( i=0 ; i<=$_lst_dflt_idx ; i++ )) ;
		do

			[[ -z "${_tgt_pax[$i]}" ]] \
			&& _tgt_pax[$i]="${_dfltx[$i]}" \
			;

		done ;

	fi ;


	# POST PROCESS : OUTPUT RESULT --------

	s_cnvArr2Str \
		"${_tgt_pax[@]}" \
	;


} ;



# ======================================================================================
# GET NAMED ARGUMENTS
# ======================================================================================
s_gtCblNax() {


	# [ self_arguments ]
	local -a _slf_ax=("$@") ;

	# [ target_arguments ]
	local -n _tgt_ax="_ax" ;


	# NAMED ARGUMENT --------

	# [ aliases ]
	local -A _akax ;

	# [ defaults ]
	local -A _dfltx ;

	# [ multiple_asignments ]
	local -a _xasgmtx ;

	# [ number_of_values ]
	local -A _novx ;

	# [ option_keys ]
	local -A _opt_kyx ;

	# [ option_values ]
	local -A _opt_vlux ;


	# [ max ]
	local _max="${#_slf_ax[@]}"


	# [ index ]
	for (( i=0 ; i<${#_slf_ax[@]} ; i++ )) ;
	do


		# - not start with dash
		[[ ! "${_slf_ax[$i]}" =~ ^- ]] \
		&& continue \
		;
		

		# - option is target
		if [[ "${_slf_ax[$i]}" == -- ]] ;
		then


			# - option value not starts with dash
			[[ ! "${_slf_ax[$i+1]}" =~ ^- ]] \
			&& local -n _tgt_ax="${_slf_ax[$i+1]}" \
			;


			break ;


		fi ;


		# [ label ]
		# ^\-(\-|)				: start with single or double hyphen
		# \K 					: reset the start of the match
		# w+					: match anyword
		# (?=\-|) 				: positive lookahead to match until the next hyphen or the end of the line
		local _lbl="` \
			echo "${_slf_ax[$i]}" \
			| grep -Poz '^\-(\-|)\K\w+(?=\-|)' \
			| tr -d '\0'
		`" ;


		# - label is not empty
		[[ ! "$_lbl" ]] \
		&& continue \
		;


		# [ suffix ]
		# ^\-(\-|)				: start with single or double hyphen
		# \w+\- 				: match anyword untill next hyphen
		# \K 					: reset the start of the match
		# w+					: match anyword
		# (?=\-|) 				: positive lookahead to match until the next hyphen or the end of the line
		local _sfx="` \
			echo "${_slf_ax[$i]}" \
			| grep -Poz '^\-(\-|)\w+\-\K\w+(?=\-|)' \
			| tr -d '\0'
		`" ;


		# A ) ALIAS

		# - suffix is not set
		if [[ -z "$_sfx" ]] ;
		then


			# [ count ]
			local _c=1 ;


			_akax[$_lbl]=" $_lbl " ;


			while [[ \
				$_c -lt $_max \
				&& ! "${_slf_ax[$i+$_c]}" =~ ^- \
			]] ;
			do

				_akax[$_lbl]+="${_slf_ax[$i+$_c]} " ;

				(( _c ++ )) ;

			done ;


			# - count is greater than 1
			[[ $_c -gt 1 ]] \
			&& (( _c-- )) \
			;


			continue $_c ;


		# B ) DEFAULT

		elif [[ "$_sfx" =~ ^(dflt|default)$ ]] ;
		then

			if [[ ! "${_slf_ax[$i+1]}" =~ ^- ]] ;
			then

				_dfltx[$_lbl]="${_slf_ax[$i+1]}" ;

				continue 2 ;


			else

				continue ;


			fi ;


		# C ) MUTIPLE ASSIGNMENT

		elif [[ "$_sfx" =~ ^(xasgmt|multiple_asignment)$ ]] ;
		then

			_xasgmtx+=("$_lbl") ;

			continue ;


		# D ) NUMBER OF VALUE

		elif [[ "$_sfx" =~ ^(nov|number_of_value)$ ]] ;
		then

			if [[ ! "${_slf_ax[$i+1]}" =~ ^- ]] ;
			then

				_novx[$_lbl]="${_slf_ax[$i+1]}" ;

				continue 2 ;


			else

				continue ;


			fi ;


		# D ) OPTION

		elif [[ "$_sfx" =~ ^(opt|option)$ ]] ;
		then


			# count
			local _c=1 ;

			# [ option_label ]
			# ^\-(\-|)				: start with single or double hyphen
			# \w+\- 				: match anyword untill next hyphen
			# \w+\- 				: match anyword untill next hyphen
			# \K 					: reset the start of the match
			# w+					: match anyword
			# (?=\-|) 				: positive lookahead to match until the next hyphen or the end of the line
			local _opt_vlu="` \
				echo "${_slf_ax[$i]}" \
				| grep -Poz '^\-(\-|)\w+\-\w+\-\K\w+(?=\-|)' \
				| tr -d '\0'
			`" ;

			# [ keys ]
			local _kyx=" $_opt_vlu " ;


			[[ -z "$_opt_vlu" ]] \
			&& continue $_c \
			;


			while [[ \
				$_c -lt $_max \
				&& ! "${_slf_ax[$i+$_c]}" =~ ^- \
			]] ;
			do

				_kyx+="${_slf_ax[$i+$_c]} " ;

				(( _c ++ )) ;

			done ;


			if [[ "$_kyx" ]] ;
			then

				_opt_kyx["${_kyx}"]="$_lbl" ;

				_opt_vlux["${_kyx}"]="$_opt_vlu" ;

			fi ;


			# - count is greater than 1
			[[ $_c -gt 1 ]] \
			&& (( _c-- )) \
			;


			continue $_c ;


		fi ;


	done ;


	# MAIN PROCESS : FILTER ARGUMENTS --------

	# [ target_named_arguemnts ]
	local -A _tgt_nax ;


	# [ index ]
	for (( i=0 ; i<${#_tgt_ax[@]} ; i++ )) ;
	do


		# - is double dash
		[[ "${_tgt_ax[$i]}" == -- ]] \
		&& continue \
		;


		# - not start with dash
		[[ ! "${_tgt_ax[$i]}" =~ ^- ]] \
		&& continue \
		;


		# A ) Determine Label 

		# [ target_label ]
		# ^\-(\-|)				: start with single or double hyphen
		# \K 					: reset the start of the match
		# w+					: match anyword
		# (?=\-|) 				: positive lookahead to match until the next hyphen or the end of the line
		local _tgt_lbl="` \
			echo "${_tgt_ax[$i]}" \
			| grep -Poz '^\-(\-|)\K\w+(?=\-|)' \
			| tr -d '\0'
		`" ;


		# - label is not set
		[[ -z "$_tgt_lbl" ]] \
		&& continue \
		;


		# B ) Match Label

		# [ matched_label ]
		local _mhd_lbl= ;

		# [ is_options ]
		local _is_opt= ;


		# - alias diectionary has target_label as key
		[[ "${_akax[$_tgt_lbl]}" ]] \
		&& _mhd_lbl="$_tgt_lbl" \
		;


		# ▩ match target_label with aliases if any.

		# - no match found
		if [[ -z "$_mhd_lbl" ]] ;
		then

			# [ key ]
			for ky in "${!_akax[@]}" ;
			do

				[[ "${_akax[$ky]}" =~ " ${_tgt_lbl} " ]] \
				&& _mhd_lbl="$ky" \
				&& break \
				;

			done ;

		fi ;


		# target_label does not match any keys or aliases,
		# continue to match option value if any.

		# - no match found
		if [[ -z "$_mhd_lbl" ]] ;
		then

			# [ key ]
			for ky in "${!_opt_kyx[@]}" ;
			do

				[[ "$ky" =~ " ${_tgt_lbl} " ]] \
				&& _mhd_lbl="${_opt_kyx[$ky]}" \
				&& _is_opt="$ky" \
				&& break \
				;

			done ;

		fi ;


		# - no match found
		[[ -z "$_mhd_lbl" ]] \
		&& continue \
		;


		# C ) Determine Associates

		# [ count ]
		local _c=1 ;

		# [ value ]
		local _vlu= ;

		# [ between ]
		local _btw= ;


		# - number_of_associate is not set
		# - number_of_associate is zero
		if [[ \
			! "${_novx[$_mhd_lbl]}" \
			|| "${_novx[$_mhd_lbl]}" -eq 0
		]] ;
		then

			# - next argument not start with dash
			# - next argument not empty
			[[ \
				! "${_tgt_ax[$i+1]}" =~ ^- \
				&& "${_tgt_ax[$i+1]}" \
			]] \
			&& _tgt_nax[$_mhd_lbl]="${_tgt_ax[$i+1]}" \
			|| _tgt_nax[$_mhd_lbl]=$tru \
			;


		# - number os associate is 1
		elif [[ "${_novx[$_mhd_lbl]}" -eq 1 ]] ;
		then


			# - is an option
			if [[ -n "$_is_opt" ]] ;
			then

				_vlu="${_opt_vlux[$_is_opt]}" ;


			# - next argument not start with dash
			elif [[ ! "${_tgt_ax[$i+1]}" =~ ^- ]] ;
			then

				_vlu="${_tgt_ax[$i+1]}" ;


			fi ;


			# - multiple_assignment option is enabled
			if [[ " ${_xasgmtx[@]} " =~ " ${_mhd_lbl} " ]] ;
			then


				# holder is empty
				[[ -z "${_tgt_nax[$_mhd_lbl]}" ]] \
				&& _tgt_nax[$_mhd_lbl]='()' \
				|| _btw=' ' \
				;


				# ▧ find
				# ^ 				: from start
				# (.*) 				: catch anything
				# \)$ 				: ends with )
				# ▨ replace
				# \1 				: anything captured
				# [[:space:]] 		: and with space
				# \\\"\(xxx\)\\\" 	: and with "(xxx)"
				_tgt_nax[$_mhd_lbl]="` \
					echo "${_tgt_nax[$_mhd_lbl]}" \
					| sed \
						-r \
						-e \
						's/^(.*)\)$/\1'"${_btw}"'\\\"'"${_vlu}"'\\\"\)/g' \
				`" ;


			# - single value
			else

				_tgt_nax[$_mhd_lbl]="${_vlu}" ;


			fi ;


		# - number os associate is greater than 1
		else


			while [[ $_c -le "${_novx[$_mhd_lbl]}" ]] ;
			do


				# - start with dash
				[[ "${_tgt_ax[$i+$_c]}" =~ ^- ]] \
				&& break \
				;


				[[ $_c -gt 1 ]] \
				&& _vlu+=" " \
				;


				_vlu+='\\"'"${_tgt_ax[$i+$_c]}"'\\"' ;


				(( _c ++ )) ;


			done ;


			# - value is not empty
			if [[ "$_vlu" ]] ;
			then

				# - multiple_assignment option is enabled
				if [[ " ${_xasgmtx[@]} " =~ " ${_mhd_lbl} " ]] ;
				then


					# holder is empty
					[[ -z "${_tgt_nax[$_mhd_lbl]}" ]] \
					&& _tgt_nax[$_mhd_lbl]='()' \
					|| _btw=' ' \
					;


					# ▧ find
					# ^ 				: from start
					# (.*) 				: catch anything
					# \)$ 				: ends with )
					# ▨ replace
					# \1 				: anything captured
					# [[:space:]] 		: and with space
					# \\\"\(xxx\)\\\" 	: and with "(xxx)"
					_tgt_nax[$_mhd_lbl]="` \
						echo \
							"${_tgt_nax[$_mhd_lbl]}" \
						| sed \
							-r \
							-e \
							's/^(.*)\)$/\1'"${_btw}"'\\\"('"${_vlu}"')\\\"\)/g' \
					`" ;


				# - otherwise
				else

					_tgt_nax[$_mhd_lbl]="(${_vlu})" ;


				fi ;

			fi ;


			# - count is greater than 1
			[[ $_c -gt 1 ]] \
			&& (( _c-- )) \
			;


		fi ;


		continue $_c ;


	done ;


	# MAIN PROCESS : BUILD DEFAULTS --------

	# [ key ]
	for ky in "${!_akax[@]}" ;
	do


		# A ) DEFALT IS GIVING

		[[ \
			-z "${_tgt_nax[$ky]}" \
			&& "${_dfltx[$ky]}" \
		]] \
		&& _tgt_nax[$ky]="${_dfltx[$ky]}" \
		;


		# B ) NUMBER OF ASSOCIATION IS NOT GIVING

		if \
			[[ -z "${_tgt_nax[$ky]}" ]] \
			&& [[ \
				! "${_novx[$ky]}" \
				|| "${_novx[$ky]}" -eq 0 \
			]] \
		;
		then

			_tgt_nax[$ky]=$fls ;

		fi ;


	done ;


	# C ) MUTIPLE ASSIGNMENT ENABLED

	for (( i=0 ; i < ${#_xasgmtx[@]} ; i++ )) ;
	do


		# [ key ]
		local _ky="${_xasgmtx[$i]}" ;


		[[ -z "${_tgt_nax[$_ky]}" ]] \
		&& _tgt_nax[$_ky]="()" \
		;


		[[ ! "${_tgt_nax[$_ky]}" =~ ^\( ]] \
		&& _tgt_nax[$_ky]="(${_tgt_nax[$_ky]})" \
		;


	done ;


	# POST PROCESS : OUTPUT RESULT --------

	s_cnvDic2Str \
		"${!_tgt_nax[@]}" \
		-- \
		"${_tgt_nax[@]}" \
	;


} ;
