#!/usr/bin/env bash
# ######################################################################################
# ETRO TECH DEFINE
# ######################################################################################
# --------------------------------------------------------------------------------------
# BASIC
# --------------------------------------------------------------------------------------

# etro_title
[[ -z "$ET_TTL" ]] \
&& declare -r ET_TTL="EtroTech" \
;



# --------------------------------------------------------------------------------------
# USER
# --------------------------------------------------------------------------------------

# real_user
[[ "$SUDO_USER" ]] \
&& declare -r RL_USR="$SUDO_USER" \
|| declare -r RL_USR="$USER" \
;


# real_home
declare -r RL_HM="` \
	getent \
		passwd \
		"$RL_USR" \
	| cut \
		-d: \
		-f6 \
`" \
;




# ######################################################################################
# SPAIRARU DEFINE
# ######################################################################################
# --------------------------------------------------------------------------------------
# SPAIRARU
# --------------------------------------------------------------------------------------

# spairau_name
declare -r S_NM="s.bash" ;

# spairau_title
declare -r S_TTL="spairaru.bash" ;

# spairau_version
declare -r S_VER="0.5.0" ;

# spairau_command_line_interface 
declare -r S_S_CLI="s" ;

declare -r S_L_CLI="spairaru" ;


# spairau_archive_url
# declare -r S_APP_ARC_URL="https://raw.githubusercontent.com/etrotech/${S_TTL}/${S_VER}/dist/${S_TTL}.tar.gzip" ;
declare -r S_APP_ARC_URL="https://raw.githubusercontent.com/etrotech/${S_TTL}/${S_VER}/src/${S_TTL}.tar.gzip" ;



# --------------------------------------------------------------------------------------
# LOCATIONAL
# --------------------------------------------------------------------------------------

# 	📦
# 	└─ 🖿 opt
# 	   └─ 🖿 EtroTech spairaru.bash 👈
# 	      └─ 🖺 spairaru.sh

declare -r S_APP_FLDR="/opt/${ET_TTL} ${S_TTL}" ;

# 	📦
# 	└─ 🖿 opt
# 	   └─ 🖿 EtroTech spairaru.bash
# 	      └─ 🖺 spairaru.sh 👈

declare -r S_APP_EXC_FL="${S_APP_FLDR}/spairaru.sh" ;


# 	🛠️
# 	├─ 🖿 etc
# 	│  └─ 🖿 EtroTech spairaru.bash 👈
# 	│     ├─ 🖺 *.env
# 	│     ├─ 🖺 s.cnf
# 	│     └─ 🖺 *.ini
# 	├─ 🖿 $HOME
# 	│  └─ 🖿 .s.bash
# 	│     ├─ 🖺 *.env
# 	│     ├─ 🖺 s.cnf
# 	?     └─ 🖺 *.ini
# 	└─ 🖿 $PWD
# 	   └─ 🖿 .s.bash
# 	      ├─ 🖺 *.env
# 	      ├─ 🖺 s.cnf
# 	      └─ 🖺 *.ini

declare -r S_D_CNF_FLDR="/etc/${ET_TTL} ${S_TTL}" ;

# 	🛠️
# 	├─ 🖿 etc
# 	│  └─ 🖿 EtroTech spairaru.bash
# 	│     ├─ 🖺 *.env
# 	│     ├─ 🖺 s.cnf 👈
# 	│     └─ 🖺 *.ini
# 	├─ 🖿 $HOME
# 	│  └─ 🖿 .s.bash
# 	│     ├─ 🖺 *.env
# 	│     ├─ 🖺 s.cnf
# 	?     └─ 🖺 *.ini
# 	└─ 🖿 $PWD
# 	   └─ 🖿 .s.bash
# 	      ├─ 🖺 *.env
# 	      ├─ 🖺 s.cnf
# 	      └─ 🖺 *.ini

declare -r S_D_CNF_FL="${S_D_CNF_FLDR}/${S_S_CLI}.cnf" ;

# 	🛠️
# 	├─ 🖿 etc
# 	│  └─ 🖿 EtroTech spairaru.bash
# 	│     ├─ 🖺 *.env
# 	│     ├─ 🖺 s.cnf
# 	│     └─ 🖺 *.ini
# 	├─ 🖿 $HOME
# 	│  └─ 🖿 .s.bash 👈
# 	│     ├─ 🖺 *.env
# 	│     ├─ 🖺 s.cnf
# 	?     └─ 🖺 *.ini
# 	└─ 🖿 $PWD
# 	   └─ 🖿 .s.bash
# 	      ├─ 🖺 *.env
# 	      ├─ 🖺 s.cnf
# 	      └─ 🖺 *.ini

declare -r S_G_CNF_FLDR="${RL_HM}/.${S_NM}" ;

# 	🛠️
# 	├─ 🖿 etc
# 	│  └─ 🖿 EtroTech spairaru.bash
# 	│     ├─ 🖺 *.env
# 	│     ├─ 🖺 s.cnf
# 	│     └─ 🖺 *.ini
# 	├─ 🖿 $HOME
# 	│  └─ 🖿 .s.bash
# 	│     ├─ 🖺 *.env
# 	│     ├─ 🖺 s.cnf 👈
# 	?     └─ 🖺 *.ini
# 	└─ 🖿 $PWD
# 	   └─ 🖿 .s.bash
# 	      ├─ 🖺 *.env
# 	      ├─ 🖺 s.cnf
# 	      └─ 🖺 *.ini

declare -r S_G_CNF_FL="${S_G_CNF_FLDR}/${S_S_CLI}.cnf" ;

# 	📄
# 	└─ 🖿 var
# 	   └─ 🖿 log
# 	      └─ 🖿 EtroTech spairaru.bash 👈

declare -r S_LOG_FLDR="/var/log/${ET_TTL} ${S_TTL}" ;

# 	🗑️
# 	└─ 🖿 tmp
# 	   └─ 🖿 EtroTech spairaru.bash 👈

declare -r S_TMP_FLDR="/tmp/${ET_TTL} ${S_TTL}" ;




# ######################################################################################
# OVERRIGHT DEFINE
# ######################################################################################

# True
declare -r tru=0 ;

# False
declare -r fls=1 ;



# ######################################################################################
# ANSI DEFINE
# ######################################################################################

# ansi_open_escape
declare -r ANSI_="\033[" ;

# ansi_close_tag
declare -r _ANSI="${ANSI_}0m" ;




# ######################################################################################
# ANSI COLOR DEFINE
# ######################################################################################
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# FONT
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# --------------------------------------------------------------------------------------
# REGULAR WEIGHT
# --------------------------------------------------------------------------------------

# red
declare -r ANSI_F_RD="${ANSI_}0;31m" ;

# green
declare -r ANSI_F_GN="${ANSI_}0;32m" ;

# orange
declare -r ANSI_F_OR="${ANSI_}0;33m" ;

# blue
declare -r ANSI_F_BL="${ANSI_}0;34m" ;

# purple
declare -r ANSI_F_ID="${ANSI_}0;35m" ;

# teal
declare -r ANSI_F_TL="${ANSI_}0;36m" ;

# light_grey
declare -r ANSI_F_LG="${ANSI_}0;37m" ;

# grey
declare -r ANSI_F_GR="${ANSI_}0;90m" ;

# pink
declare -r ANSI_F_PK="${ANSI_}0;91m" ;

# lime
declare -r ANSI_F_LM="${ANSI_}0;92m" ;

# yellow
declare -r ANSI_F_YL="${ANSI_}0;93m" ;

# cyan
declare -r ANSI_F_CN="${ANSI_}0;94m" ;

# magenta
declare -r ANSI_F_PR="${ANSI_}0;95m" ;

# mint
declare -r ANSI_F_MI="${ANSI_}0;96m" ;



