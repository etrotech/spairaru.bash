#!/usr/bin/env bash
# ######################################################################################
# PROMPT PROGRESS BAR TEMPLATE UTILITY
# ######################################################################################
# ======================================================================================
# INVOKER PROMPT PROGRESS BAR TEMPLATE - DEFAULT
# ======================================================================================
s_ivkPptPbTpl_Dflt () {


	# [ terminal_max_columns ]
	local _tml_max_colx=` s_gtTmlColx ` ;

	# [ content ]
	local _cnt ;


	# MAIN PROCESS : CALCULATE --------

	# [ percentage_bar_columns ]

	# prompt_progress_bar_prefix
	# prompt_progress_bar_suffix
	# prompt_progress_bar_percentage_bar_suffix
	# prompt_progress_bar_percentage_bar_suffix
	# percentage
	# prompt_progress_bar_title

	local _pct_br_colx="$(( \
		_tml_max_colx \
		- ${#S_PPT_PB_PFX} \
		- ${#S_PPT_PB_SFX} \
		- ${#S_PPT_PB_PCT_BR_PFX} \
		- ${#S_PPT_PB_PCT_BR_SFX} \
		- 5 \
	))" ;


	if [[ ${#S_PPT_PB_TTL} -gt 0 ]] ;
	then

		_pct_br_colx=$(( _pct_br_colx - ${#S_PPT_PB_TTL} - 1 )) ;

	fi ;


	# [ completion_bar_columns ]
	local _cpltn_br_colx=$(( _pct_br_colx * _pct / 100 )) ;

	# [ remainder_bar_size ]
	local _rmndr_br_colx=$(( _pct_br_colx - _cpltn_br_colx )) ;



	# MAIN PROCESS : RENDER --------

	# i ) Progress Bar Prefix

	[[ -n "$S_PPT_PB_PFX" ]] \
	&& _cnt+="${S_PPT_PB_PFX}" \
	;


	# i ) Progress Message

	[[ -n "$S_PPT_PB_TTL" ]] \
	&& _cnt+="${S_PPT_PB_TTL} " \
	;


	# ii ) Percentage

	[[ $S_PPT_PB_PCT_TXT_LOC =~ ^(l|left)$ ]] \
	&& _cnt+="` \
			printf \
				"%-$(( 3 - ${#_pct} ))s%s" \
				" " \
				"$_pct" \
		`% " \
	;


	# i ) Percentage Bar Prefix

	[[ -n "$S_PPT_PB_PCT_BR_PFX" ]] \
	&& _cnt+="${S_PPT_PB_PCT_BR_PFX}" \
	;


	# iii ) Percentage Bar

	if [[ $_cpltn_br_colx -gt 0 ]] ;
	then


		# [ completion_bar_text ]
		local _cpltn_br_txt="` \
			printf \
				"%-${_cpltn_br_colx}s" \
				"$S_PPT_PB_CPLTN_SMBL_CHAR" \
		`" ;


		_cnt+="${S_PPT_PB_CPLTN_SMBL_CLR}${_cpltn_br_txt// /$S_PPT_PB_CPLTN_SMBL_CHAR}${_ANSI}" \
		;


	fi ;


	if [[ $_rmndr_br_colx -gt 0 ]] ;
	then


		# [ remainder_bar_text ]
		local _rmndr_br_txt="` \
			printf \
				"%-${_rmndr_br_colx}s" \
				"$S_PPT_PB_RMNDR_SMBL_CHAR" \
		`" ;


		_cnt+="${S_PPT_PB_RMNDR_SMBL_CLR}${_rmndr_br_txt// /$S_PPT_PB_RMNDR_SMBL_CHAR}${_ANSI}" \
		;


	fi ;


	# i ) Percentage Bar Suffix

	[[ -n "$S_PPT_PB_PCT_BR_SFX" ]] \
	&& _cnt+="${S_PPT_PB_PCT_BR_SFX}" \
	;


	# ii ) Percentage

	[[ ! $S_PPT_PB_PCT_TXT_LOC =~ ^(l|left)$ ]] \
	&& _cnt+=" `\
			printf \
				"%-$(( 3 - ${#_pct} ))s%s" \
				" " \
				"$_pct" \
		`%" \
	;


	# i ) Progress Bar Suffix

	[[ -n "$S_PPT_PB_SFX" ]] \
	&& _cnt+="${S_PPT_PB_SFX}" \
	;


	# POST PROCESS : REPORT STATUS --------

	echo "$_cnt" ;


	# POST PROCESS : REPORT STATUS --------

	return $tru ;


} ;
