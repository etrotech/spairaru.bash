#!/usr/bin/env bash
# ######################################################################################
# PROMPT PROGRESS BAR CORE UTILITY
# ######################################################################################
# ======================================================================================
# CLEAR PROMPT PROGRESS BAR
# ======================================================================================
s_clrPptProcBr() {


	# PRE PROCESS : CURSOR --------

	# \033[ 		: asni escape
	# s 			: save cursor position
	echo \
		-en \
		"$ANSI_CRSR_SV" \
	;

	# ↓ Move cursor position to last row.
	# \033[ 		: asni escape
	# \d+ 			: number of rows
	# ; 			: spliter
	# 0 			: last
	# f 			: change cursor position
	echo \
		-en \
		"${ANSI_}` \
			s_gtTmlRowx \
		`;0f" \
	;


	# MAIN PROCESS : BAR --------

	# ↓ Clear current line
	# \033[ 		: asni escape
	# 2K 			: clear current line
	# r 			: move the cursor to the beginning of the line
	echo \
		-en \
		"${ANSI_}2K\r" \
	;


	# POST PROCESS : CURSOR --------

	# and ensure its inside the scroll area by move a line up.
	# \033[ 		: asni escape
	# u 			: restore cursor position
	echo \
		-en \
		"$ANSI_CRSR_RSTR" \
	;


	# POST PROCESS : TEMPORARIES --------

	# prompt_progress_bar_template
	S_PPT_PB_TPL= ;

	# [ prompt_progress_bar_title ]
	S_PPT_PB_TTL= ;

	# [ prompt_progress_bar_prefix ]
	S_PPT_PB_PFX=;

	# [ prompt_progress_bar_suffix ]
	S_PPT_PB_SFX=;


	# [ prompt_progress_bar_percentage_total ]
	S_PPT_PB_PCT_TOL=;

	# [ prompt_progress_bar_percentage_text_location ]
	S_PPT_PB_PCT_TXT_LOC=;

	# [ prompt_progress_bar_percentage_bar_prefix ]
	S_PPT_PB_PCT_BR_PFX=;

	# [ prompt_progress_bar_percentage_bar_suffix ]
	S_PPT_PB_PCT_BR_SFX=;

	# [ prompt_progress_bar_percentage_bar_suffix ]
	S_PPT_PB_PCT_BR_SFX=;


	# [ rompt_progress_bar_completion_symbol_charactor ]
	S_PPT_PB_CPLTN_SMBL_CHAR=;

	# [ rompt_progress_bar_completion_symbol_color ]
	S_PPT_PB_CPLTN_SMBL_CLR=;

	# [ rompt_progress_bar_remainder_symbol_charactor ]
	S_PPT_PB_RMNDR_SMBL_CHAR=;

	# [ rompt_progress_bar_remainder_symbol_color ]
	S_PPT_PB_RMNDR_SMBL_CLR=;


	# POST PROCESS : REPORT STATUS --------

	return $tru


} ;