# --------------------------------------------------------------------------------------
# BOLD WEIGHT
# --------------------------------------------------------------------------------------

# light_grey
declare -r ANSI_F_W6_LG="${ANSI_}1;37m" ;

# dark_grey
declare -r ANSI_F_W6_GR="${ANSI_}1;90m" ;




# ######################################################################################
# ANSI PROMPT DEFINE
# ######################################################################################

# ansi_cursor_save
declare -r ANSI_CRSR_SV="${ANSI_}s" ;

# ansi_cursor_restore
declare -r ANSI_CRSR_RSTR="${ANSI_}u" ;




# ######################################################################################
# DOCUMENT DEFINE
# ######################################################################################

# document_default_linebreak
declare -r S_DOC_DFLT_LNBRK='\n' ;




# ######################################################################################
# PROMPT DEFINE
# ######################################################################################

# prompt_intend
declare -r S_PPT_ITND="  " ;

# [ prompt_max_rows ]
declare S_PPT_MAX_ROWX ;




# ######################################################################################
# PROMPT PROGRESS BAR DEFINE
# ######################################################################################

# prompt_progress_bar_template
declare S_PPT_PB_TPL ;

# prompt_progress_bar_title
declare S_PPT_PB_TTL ;

# prompt_progress_bar_prefix
declare S_PPT_PB_PFX ;

# prompt_progress_bar_suffix
declare S_PPT_PB_SFX ;


# prompt_progress_bar_percentage_total
declare S_PPT_PB_PCT_TOL ;

# prompt_progress_bar_percentage_text_location
declare S_PPT_PB_PCT_TXT_LOC ;

# prompt_progress_bar_percentage_bar_prefix
declare S_PPT_PB_PCT_BR_PFX ;

# prompt_progress_bar_percentage_bar_suffix
declare S_PPT_PB_PCT_BR_SFX ;

# prompt_progress_bar_percentage_bar_suffix
declare S_PPT_PB_PCT_BR_SFX ;


# rompt_progress_bar_completion_symbol_charactor
declare S_PPT_PB_CPLTN_SMBL_CHAR ;

# rompt_progress_bar_completion_symbol_color
declare S_PPT_PB_CPLTN_SMBL_CLR ;

# rompt_progress_bar_remainder_symbol_charactor
declare S_PPT_PB_RMNDR_SMBL_CHAR ;

# rompt_progress_bar_remainder_symbol_color
declare S_PPT_PB_RMNDR_SMBL_CLR ;




# ######################################################################################
# DATA UTILITY
# ######################################################################################
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




# ######################################################################################
# ALTERNATIVE UTILITY
# ######################################################################################
# ======================================================================================
# COMPARE VERSION
# ======================================================================================
s_compVer() {


	# [ arguments ]
	local -a _ax=("$@") ;

	# [ result ]
	local _rslt=$tru ;


	# POSITIONED ARGUMENT --------

	# [ positoined_arguments ]
	local -a _pax=` \
		s_gtCblPax
	` ;


	# [left_version ]
	local l_ver__="${_pax[0]}" ;

	# [right_version ]
	local r_ver__="${_pax[1]}" ;


	# MAIN PROCESS : COMPARE --------

	if [[ "$l_ver__" == "$r_ver__" ]] ;
	then

		_rslt=$tru ;


	else

		# if left is greater, the result will be 1.
		# if equal or right is greater, the result will be 0.

		printf \
			'%s\n' \
				"$l_ver__" \
				"$r_ver__" \
		| sort \
			-C \
			-V \
		;

		_rslt=$? ;


		[[ $_rslt == $fls ]] \
		&& _rslt=$tru \
		|| _rslt=$fls \
		;


	fi ;


	# POST PROCESS : REPORT STATUS --------

	return $_rslt ;


} ;



# ======================================================================================
# GET ICON
# ======================================================================================
s_gtIco() {


	# [ arguments ]
	local -a _ax=("$@") ;

	# [ result ]
	local _rslt=$tru ;


	# POSITIONED ARGUMENT --------

	# [ positoined_arguments ]
	local -a _pax=` \
		s_gtCblPax \
	` ;


	# [ icon ]
	local ico__="${_pax[0]}" ;


	# PRE PROCESS : ICON --------

	[[ -z "$ico__" ]] \
	&& return $fls \
	;


	# MAIN PROCESS : ICON --------

	case "$ico__" in


		# headline_box
		hlbx | headline_box ) printf "🟄" ;;

		# section_box
		secbx | section_box ) printf "☐ " ;;

		# sccuess_box
		sucbx | sccuess_box ) printf "😀 " ;;

		# failure_box
		flbx | failure_box ) printf "😵 " ;;

		# ok_box
		okbx | ok_box ) printf "☑ " ;;

		# no_box
		nobx | no_box ) printf "☒ " ;;

		# loading_box
		ldbx | loading_box ) printf "" ;;


		# file
		fl | file ) printf "🖺" ;;

		# folder
		fldr | folder ) printf "🖿" ;;
	
		# grave
		grv | grave ) printf "† " ;;


		# internet
		inet | internet ) printf "🌐 " ;;

		# link
		lnk | link ) printf " 🡔🡖" ;;

		# transfer
		xfr | transfer ) printf " 🡖" ;;

		# increase
		icr | increase ) printf "◆ 🡒" ;;

		# decrease
		dcr | decrease ) printf "◇ 🡐" ;;


		# git
		git ) printf "" ;;


		# otherwise
		* ) _rslt=2 ;;


	esac ;


	# POST PROCESS : REPORT STATUS --------

	[[ $_rslt == 2 ]] \
	&& return $fls \
	|| return $_rslt \
	;


} ;




# ######################################################################################
# LOCALE UTILITY
# ######################################################################################
# ======================================================================================
# LOCALE
# ======================================================================================
__ () {


	# [ arguments ]
	local -a _ax=("$@") ;


	# POSITIONED ARGUMENT --------

	# [ positoined_arguments ]
	local -a _pax=` \
		s_gtCblPax \
	` ;


	# [ main_text ]
	local mn_txt__="${_pax[0]}" ;

	# [ fragments ]
	local -a frgx__=("${_pax[@]:1}") ;


	# PRE PROCESS : MAIN TEXT --------

	# translate here...


	# MAIN PROCESS : REPLACEMENT --------

	# [ index ]
	for i in "${!frgx__[@]}" ;
	do


		# translate here...


		frgx__[$i]="$(printf "${frgx__[$i]}")" ;


	done ;


	# MAIN PROCESS : TRANSLATE --------

	printf "$mn_txt__" "${frgx__[@]}" ;


} ;




# ######################################################################################
# TERMINAL CORE UTILITY
# ######################################################################################
# ======================================================================================
# GET TERMINAL COLUMNS
# ======================================================================================
s_gtTmlRowx() {


	stty \
		size \
	| cut \
		-d ' ' \
		-f1 \
	;


} ;



# ======================================================================================
# GET TERMINAL COLUMNS
# ======================================================================================
s_gtTmlColx() {


	stty \
		size \
	| cut \
		-d ' ' \
		-f2 \
	;


} ;




