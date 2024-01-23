#!/usr/bin/env bash
# ######################################################################################
# PROMPT PROGRESS BAR DEFINE
# ######################################################################################
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# TEMPLATE VARIABLES
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# prompt_progress_bar_emplates
[[ -z $S_PPT_PB_TPLX ]] \
&& declare -A S_PPT_PB_TPLX=( \
	["Dflt"]="s_ivkPptPbTpl_Dflt" \
) \
;



# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# TEMPORARY VARIABLES
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# prompt_progress_bar_template
[[ -z $S_PPT_PB_TPL ]] \
&& declare S_PPT_PB_TPL \
;

# prompt_progress_bar_title
[[ -z $S_PPT_PB_TTL ]] \
&& declare S_PPT_PB_TTL \
;

# prompt_progress_bar_prefix
[[ -z $S_PPT_PB_PFX ]] \
&& declare S_PPT_PB_PFX \
;

# prompt_progress_bar_suffix
[[ -z $S_PPT_PB_SFX ]] \
&& declare S_PPT_PB_SFX \
;


# prompt_progress_bar_percentage_total
[[ -z $S_PPT_PB_PCT_TOL ]] \
&& declare S_PPT_PB_PCT_TOL \
;

# prompt_progress_bar_percentage_text_location
[[ -z $S_PPT_PB_PCT_TXT_LOC ]] \
&& declare S_PPT_PB_PCT_TXT_LOC \
;

# prompt_progress_bar_percentage_bar_prefix
[[ -z $S_PPT_PB_PCT_BR_PFX ]] \
&& declare S_PPT_PB_PCT_BR_PFX \
;

# prompt_progress_bar_percentage_bar_suffix
[[ -z $S_PPT_PB_PCT_BR_SFX ]] \
&& declare S_PPT_PB_PCT_BR_SFX \
;

# prompt_progress_bar_percentage_bar_suffix
[[ -z $S_PPT_PB_PCT_BR_SFX ]] \
&& declare S_PPT_PB_PCT_BR_SFX \
;


# rompt_progress_bar_completion_symbol_charactor
[[ -z $S_PPT_PB_CPLTN_SMBL_CHAR ]] \
&& declare S_PPT_PB_CPLTN_SMBL_CHAR \
;

# rompt_progress_bar_completion_symbol_color
[[ -z $S_PPT_PB_CPLTN_SMBL_CLR ]] \
&& declare S_PPT_PB_CPLTN_SMBL_CLR \
;

# rompt_progress_bar_remainder_symbol_charactor
[[ -z $S_PPT_PB_RMNDR_SMBL_CHAR ]] \
&& declare S_PPT_PB_RMNDR_SMBL_CHAR \
;

# rompt_progress_bar_remainder_symbol_color
[[ -z $S_PPT_PB_RMNDR_SMBL_CLR ]] \
&& declare S_PPT_PB_RMNDR_SMBL_CLR \
;