# ======================================================================================
# RENDER PROMPT PROGRESS BAR
# ======================================================================================
s_renPptProcBr() {

	# [ arguments ]
	local -a _ax=("$@") ;

	# [ result ]
	local _rslt ;


	# POSITIONED ARGUMENT --------

	# [ positoined_arguments ]
	local -a _pax=` \
		s_gtCblPax \
	` ;


	# [ percentage ]
	local pct__="${_pax[0]}" ;


	# NAMED ARGUMENT --------

	# [ named_arguments ]
	local -A _nax=` \
		s_gtCblNax \
			--proc_br_tpl "tpl" "template" \
			--proc_br_tpl-nov 1 \
			--proc_br_tpl-dflt "$S_PPT_PB_TPL" \
			\
			--proc_br_ttl "ttl" "title" \
			--proc_br_ttl-nov 1 \
			--proc_br_ttl-dflt "$S_PPT_PB_TTL" \
			\
			--proc_br_pfx "pfx" "prefix" \
			--proc_br_pfx-nov 1 \
			--proc_br_pfx-dflt "$S_PPT_PB_PFX" \
			\
			--proc_br_sfx "sfx" "suffix" \
			--proc_br_sfx-nov 1 \
			--proc_br_sfx-dflt "$S_PPT_PB_SFX" \
			\
			\
			--pct_tol "tol" "pct_tol" "percentage_total" \
			--pct_tol-nov 1 \
			--pct_tol-dflt "$S_PPT_PB_PCT_TOL" \
			\
			--pct_txt_loc "pct_txt_loc" "percentage_text_location" \
			--pct_txt_loc-nov 1 \
			--pct_txt_loc-dflt "$S_PPT_PB_PCT_TXT_LOC" \
			\
			--pct_br_pfx "pct_br_pfx" "percentage_bar_prefix" \
			--pct_br_pfx-nov 1 \
			--pct_br_pfx-dflt "$S_PPT_PB_PCT_BR_PFX" \
			\
			--pct_br_sfx "pct_br_sfx" "percentage_bar_suffix" \
			--pct_br_sfx-nov 1 \
			--pct_br_sfx-dflt "$S_PPT_PB_PCT_BR_SFX" \
			\
			\
			--cpltn_smbl_char "cpltn_smbl" "completion_symbol" \
			--cpltn_smbl_char-nov 1 \
			--cpltn_smbl_char-dflt "$S_PPT_PB_CPLTN_SMBL_CHAR" \
			\
			--cpltn_smbl_clr "cpltn_smbl_clr" "completion_symbol_color" \
			--cpltn_smbl_clr-nov 1 \
			--cpltn_smbl_clr-dflt "$S_PPT_PB_CPLTN_SMBL_CLR" \
			\
			--rmndr_smbl_char "rmndr_smbl" "reminder_symbol" \
			--rmndr_smbl_char-nov 1 \
			--rmndr_smbl_char-dflt "$S_PPT_PB_RMNDR_SMBL_CHAR" \
			\
			--rmndr_smbl_clr "rmndr_smbl_clr" "reminder_symbol_color" \
			--rmndr_smbl_clr-nov 1 \
			--rmndr_smbl_clr-dflt "$S_PPT_PB_RMNDR_SMBL_CLR" \
	` ;


	# [ prompt_progress_bar_template ]
	S_PPT_PB_TPL="${_nax[proc_br_tpl]}" ;

	# [ prompt_progress_bar_title ]
	S_PPT_PB_TTL="${_nax[proc_br_ttl]}" ;

	# [ prompt_progress_bar_prefix ]
	S_PPT_PB_PFX="${_nax[proc_br_pfx]}" ;

	# [ prompt_progress_bar_suffix ]
	S_PPT_PB_SFX="${_nax[proc_br_sfx]}" ;


	# [ prompt_progress_bar_percentage_total ]
	S_PPT_PB_PCT_TOL="${_nax[pct_tol]}" ;

	# [ prompt_progress_bar_percentage_text_location ]
	S_PPT_PB_PCT_TXT_LOC="${_nax[pct_txt_loc]}" ;

	# [ prompt_progress_bar_percentage_bar_prefix ]
	S_PPT_PB_PCT_BR_PFX="${_nax[pct_br_pfx]}" ;

	# [ prompt_progress_bar_percentage_bar_suffix ]
	S_PPT_PB_PCT_BR_SFX="${_nax[pct_br_sfx]}" ;


	# [ rompt_progress_bar_completion_symbol_charactor ]
	S_PPT_PB_CPLTN_SMBL_CHAR="${_nax[cpltn_smbl_char]}" ;

	# [ rompt_progress_bar_completion_symbol_color ]
	S_PPT_PB_CPLTN_SMBL_CLR="${_nax[cpltn_smbl_clr]}" ;

	# [ rompt_progress_bar_remainder_symbol_charactor ]
	S_PPT_PB_RMNDR_SMBL_CHAR="${_nax[rmndr_smbl_char]}" ;

	# [ rompt_progress_bar_remainder_symbol_color ]
	S_PPT_PB_RMNDR_SMBL_CLR="${_nax[rmndr_smbl_clr]}" ;


	# PRE PROCESS : PREFIX --------

	[[ -z "$S_PPT_PB_PFX" ]] \
	&& S_PPT_PB_PFX="${S_PPT_ITND}" \
	;


	# PRE PROCESS : PERCENTAGE TOTAL --------

	[[ -z "$S_PPT_PB_PCT_TOL" ]] \
	&& S_PPT_PB_PCT_TOL=100 \
	;


	# PRE PROCESS : PERCENTAGE TEXT LOCATION --------

	[[ -z "$S_PPT_PB_PCT_TXT_LOC" ]] \
	&& S_PPT_PB_PCT_TXT_LOC="r" \
	;


	# PRE PROCESS : COMPLETION SYMBOL CHARACTOR --------

	[[ -z "$S_PPT_PB_CPLTN_SMBL_CHAR" ]] \
	&& S_PPT_PB_CPLTN_SMBL_CHAR="■" \
	;


	# PRE PROCESS : COMPLETION SYMBOL COLOR --------

	[[ -z "$S_PPT_PB_CPLTN_SMBL_CLR" ]] \
	&& S_PPT_PB_CPLTN_SMBL_CLR="$ANSI_F_GN" \
	;


	# PRE PROCESS : REMAINDER SYMBOL CHARACTOR --------

	[[ -z "$S_PPT_PB_RMNDR_SMBL_CHAR" ]] \
	&& S_PPT_PB_RMNDR_SMBL_CHAR="■" \
	;


	# PRE PROCESS : REMAINDER SYMBOL COLOR --------

	[[ -z "$S_PPT_PB_RMNDR_SMBL_CLR" ]] \
	&& S_PPT_PB_RMNDR_SMBL_CLR="$ANSI_F_GR" \
	;


	# MAIN PROCESS : PERCENTAGE --------

	# [ percentage ]
	_pct=$(( pct__ * 100 / $S_PPT_PB_PCT_TOL )) ;


	# MAIN PROCESS : BAR CONTENT --------

	# [ content ]
	local _cnt="` \
		s_renPptProcBrCnt \
			$_pct \
			"${_nax[@]}" \
	`" ;

	_rslt=$? ;


	# MAIN PROCESS : RENDER --------

	# \033[ 		: asni escape
	# s 			: restore cursor position
	echo \
		-en \
		"$ANSI_CRSR_SV" \
	;


	# ↓ Move cursor position to last row.
	# \033[ 		: asni escape
	# \d+ 			: number of rows
	# ; 			: spliter
	# 0 			: last
	# f 			: change cursor position
	echo \
		-en \
		"${ANSI_}` \
			s_gtTmlRowx \
		`;0f" \
	;


	# ↓ Clear current line
	# \033[ 		: asni escape
	# 2K 			: clear current line
	# r 			: move the cursor to the beginning of the line
	echo \
		-en \
		"${ANSI_}2K\r" \
	;

	# ↓ Output content
	echo \
		-en \
		"$_cnt" \
	;


	# POST PROCESS : CURSOR --------

	#   and ensure its inside the scroll area by move a line up.
	# \033[ 		: asni escape
	# u 			: restore cursor position
	echo \
		-en \
		"$ANSI_CRSR_RSTR" \
	;


	# POST PROCESS : REPORT STATUS --------

	return $_rslt ;


} ;



# ======================================================================================
# RENDER PROMPT PROGRESS BAR CONTENT
# ======================================================================================
s_renPptProcBrCnt() {


	# POST PROCESS : TEMPLATE --------

	if [[ \
		"$S_PPT_PB_TPL" \
		&& "${S_PPT_PB_TPLX[$S_PPT_PB_TPL]}" \
	]] ;
	then

		"${S_PPT_PB_TPLX[$S_PPT_PB_TPL]}" \
			"$@"\
		;


	else 

		s_ivkPptPbTpl_Dflt \
			"$@"\
		;


	fi ;


	# POST PROCESS : REPORT STATUS --------

	return $?


} ;