# ######################################################################################
# PROMPT UTILITY
# ######################################################################################
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# DEFAULT STATUS
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ======================================================================================
# INVOKER VERBOSE TEMPLATE - ACCEPT
# ======================================================================================
s_ivkPptTpl_DfltAcpt () {


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
				--wc "with_condition"\
	` ;


	# [ with_condition ]
	local wc="${_nax[wc]}" ;


	# MAIN PROCESSES --------

	if [[ $wc == $tru ]] ;
	then

		printf \
			"${ANSI_F_YL}`s_gtIco "okbx"`${_ANSI}%s\n" \
			"`__ "${_pax[@]}"`" \
		;


	else

		printf \
			"${ANSI_F_GN}`s_gtIco "okbx"`${_ANSI}%s\n" \
			"`__ "${_pax[@]}"`" \
		;


	fi ;


	# POST PROCESS : REPORT STATUS --------

	return $tru ;


} ;



# ======================================================================================
# INVOKER VERBOSE TEMPLATE - REJECT
# ======================================================================================
s_ivkPptTpl_DfltRej () {


	# MAIN PROCESSES --------

	printf \
		"${ANSI_F_RD}`s_gtIco "nobx"`${_ANSI}%s\n" \
		"`__ "$@"`" \
	;


	# POST PROCESS : REPORT STATUS --------

	return $tru ;


} ;



# ======================================================================================
# INVOKER VERBOSE TEMPLATE - FAILURE
# ======================================================================================
s_ivkPptTpl_DfltFl () {


	# MAIN PROCESSES --------

	printf \
		"\n\n${ANSI_F_RD}`s_gtIco "flbx"`${_ANSI}${ANSI_F_RD}%s${_ANSI}\n\n" \
		"`__ "$@"`" \
	;


	# POST PROCESS : REPORT STATUS --------

	return $tru ;


} ;



# ======================================================================================
# INVOKER VERBOSE TEMPLATE - SUCCESS
# ======================================================================================
s_ivkPptTpl_DfltSuc () {


	# MAIN PROCESSES --------

	printf \
		"\n\n${ANSI_F_GN}`s_gtIco "sucbx"`${_ANSI}${ANSI_F_GN}%s${_ANSI}\n\n\n" \
		"`__ "$@"`" \
	;


	# POST PROCESS : REPORT STATUS --------

	return $tru ;


} ;



# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# DEFAULT DECORATIVE
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ======================================================================================
# INVOKER VERBOSE TEMPLATE - CODING CANVAS
# ======================================================================================
s_ivkPptTpl_DfltCdgCnvs () {


	# MAIN PROCESSES --------

	echo "" ;

	for ln in "$@" ;
	do 

		printf \
			"${S_PPT_ITND}%s${S_PPT_ITND}\n" \
			"`printf "$ln"`" \
		;

	done ;


	# POST PROCESS : REPORT STATUS --------

	return $tru ;


} ;



# ======================================================================================
# INVOKER PROMPT TEMPLATE - SECTION TITLE
# ======================================================================================
s_ivkPptTpl_DfltSecTtl () {


	# MAIN PROCESSES --------

	# [ title ]
	local _ttl="`__ "$@"`" ;


	printf \
		"\n\n`s_gtIco "hlbx"`${ANSI_F_GR}%s${_ANSI}\n" \
		"${_ttl^^}" \
	;


	# POST PROCESS : REPORT STATUS --------

	return $tru ;


} ;



# ======================================================================================
# INVOKER VERBOSE TEMPLATE - BLOCK TITLE
# ======================================================================================
s_ivkPptTpl_DfltBlkTtl () {


	# MAIN PROCESSES --------

	printf \
		"${ANSI_F_W6_GR}--------------------------------\n" \
	;

	printf \
		"${ANSI_F_GR}`s_gtIco "secbx"`${_ANSI}%s\n" \
		"`__ "$@"`" \
	;


	# POST PROCESS : REPORT STATUS --------

	return $tru ;


} ;



# ======================================================================================
# INVOKER VERBOSE TEMPLATE - BLOCK CONTENT
# ======================================================================================
s_ivkPptTpl_DfltBlkCnt () {


	# MAIN PROCESSES --------


	printf \
		"${S_PPT_ITND}%s\n" \
		"`__ "$@"`" \
	;


	# POST PROCESS : REPORT STATUS --------

	return $tru ;


} ;



# ======================================================================================
# INVOKER PROMPT TEMPLATE - BLOCK STREAM
# ======================================================================================
s_ivkPptTpl_DfltBlkStrm () {


	# [ arguments ]
	local _ax=("$@") ;

	# [ result ]
	local _rslt ;

	# [ temporary_file_absolute_path ]
	local _tmp_fl_abs_pf="$S_TMP_FLDR"/ppt/DfltBlkStrm ;


	# TREAP ********

	__s_ivkPptTpl_DfltBlkStrm__T() {


		# POST PROCESS : TEMPORARY FILE --------

		# P 			: process id
		# 1 			: command

		[[ $_tail_pid ]] \
		&& pkill \
			-P $_tail_pid \
			tail \
		;


		_tail_pid=;


		# POST PROCESS : TEMPORARY FILE --------

		rm \
			-fr \
			"$_tmp_fl_abs_pf" \
		;


	} ;


	# ********


	# PRECHECK : COMMAND --------

	[[ -z "$@" ]] \
	&& return $fls \
	;


	# PRE PROCESS : TEMPORARY FILE --------

	[[ ! -d "$S_TMP_FLDR"/ppt ]] \
	&& mkdir \
		-p \
		"$S_TMP_FLDR"/ppt \
	;


	[[ ! -f "$_tmp_fl_abs_pf" ]] \
	&& touch\
		"$_tmp_fl_abs_pf" \
	;


	# MAIN PROCESS : MONITOR PROGROAM --------

	# [ tail_process_id ]
	local _tail_pid ;


	tail \
		-f \
		"$_tmp_fl_abs_pf" \
		2>/dev/null \
	| sed \
		's/^/'"${S_PPT_ITND}"'&/g' \
	& _tail_pid=$! \
	;


	trap \
		'__s_ivkPptTpl_DfltBlkStrm__T' \
		SIGINT \
		SIGTERM \
	;


	# MAIN PROCESS : RECORD PROGROAM --------

	# ↓ any outputs will write in to destination instantly.
	"$@" \
		> "$_tmp_fl_abs_pf" \
		2>&1 \
	;


	_rslt=$? ;


	# POST PROCESS : TEMPORARY FILE --------


	trap \
		'-' \
		SIGINT \
		SIGTERM \
	;


	__s_ivkPptTpl_DfltBlkStrm__T ;


	# POST PROCESS : REPORT STATUS --------

	return $_rslt ;


} ;



# ======================================================================================
# INVOKER VERBOSE TEMPLATE - PROGRESS
# ======================================================================================
s_ivkPptTpl_DfltPgrc() {


	# MAIN PROCESSES --------

	printf \
		"${ANSI_F_YL}`s_gtIco "ldbx"`${_ANSI} %s\n" \
		"`__ "$@"`" \
	;


	# POST PROCESS : REPORT STATUS --------

	return $tru ;


} ;



# ======================================================================================
# INVOKER VERBOSE TEMPLATE - TRANSFERAL ACTIONS
#
# Description:
# 	Template for filesystem action of Move and Link.
#
# ======================================================================================
s_ivkPptTpl_FsXfrlAtnx() {


	# [ arguments ]
	local -a _ax=("$@") ;


	# NAMED ARGUMENT --------

	# [ named_arguments ]
	local -A _nax=` \
		s_gtCblNax \
			--atn "a" "action"\
			--atn-nov 1 \
			\
			--stt "s" "status" \
			--stt-nov 1 \
			\
			--src_cat "sc" "source_category" \
			--src_cat-nov 1 \
			--src_ico "si" "source_icon" \
			--src_ico-nov 1 \
			--src_pf "sp" "source_path" \
			--src_pf-nov 1 \
			--src_ttl "st" "source_title" \
			--src_ttl-nov 1 \
			\
			--dst_cat "dc" "destination_category" \
			--dst_cat-nov 1 \
			--dst_ico "dst" "destination_icon" \
			--dst_ico-nov 1 \
			--dst_pf "dp" "destination_path" \
			--dst_pf-nov 1 \
			--dst_ttl "dt" "destination_title" \
			--dst_ttl-nov 1 \
	` ;


	# [ action ]
	local atn="${_nax[atn]}" ;

	# [ status ]
	local stt="${_nax[stt]}" ;


	# [ source_path ]
	local src_pf="${_nax[src_pf]}" ;

	# [ destination_path ]
	local dst_pf="${_nax[dst_pf]}" ;


	# PRE PROCESS : SOURCE CATEGORY --------

	# [ source_category ]
	local _src_cat ;


	if [[ \
		-z "${_nax[src_cat]}" \
		&& -n "$src_pf" \
	]] ;
	then

		if [[ "$atn" =~ ^(dwld|download)$ ]] ;
		then 

			_src_cat="remote" ;


		elif [[ -d "$src_pf" ]] ;
		then

			_src_cat="folder" ;


		elif [[ -f "$src_pf" ]] ;
		then

			_src_cat="file" ;


		fi ;


	else

		_src_cat="${_nax[src_cat]}" ;


	fi ;


	# PRE PROCESS : SOURCE ICON --------

	# [ source_icon ]
	local _src_ico ;


	if [[ \
		-z "${_nax[src_ico]}" \
		&& -n "$src_pf" \
	]] ;
	then

		if [[ "$atn" =~ ^(dwld|download)$ ]] ;
		then 

			_src_ico="`s_gtIco inet`" ;


		elif [[ -d "$src_pf" ]] ;
		then

			_src_ico="`s_gtIco fldr`" ;


		elif [[ -f "$src_pf" ]] ;
		then

			_src_ico="`s_gtIco fl`" ;


		fi ;


	else

		_src_ico="`s_gtIco ${_nax[src_ico]}`" ;


	fi ;


	# PRE PROCESS : SOURCE TITLE --------

	# [ source_title ]
	local _src_ttl ;


	[[ -n "${_nax[src_ttl]}" ]] \
	&& _src_ttl="${ANSI_F_BL}${_nax[src_ttl]}${_ANSI} " \
	;


	# PRE PROCESS : DESTINATION CATEGORY --------

	# [ destination_category ]
	local _dst_cat ;


	if [[ \
		-z "${_nax[dst_cat]}" \
		&& -n "$dst_pf" \
	]] ;
	then

		if [[ -d "$dst_pf" ]] ;
		then

			_dst_cat="folder" ;


		elif [[ -f "$dst_pf" ]] ;
		then

			_dst_cat="file" ;


		fi ;


	else

		_dst_cat="${_nax[dst_cat]}" ;


	fi ;


	# PRE PROCESS : DESTINATION ICON --------

	# [ destination_icon ]
	local _dst_ico ;


	if [[ \
		-z "${_nax[dst_ico]}" \
		&& -n "$dst_pf" \
	]] ;
	then

		if [[ -d "$dst_pf" ]] ;
		then

			_dst_ico="`s_gtIco fldr`" ;


		elif [[ -f "$dst_pf" ]] ;
		then

			_dst_ico="`s_gtIco fl`" ;


		fi ;


	else

		_dst_ico="`s_gtIco ${_nax[dst_ico]}`" ;


	fi ;


	# PRE PROCESS : DESTINATION TITLE --------

	# [ destination_title ]
	local _dst_ttl ;


	[[ -n "${_nax[dst_ttl]}" ]] \
	&& _dst_ttl="${ANSI_F_BL}${_nax[dst_ttl]}${_ANSI} " \
	;


	# PRE PROCESS : DESTINATION ACTION ICON --------

	# [ action_icon ]
	local _atn_ico ;


	if [[ "$atn" =~ ^(lnk|link)$ ]] ;
	then

		_atn_ico="`s_gtIco lnk`" ;


	elif [[ "$atn" =~ ^(mv|move)$ ]] ;
	then

		_atn_ico="`s_gtIco xfr`" \
	

	elif [[ "$atn" =~ ^(dwld|download)$ ]] ;
	then

		_atn_ico="`s_gtIco xfr`" \


	fi ;


	# MAIN PROCESS : STATUS 0 --------

	if [[ $stt == $tru ]] ;
	then


		# A ) LINK

		if [[ "$atn" =~ ^(lnk|link)$ ]] ;
		then

			s_ivkPptTpl_DfltAcpt \
				"%s%s is created." \
				"$_dst_ttl" \
				"$_dst_cat" \
			;


		# B ) MOVE

		elif [[ "$atn" =~ ^(mv|move)$ ]] ;
		then

			s_ivkPptTpl_DfltAcpt \
				"%s%s is moved." \
				"$_src_ttl" \
				"$_src_cat" \
			;


		# C ) DOWNLAOD

		elif [[ "$atn" =~ ^(dwld|download)$ ]] ;
		then

			s_ivkPptTpl_DfltAcpt \
				"%s%s is download." \
				"$_src_ttl" \
				"$_src_cat" \
			;

		fi ;


		[[ \
			"$src_pf" \
			&& "$dst_pf" \
		]] \
		&& s_ivkPptTpl_DfltBlkCnt \
			"${ANSI_F_LG}${_src_ico}${_ANSI}${ANSI_F_CN}%s${_ANSI}" \
			"${src_pf/$PWD\//\./}" \
		&& s_ivkPptTpl_DfltBlkCnt \
			"${ANSI_F_LG}${_atn_ico}${_ANSI}${ANSI_F_LG}${_dst_ico}${_ANSI}${ANSI_F_CN}%s${_ANSI}" \
			"${dst_pf/$PWD\//\./}" \
		;


	# MAIN PROCESS : STATUS 2 --------

	elif [[ $stt == 2 ]] ;
	then

		s_ivkPptTpl_DfltRej \
			"%s%s%s dose not exists." \
			"$_src_ttl" \
			"${ANSI_F_PR}`__ "source"`${_ANSI} " \
			"$_src_cat" \
		;


		[[ "$src_pf" ]] \
		&& s_ivkPptTpl_DfltBlkCnt \
			"${ANSI_F_LG}${_src_ico}${_ANSI}${ANSI_F_CN}%s${_ANSI}" \
			"${src_pf/$PWD\//\./}" \
		;


	# MAIN PROCESS : STATUS 3 --------

	elif [[ $stt == 3 ]] ;
	then

		s_ivkPptTpl_DfltAcpt \
			"%s%s%s already exists." \
			"$_dst_ttl" \
			"${ANSI_F_PR}`__ "destination"`${_ANSI} " \
			"$_dst_cat" \
			--wc \
		;


		[[ "$dst_pf" ]] \
		&& s_ivkPptTpl_DfltBlkCnt \
			"${ANSI_F_LG}${_dst_ico}${_ANSI}${ANSI_F_CN}%s${_ANSI}" \
			"${dst_pf/$PWD\//\./}" \
		;


	# MAIN PROCESS : STATUS 1 --------

	else


		# A ) LINK

		if [[ "$atn" =~ ^(lnk|link)$ ]] ;
		then

			s_ivkPptTpl_DfltRej \
				"unable to create %s%s." \
				"$_dst_ttl" \
				"$_dst_cat" \
			;


		# B ) MOVE

		elif [[ "$atn" =~ ^(mv|move)$ ]] ;
		then

			s_ivkPptTpl_DfltRej \
				"unable to move to %s%s." \
				"$_dst_ttl" \
				"$_dst_cat" \
			;


		# C ) DOWNLAOD

		elif [[ "$atn" =~ ^(dwld|download)$ ]] ;
		then

			s_ivkPptTpl_DfltRej \
				"unable to download to %s%s." \
				"$_dst_ttl" \
				"$_dst_cat" \
			;


		fi ;


		[[ \
			"$src_pf" \
			&& "$dst_pf" \
		]] \
		&& s_ivkPptTpl_DfltBlkCnt \
			"${ANSI_F_LG}${_src_ico}${_ANSI}${ANSI_F_CN}%s${_ANSI}" \
			"${src_pf/$PWD\//\./}" \
		&& s_ivkPptTpl_DfltBlkCnt \
			"${ANSI_F_LG}${_atn_ico}${_ANSI}${ANSI_F_LG}${_dst_ico}${_ANSI}${ANSI_F_CN}%s${_ANSI}" \
			"${dst_pf/$PWD\//\./}" \
		;


	fi ;


} ;




# ######################################################################################
# URL UTILITY
# ######################################################################################
# ======================================================================================
# DOWNLOAD URL HEAD
# ======================================================================================
s_dwldUrlHd() {


	# [ arguments ]
	local -a _ax=("$@") ;

	# [ result ]
	local _rslt=$tru ;


	# POSITIONED ARGUMENT --------

	# [ positoined_arguments ]
	local -a _pax=` \
		s_gtCblPax \
	` ;


	# [ source_path ]
	local src_pf__="${_pax[0]}" ;


	# NAMED ARGUMENT --------

	# [ named_arguments ]
	local -A _nax=` \
		s_gtCblNax\
			--cmd "command" \
			--cmd-nov 1 \
			--cmd-opt-curl \
			--cmd-opt-wget \
			\
			--to "timeout" \
			--to-nov 1 \
	` ;


	# [ command ]
	local cmd="${_nax[cmd]}" ;

	# [ timeout ]
	local to="${_nax[to]}" ;


	# PRECHECK : COMMAND --------

	cmd="` \
		s_gtDwldMtd \
			$cmd \
	`" ;

	_rslt=$? ;


	[[ $_rslt != $tru ]] \
	&& return $fls \
	;


	# PRECHECK : SOURCE PATH --------

	# - source path is not given
	if [[ -z "$src_pf__" ]] ;
	then


		[[ $env_vbo == $tru ]] \
		&& s_ivkPptTpl_CblMpa \
			"Source Path" \
			--pos "1st" \
		;


		return $fls ;


	fi ;


	# - source path is not url
	if [[ $src_pf__ != http?(s)://* ]] ;
	then


		[[ $env_vbo == $tru ]] \
		&& s_ivkPptTpl_DfltRej \
			"%s is not a valid URL" \
			"${ANSI_F_PR}`__ "Source Path"`${_ANSI}" \
		;


		return $fls ;


	fi ;


	# PRE PROCESS : TIMEOUT --------

	[[ -z "$to" ]] \
	&& to=3 \
	;


	# MAIN PROCESS : DOWNLOAD --------

	# i ) Curl

	if [[ $cmd == "curl" ]] ;
	then

		# I 				: head only
		# f 				: fail silenty
		# s 				: silent mode
		# connect-timeout 	: timeout in second
		# 1 				: source path
		curl \
			-I \
			-f \
			-s \
			--connect-timeout $to \
			"$src_pf__" \
			&>/dev/null \
		;


	# ii ) Wget

	elif [[ $cmd == "wget" ]] ;
	then

		# T 		: timeout in second
		# q 		: quiet mode
		# t 		: number of retry
		# method 	: limit content information
		# 1 		: source path
		wget \
			-T 3 \
			-q \
			-t 1 \
			--method=HEAD \
			"$src_pf__" \
			&>/dev/null \
		;


	fi ;


	_rslt=$? ;


	# POST PROCESS : DISPLAY MESSAGE --------

	if [[ $env_vbo == $tru ]] ;
	then


		# Status ) 0

		if [[ $_rslt == $tru ]] ;
		then

			s_ivkPptTpl_DfltAcpt \
				"${ANSI_F_LG}`s_gtIco inet`${_ANSI}${ANSI_F_CN}%s${_ANSI}" \
				"$src_pf__" \
			&& s_ivkPptTpl_DfltBlkCnt \
				"${ANSI_F_LG} 🡔${_ANSI}%sis connectable." \
				"$_env_vbo_ttl" \
			;


		# Status ) 1

		else

			s_ivkPptTpl_DfltRej \
				"${ANSI_F_LG}`s_gtIco inet`${_ANSI}${ANSI_F_CN}%s${_ANSI}" \
				"$src_pf__" \
			&& s_ivkPptTpl_DfltBlkCnt \
				"${ANSI_F_LG} 🡔${_ANSI}%sis not connectable." \
				"$_env_vbo_ttl" \
			;

		fi ;


	fi ;


	# POST PROCESS : REPORT STATUS --------

	return $_rslt ;


} ;



# ======================================================================================
# DOWNLOAD URL
# ======================================================================================
s_dwldUrl() {


	# [ arguments ]
	local -a _ax=("$@") ;

	# [ result ]
	local _rslt=$tru ;


	# POSITIONED ARGUMENT --------

	# [ positoined_arguments ]
	local -a _pax=` \
		s_gtCblPax \
	` ;


	# [ source_path ]
	local src_pf__="${_pax[0]}" ;

	# [ destination_path ]
	local dst_pf__="${_pax[1]}" ;


	# NAMED ARGUMENT --------

	# [ named_arguments ]
	local -A _nax=` \
		s_gtCblNax \
			--cmd "command" \
			--cmd-nov 1 \
			--cmd-opt-curl \
			--cmd-opt-wget \
			\
			--to "timeout" \
			--to-nov 1 \
	` ;


	# [ command ]
	local cmd="${_nax[cmd]}" ;

	# [ timeout ]
	local to="${_nax[to]}" ;


	# PRECHECK : COMMAND --------

	cmd="` \
		s_gtDwldMtd \
			$cmd\
	`" ;

	_rslt=$? ;


	[[ $_rslt != $tru ]] \
	&& return $fls \
	;


	# PRECHECK : SOURCE PATH --------

	# - source path is not given
	if [[ -z "$src_pf__" ]] ;
	then


		[[ $env_vbo == $tru ]] \
		&& s_ivkPptTpl_CblMpa \
			"Source Path" \
			--pos "1st" \
		;


		return $fls ;


	fi ;


	# - source path is not url
	if [[ $src_pf__ != http?(s)://* ]] ;
	then


		[[ $env_vbo == $tru ]] \
		&& s_ivkPptTpl_DfltRej \
			"%s is not a valid URL" \
			"${ANSI_F_PR}`__ "Source Path"`${_ANSI}" \
		;


		return $fls ;


	fi ;


	# PRE PROCESS : DESTINATION PATH --------

	# - destination is not set
	[[ -z "$dst_pf__" ]] \
	&& dst_pf__="$PWD" \
	&& dst_pf__="${PWD}/`basename "$src_pf__"`" \
	;


	# PRE PROCESS : TIMEOUT --------

	[[ -z "$to" ]] \
	&& to=3 \
	;


	# MAIN PROCESS : DOWNLOAD --------

	# [ command_options ]
	local -a _cmd_optx ;


	[[ $env_vbo == $tru ]] \
	&& echo "" \
	;


	# i ) Curl

	if [[ $cmd == "curl" ]] ;
	then


		[[ $env_vbo != $tru ]] \
		&& _cmd_optx+=(-s) \
		;


		# L 				: location, follow redirects
		# o 				: save to destination
		# s 				: silent
		# connect-timeout 	: timeout in second
		# 1 				: source url
		s_ivkPptTpl_DfltBlkStrm \
			curl \
				-L \
				-o "$dst_pf__" \
				--connect-timeout $to \
				"${_cmd_optx[@]}" \
				"$src_pf__" \
		;


	# ii ) Wget

	elif [[ $cmd == "wget" ]] ;
	then


		[[ $env_vbo != $tru ]] \
		&& _cmd_optx+=(-s) \
		;


		# 1 : source url
		# O : output to file
		# T : timeout
		# t : number of retry
		# s : silent
		s_ivkPptTpl_DfltBlkStrm \
			wget \
				-O "$dst_pf__" \
				-T $to \
				-t 1 \
				"$src_pf__" \
				"${_cmd_optx[@]}" \
		;


	fi ;


	_rslt=$? ;


	[[ $env_vbo == $tru ]] \
	&& echo "" \
	;


	# POST PROCESS : DISPLAY MESSAGE --------

	[[ $env_vbo == $tru ]] \
	&& s_ivkPptTpl_FsXfrlAtnx \
		--atn "dwld" \
		--stt $_rslt \
		\
		--src_pf "$src_pf__" \
		--src_ttl "$vbo_ttl" \
		\
		--dst_pf "$dst_pf__" \
		--dst_ttl "$vbo_ttl" \
	;


	# POST PROCESS : REPORT STATUS --------

	return $_rslt ;


} ;



# ======================================================================================
# GET DOWNLOAD METHOD
# ======================================================================================
s_gtDwldMtd() {


	# [ arguments ]
	local -a _ax=("$@") ;

	# [ result ]
	local _rslt=$tru ;


	# POSITIONED ARGUMENT --------

	# [ positoined_arguments ]
	local -a _pax=` \
		s_gtCblPax \
	` ;


	# [ command ]
	local cmd__="${_pax[0]}" ;


	# MAIN PROCESS : DETERMINE COMMAND --------

	# A ) Use Default Method

	# - command is not given
	if [[ -z "$cmd__" ]] ;
	then

		# i ) Curl

		if [[ "` \
			type \
				-t \
				curl \
				2>/dev/null \
		`" ]] ;
		then

			echo "curl" ;


		# ii ) Wget

		elif [[ "` \
			type \
				-t \
				wget \
				2>/dev/null \
		`" ]] ;
		then

			echo "wget" ;


		else

			_rslt=$fls ;


		fi ;


	# B ) Use Custom Method

	# - given method is supported
	elif [[ $cmd__ =~ ^(curl|wget)$ ]] ;
	then

		echo $cmd__ ;



	# B ) Custom Method not Supported

	else

		_rslt=2 ;


	fi ;


	# POST PROCESS : DISPLAY MESSAGE --------

	if [[ $env_vbo == $tru ]] ;
	then

		# Status ) 2

		if [[ $_rslt == 2 ]] ;
		then

			s_ivkPptTpl_DfltRej \
				"Download method: %s is not supported yet." \
				"${ANSI_F_GN}${cmd__}${_ANSI}" \
			;


		# Status ) 1

		elif [[ $_rslt == 1 ]] ;
		then

			s_ivkPptTpl_DfltRej \
				"No download method is available." \
			&& s_ivkPptTpl_DfltBlkCnt \
				"please install either %s or %s." \
				"${ANSI_F_GN}curl${_ANSI}" \
				"${ANSI_F_GN}wget${_ANSI}" \
			;


		fi ;

	fi ;


	# POST PROCESS : REPORT STATUS --------

	[[ $_rslt == 2 ]] \
	&& return $fls \
	|| return $_rslt \
	;


} ;




# ######################################################################################
# CORE UTILITY
# ######################################################################################
# ======================================================================================
# PRECHECK
# ======================================================================================
prchk () {


	if [[ $env_vbo == $tru ]] ;
	then

		[[ $prt_hdr == $tru ]] \
		&& s_ivkPptTpl_DfltSecTtl \
			"%sPRE-TASKS" \
		|| s_ivkPptTpl_DfltSecTtl \
			"%sPRE-TASKS" \
			"${S_TTL} : " \
		;

	fi ;


	# PRECHECK : SHELL --------

	[[ $env_vbo == $tru ]] \
	&& s_ivkPptTpl_DfltBlkTtl \
		"Checking %s..." \
		"Bash" \
	;


	if \
		which \
			bash \
			&>/dev/shell \
	;
	then


		# [ current_bash_version ]
		local _cur_bash_ver="` \
			bash \
				--version \
			| grep \
				-Po \
				"version\s\K.+?(?=\-|\s|\$)" \
			| head \
				-1 \
		`" ;


		if \
			s_compVer \
				$_cur_bash_ver \
				4.0 \
		;

		then

			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_DfltAcpt \
				"%s shell version %s has detected." \
				"${ANSI_F_OR}bash${_ANSI}" \
				"$_cur_bash_ver" \
			;


		else


			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_DfltRej \
				"%s version %s is not supported." \
				"${ANSI_F_OR}bash${_ANSI}" \
				"$_cur_bash_ver" \
			;


			return $fls ;


		fi ;


	else


		[[ $env_vbo == $tru ]] \
		&& s_ivkPptTpl_DfltRej \
			"%s shell is not installed." \
			"${ANSI_F_OR}bash${_ANSI}" \
		;


		return $fls ;


	fi ;


	# PRECHECK : CLI --------

	[[ $env_vbo == $tru ]] \
	&& s_ivkPptTpl_DfltBlkTtl \
		"Checking %s..." \
		"CLI" \
	;


	# [ bash_has_cli ]
	local _bash_hs_cli=$fls ;


	# A ) BASH

	if [[ "$RL_USR" == root ]] ;
	then
		
		[[ "` \
			bash \
				-c " \
					type \
						-t \
						$S_L_CLI \
				" \
				2>/dev/null \
		`" ]] \
		&& _bash_hs_cli=$tru \
		;


	else

		[[ "` \
			sudo \
				-u "$RL_USR" \
				bash \
					-ic " \
						type \
							-t \
							$S_L_CLI \
					" \
				2>/dev/null \
		`" ]] \
		\
		&& _bash_hs_cli=$tru \
		;


	fi ;


	if [[ $_bash_hs_cli == $tru ]] ;
	then


		[[ $env_vbo == $tru ]] \
		&& s_ivkPptTpl_DfltAcpt \
			"%s command %s is registered." \
			"${ANSI_F_OR}bash${_ANSI}" \
			"${ANSI_F_GN}${S_L_CLI}${_ANSI}" \
			--wc \
		;


		[[ $_cur_sh_lng == "bash" ]] \
		&& return 2 \
		;


	else

		[[ $env_vbo == $tru ]] \
		&& s_ivkPptTpl_DfltAcpt \
			"%s command %s is ready for registeration." \
			"${ANSI_F_OR}bash${_ANSI}" \
			"${ANSI_F_GN}${S_L_CLI}${_ANSI}" \
		;


	fi ;


	# B ) CURRENT SHELL

	if [[ $_cur_sh_lng != "bash" ]] ;
	then


		# [ current_shell_has_cli ]
		local _cur_sh_hs_cli=$fls ;


		if [[ "$RL_USR" == root ]] ;
		then
			
			[[ "` \
				$SHELL \
					-c " \
						type \
							-t \
							$S_L_CLI \
					" \
					2>/dev/null \
			`" ]] \
			&& _cur_sh_hs_cli=$tru \
			;


		else

			[[ "` \
				sudo \
					-u "$RL_USR" \
					$SHELL \
						-ic " \
							type \
								-t \
								$S_L_CLI \
						" \
					2>/dev/null \
			`" ]] \
			\
			&& _cur_sh_hs_cli=$tru \
			;


		fi ;


		if [[ $_cur_sh_hs_cli == $tru ]] ;
		then

			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_DfltAcpt \
				"%s command %s is registered." \
				"${ANSI_F_OR}${_cur_sh_lng}${_ANSI}" \
				"${ANSI_F_GN}${S_L_CLI}${_ANSI}" \
				--wc \
			;


			[[ $_bash_hs_cli == $tru ]] \
			&& return 2 \
			;


		else

			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_DfltAcpt \
				"%s command %s is ready for registeration." \
				"${ANSI_F_OR}${_cur_sh_lng}${_ANSI}" \
				"${ANSI_F_GN}${S_L_CLI}${_ANSI}" \
			;


		fi ;

	fi ;


	# PRECHECK : DESTINATION --------

	[[ $env_vbo == $tru ]] \
	&& s_ivkPptTpl_DfltBlkTtl \
		"Checking %s..." \
		"Destination" \
	;


	# A ) APPLICATION FOLDER

	if [[ -d "$S_APP_FLDR" ]] ;
	then


		[[ $env_vbo == $tru ]] \
		&& s_ivkPptTpl_DfltRej \
			"%s %s is not empty." \
			"${ANSI_F_BL}`__ "Application"`${_ANSI}" \
			"folder" \
		&& s_ivkPptTpl_DfltBlkCnt \
			"Please remove %s before installation." \
			"${ANSI_F_CN}${S_APP_FLDR}${_ANSI}" \
		&& s_ivkPptTpl_DfltCdgCnvs \
			"↓" \
			"sudo rm -fr '${S_APP_FLDR}'" \
		;
		

		return $fls ;


	else 

		[[ $env_vbo == $tru ]] \
		&& s_ivkPptTpl_DfltAcpt \
			"%s %s is empty." \
			"${ANSI_F_BL}`__ "Application"`${_ANSI}" \
			"folder" \
		;


	fi ;


	# B ) TEMPORARY FOLDER

	if [[ -d "$S_TMP_FLDR" ]] ;
	then

		[[ $env_vbo == $tru ]] \
		&& s_ivkPptTpl_DfltAcpt \
			"%s %s exists." \
			"${ANSI_F_BL}Temporary${_ANSI}" \
			"folder" \
			--wc \
		;


	else 

		[[ $env_vbo == $tru ]] \
		&& s_ivkPptTpl_DfltAcpt \
			"%s %s is empty." \
			"${ANSI_F_BL}Temporary${_ANSI}" \
			"folder" \
		;


	fi ;


	# POST PROCESS : Report Status --------

	return $tru ;


} ;



# ======================================================================================
# DOWNLOAD
# ======================================================================================
dwld () {


	if [[ $env_vbo == $tru ]] ;
	then

		[[ $prt_hdr == $tru ]] \
		&& s_ivkPptTpl_DfltSecTtl \
			"%sDOWNLOAD" \
		|| s_ivkPptTpl_DfltSecTtl \
			"%sDOWNLOAD" \
			"${S_TTL} : " \
		;

	fi ;


	# MAIN PROCESS : DOWNLOAD METHOD --------

	[[ $env_vbo == $tru ]] \
	&& s_ivkPptTpl_DfltBlkTtl \
		"Checking %s Connection..." \
		"Archive" \
	;


	# [dowload_method ]
	local _dl_mtd="` \
		s_gtDwldMtd \
	`" ;


	[[ -z $_dl_mtd ]] \
	&& return $fls \
	;


	[[ $env_vbo == $tru ]] \
	&& s_ivkPptTpl_DfltAcpt \
		"prepare download with method: %s." \
		"${ANSI_F_GN}${_dl_mtd}${_ANSI}" \
	;


	# PRECHECK : ARCHIVE CONNECTION --------

	[[ $env_vbo == $tru ]] \
	&& s_ivkPptTpl_DfltBlkTtl \
		"Checking %s Connection..." \
		"${ANSI_F_BL}`__ "Archive"`${_ANSI}" \
	;


	# - archive url is empty
	# - unable to connect archive url
	[[ -z $S_APP_ARC_URL ]] \
	|| ! s_dwldUrlHd \
		"$S_APP_ARC_URL" \
	&& return $fls \
	;


	# MAIN PROCESS : DOWNLOAD --------

	# [ destination_folder_path ]
	local _dst_fldr_pf="${S_TMP_FLDR}/`basename "$S_APP_ARC_URL"`" ;


	[[ $env_vbo == $tru ]] \
	&& s_ivkPptTpl_DfltBlkTtl \
		"Downloading..." \
	;


	# 1 ) Create Temporary Folder

	# 🖿 tmp//EtroTech spairaru.bash
	[[ ! -d "$S_TMP_FLDR" ]] \
	&& mkdir \
		-p \
		"$S_TMP_FLDR" \
	;


	# 2 ) Downlaod From Internet

	# 🌐 ??? 
	# 🡖 🖿 tmp//EtroTech spairaru.bash
	if [[ -f "$_dst_fldr_pf" ]] ;
	then

		[[ $env_vbo == $tru ]] \
		&& s_ivkPptTpl_FsXfrlAtnx \
			--atn "dwld" \
			--stt 0 \
			\
			--src_pf "$S_APP_ARC_URL" \
			\
			--dst_pf "$_dst_fldr_pf" \
		;


	else

		! s_dwldUrl \
			"$S_APP_ARC_URL" \
			"$_dst_fldr_pf" \
		&& return $fls \


	fi ;


	# MAIN PROCESS : EXTRACT DOWNLOADED --------

	s_ivkPptTpl_DfltBlkTtl \
		"Extacting Download..." \
	;


	# [ tar_named_option ]
	local -a _tar_noptx ;

	[[ $env_vbo == $tru ]] \
	&& _tar_noptx+=(-v) \
	;


	[[ $env_vbo == $tru ]] \
	&& echo "" \
	;

	# C 			: working directory
	# f 			: input file path
	# x 			: extract
	# v 			: verbose
	# z 			: compress and decompress with gzip

	if \
		s_ivkPptTpl_DfltBlkStrm \
			tar \
				"${_tar_noptx[@]}" \
				-C "$S_TMP_FLDR" \
				-f "$_dst_fldr_pf" \
				-x \
				-v \
				-z \
	;
	then


		[[ $env_vbo == $tru ]] \
		&& echo "" \
		&& s_ivkPptTpl_DfltAcpt \
			"%s completed." \
			"extaction" \
		;


	else


		[[ $env_vbo == $tru ]] \
		&& echo "" \
		&& s_ivkPptTpl_DfltRej \
			"%s failed." \
			"extaction" \
		;


		return $fls ;


	fi ;


	# POST PROCESS : Report Status --------

	return $tru ;


} ;



# ======================================================================================
# INSTALL
# ======================================================================================
istl () {


	if [[ $env_vbo == $tru ]] ;
	then

		[[ $prt_hdr == $tru ]] \
		&& s_ivkPptTpl_DfltSecTtl \
			"%INSTALLATION" \
		|| s_ivkPptTpl_DfltSecTtl \
			"%INSTALLATION" \
			"${S_TTL} : " \
		;

	fi ;


	# MAIN PROCESS : INSTALLATION --------

	[[ $env_vbo == $tru ]] \
	&& s_ivkPptTpl_DfltBlkTtl \
		"Adding %s Files..." \
		"${ANSI_F_BL}`__ "Application"`${_ANSI}" \
	;


	# 🖿 tmp/EtroTech spairaru.bash/spairaru.bash 
	# 🡖 🖿 opt/spairaru.bash
	# ↓↓↓

	# [ copy_named_option ]
	local -a _cp_noptx ;

	[[ $env_vbo == $tru ]] \
	&& _cp_noptx+=(-v) \
	;


	[[ $env_vbo == $tru ]] \
	&& echo "" \
	;

	# r 			: recursive
	# v 			: verbose
	# 1 			: source path
	# 2 			: destination path

	if \
		s_ivkPptTpl_DfltBlkStrm \
			cp \
				"${_cp_noptx[@]}" \
				-r \
				"${S_TMP_FLDR}/${S_TTL}" \
				"$S_APP_FLDR" \
	;
	then


		[[ $env_vbo == $tru ]] \
		&& echo "" \
		&& s_ivkPptTpl_DfltAcpt \
			"%s%s is installed." \
			"${ANSI_F_BL}`__ "Application"`${_ANSI} " \
			"files" \
		;


	else


		[[ $env_vbo == $tru ]] \
		&& echo "" \
		&& s_ivkPptTpl_DfltRej \
			"Unable to install %s%s." \
			"${ANSI_F_BL}`__ "Application"`${_ANSI}" \
			"files" \
		;


		return $fls ;


	fi ;


	[[ $env_vbo == $tru ]] \
	&& s_ivkPptTpl_DfltBlkCnt \
		"${ANSI_F_LG}`s_gtIco "fldr"`${_ANSI}${ANSI_F_CN}%s${_ANSI}" \
		"` \
			echo \
				"${S_TMP_FLDR}/${S_TTL}" \
			| sed \
				-rz \
				-e 's/'"${PWD//\\//\\\/}"'/\./g' \
				-e 's/ /\\\\\\\ /g' \
		`" \
	&& s_ivkPptTpl_DfltBlkCnt \
		"${ANSI_F_LG}`s_gtIco "xfr"`${_ANSI}${ANSI_F_LG}`s_gtIco "fldr"`${_ANSI}${ANSI_F_CN}%s${_ANSI}" \
		"` \
			echo \
				"$S_APP_FLDR" \
			| sed \
				-rz \
				-e 's/'"${PWD//\\//\\\/}"'/\./g' \
				-e 's/ /\\\\\\\ /g' \
		`" \
	;


	# # POST PROCESS : Report Status --------

	return $tru ;


} ;



# ======================================================================================
# POST-TASK
# ======================================================================================
potsk () {


	if [[ $env_vbo == $tru ]] ;
	then

		[[ $prt_hdr == $tru ]] \
		&& s_ivkPptTpl_DfltSecTtl \
			"%POST-TASKS" \
		|| s_ivkPptTpl_DfltSecTtl \
			"%POST-TASKS" \
			"${S_TTL} : " \
		;

	fi ;


	# POST PROCESS : CLEAN UP --------

	[[ $env_vbo == $tru ]] \
	&& s_ivkPptTpl_DfltBlkTtl \
		"Cleaning Up..." \
	;


	# 🗎 /tmp//EtroTech spairaru.bash/spairaru.bash.tar.gzip
	# 🡖 †

	# 1 			: utility group
	# 2 			: action
	# 3 			: path
	# -- environmental options --
	# vbo 			: verbose
	# vbo_ttl 		: verbose title
	"$S_APP_EXC_FL" \
		fl \
			rm \
				"${S_TMP_FLDR}/`basename "$S_APP_ARC_URL"`" \
		--vbo $env_vbo \
		--vbo_ttl "Download" \
	;


	# 🖿 /tmp//EtroTech spairaru.bash/spairaru.bash
	# 🡖 †

	# 1 			: utility group
	# 2 			: action
	# 3 			: path
	# -- environmental options --
	# vbo 			: verbose
	# vbo_ttl 		: verbose title
	"$S_APP_EXC_FL" \
		fldr \
			rm \
				"${S_TMP_FLDR}/${S_TTL}" \
		--vbo $env_vbo \
		--vbo_ttl "Extraction" \
	;


	# POST PROCESS : Report Status --------

	return $tru ;


} ;




# ######################################################################################
# MAIN LOGIC
# ######################################################################################

# [ arguments ]
declare -a _ax=("$@") ;


# NAMED ARGUMENT --------

# [ named_arguments ]
declare -A _nax=` \
	s_gtCblNax \
		--prt_hdr "print_header" \
		--prt_hdr-dflt $tru \
		\
		--prt_ftr "print_footer" \
		--prt_ftr-dflt $tru \
		\
		--tol_proc_ct "total_process_count" \
		--tol_proc_ct-nov 1 \
		\
		\
		--vbo "V" "verbose" \
		--vbo-dflt "$env_vbo" \
` ;


# [ print_header ]
declare prt_hdr="${_nax[prt_hdr]}" ;

# [ print_footer ]
declare prt_ftr="${_nax[prt_ftr]}" ;

# [ total_process_count ]
declare tol_proc_ct="${_nax[tol_proc_ct]}" ;

# [ environment_verbose ]
declare env_vbo="${_nax[vbo]}" ;


# LOCAL DEFINES --------

# [ current_shell ]
declare _cur_sh_lng="`basename $SHELL`" ;

# [ final_decision ]
declare _fin_decis ;

# [ precheck_result ]
declare _prchk_rslt ;

# [ self_process_count ]
declare _slf_proc_ct=$(( tol_proc_ct + 9 )) ;



# --------------------------------------------------------------------------------------
# HEADER
# --------------------------------------------------------------------------------------

[[ \
	$env_vbo == $tru \
	&& $prt_hdr == $tru \
]] \
&& printf \
	"\n${ANSI_F_W6_LG}` \
		__ \
			"📜 Installer for %s v%s" \
			"${ET_TTL} ${S_TTL}" \
			"$S_VER" \
	`\n${_ANSI}" \
;



# --------------------------------------------------------------------------------------
# PRECHECK
# --------------------------------------------------------------------------------------

prchk ;

_prchk_rslt=$? ;



# --------------------------------------------------------------------------------------
# INSTALL
# --------------------------------------------------------------------------------------

if [[ $_prchk_rslt == 2 ]] ;
then


	_fin_decis=$tru ;


	. \
		"$S_APP_EXC_FL" \
		pfld \
	;



elif [[ $_prchk_rslt == 1 ]] ;
then

	_fin_decis=$fls ;


elif [[ $_prchk_rslt == 0 ]] ;
then

	if \
		dwld \
		&& istl \
	;
	then


		. \
			"$S_APP_EXC_FL" \
			pfld \
		;


		# Install the reset.

		# 1 			: action
		# -- environmental options --
		# vbo 			: verbose
		"$S_APP_EXC_FL" \
			istl \
				--vbo $env_vbo \
		&& _fin_decis=$tru \
		|| _fin_decis=$fls \
		;


		potsk ;


	else

		_fin_decis=$fls ;


	fi ;


fi ;



# --------------------------------------------------------------------------------------
# INSTALLATION SUCCESSED
# --------------------------------------------------------------------------------------

if [[ $_fin_decis == $tru ]] ;
then


	[[ \
		$env_vbo == $tru \
		&& $prt_ftr == $tru \
	]] \
	&& s \
		ppt \
			ivk \
				DfltSuc \
				"%s%s is installed." \
				"${ET_TTL} " \
				"${S_TTL}" \
	;


	# i ) Supported Shell

	if [[ \
		$env_vbo == $tru \
		&& $prt_ftr == $tru \
	]] ;
	then

		if [[ $_cur_sh_lng =~ ^(csh|bash|fish|tcsh|zsh)$ ]] ;
		then

			s \
				ppt \
					ivk \
						DfltCdgcnvs \
						"To continue," \
						"please either reopen terminal," \
						"or execute blow to reload ${_cur_sh_lng} shell profile." \
						"↓" \
						"${ANSI_F_OR}. `\
							"$S_APP_EXC_FL" \
								$_cur_sh_lng \
									prfl \
										pf \
										--dflt \
						`${_ANSI}" \
						"" \
			;


		# ii ) Not Supported Shell

		else

			s_ivkPptTpl_DfltCdgCnvs \
				"Aliasing in shell type: ${_cur_sh_lng} is not supported yet." \
				"Please execute ${S_L_CLI} or ${S_S_CLI} in full path as blow." \
				"↓" \
				"${ANSI_F_OR}${S_APP_EXC_FL}${_ANSI}" \
			;


		fi ;

	fi ;



# --------------------------------------------------------------------------------------
# INSTALLATION FAILED
# --------------------------------------------------------------------------------------

else

	[[ \
		$env_vbo == $tru \
		&& $prt_ftr == $tru \
	]] \
	&& s_ivkPptTpl_DfltFl \
		"failed to install %s%s." \
		"${ET_TTL} " \
		"${S_TTL}" \
	;


fi ;
