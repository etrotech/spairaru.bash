#!/usr/bin/env bash
# ######################################################################################
# ANSI COLOR DEFINE
# ######################################################################################

. "${BASH_SOURCE[0]%/*}/sAnsi.sh" ;


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# FONT CONSTANTS
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# --------------------------------------------------------------------------------------
# REGULAR WEIGHT
# --------------------------------------------------------------------------------------

# black
[[ -z "$ANSI_F_BK" ]] \
&& declare -r ANSI_F_BK="${ANSI_}0;30m" \
;

# red
[[ -z "$ANSI_F_RD" ]] \
&& declare -r ANSI_F_RD="${ANSI_}0;31m" \
;

# green
[[ -z "$ANSI_F_GN" ]] \
&& declare -r ANSI_F_GN="${ANSI_}0;32m" \
;

# orange
[[ -z "$ANSI_F_OR" ]] \
&& declare -r ANSI_F_OR="${ANSI_}0;33m" \
;

# blue
[[ -z "$ANSI_F_BL" ]] \
&& declare -r ANSI_F_BL="${ANSI_}0;34m" \
;

# purple
[[ -z "$ANSI_F_ID" ]] \
&& declare -r ANSI_F_ID="${ANSI_}0;35m" \
;

# teal
[[ -z "$ANSI_F_TL" ]] \
&& declare -r ANSI_F_TL="${ANSI_}0;36m" \
;

# light_grey
[[ -z "$ANSI_F_LG" ]] \
&& declare -r ANSI_F_LG="${ANSI_}0;37m" \
;

# grey
[[ -z "$ANSI_F_GR" ]] \
&& declare -r ANSI_F_GR="${ANSI_}0;90m" \
;

# pink
[[ -z "$ANSI_F_PK" ]] \
&& declare -r ANSI_F_PK="${ANSI_}0;91m" \
;

# lime
[[ -z "$ANSI_F_LM" ]] \
&& declare -r ANSI_F_LM="${ANSI_}0;92m" \
;

# yellow
[[ -z "$ANSI_F_YL" ]] \
&& declare -r ANSI_F_YL="${ANSI_}0;93m" \
;

# cyan
[[ -z "$ANSI_F_CN" ]] \
&& declare -r ANSI_F_CN="${ANSI_}0;94m" \
;

# magenta
[[ -z "$ANSI_F_PR" ]] \
&& declare -r ANSI_F_PR="${ANSI_}0;95m" \
;

# mint
[[ -z "$ANSI_F_MI" ]] \
&& declare -r ANSI_F_MI="${ANSI_}0;96m" \
;

# white
[[ -z "$ANSI_F_WT" ]] \
&& declare -r ANSI_F_WT="${ANSI_}0;97m" \
;



# --------------------------------------------------------------------------------------
# BOLD WEIGHT
# --------------------------------------------------------------------------------------

# black
[[ -z "$ANSI_F_W6_BK" ]] \
&& declare -r ANSI_F_W6_BK="${ANSI_}1;30m" \
;

# red
[[ -z "$ANSI_F_W6_RD" ]] \
&& declare -r ANSI_F_W6_RD="${ANSI_}1;31m" \
;

# green
[[ -z "$ANSI_F_W6_GN" ]] \
&& declare -r ANSI_F_W6_GN="${ANSI_}1;32m" \
;

# orange
[[ -z "$ANSI_F_W6_OR" ]] \
&& declare -r ANSI_F_W6_OR="${ANSI_}1;33m" \
;

# blue
[[ -z "$ANSI_F_W6_NV" ]] \
&& declare -r ANSI_F_W6_NV="${ANSI_}1;34m" \
;

# purple
[[ -z "$ANSI_F_W6_PR" ]] \
&& declare -r ANSI_F_W6_PR="${ANSI_}1;35m" \
;

# teal
[[ -z "$ANSI_F_W6_AQ" ]] \
&& declare -r ANSI_F_W6_AQ="${ANSI_}1;36m" \
;

# light_grey
[[ -z "$ANSI_F_W6_LG" ]] \
&& declare -r ANSI_F_W6_LG="${ANSI_}1;37m" \
;

# dark_grey
[[ -z "$ANSI_F_W6_GR" ]] \
&& declare -r ANSI_F_W6_GR="${ANSI_}1;90m" \
;

# pink
[[ -z "$ANSI_F_W6_PK" ]] \
&& declare -r ANSI_F_W6_PK="${ANSI_}1;91m" \
;

# lime
[[ -z "$ANSI_F_W6_LM" ]] \
&& declare -r ANSI_F_W6_LM="${ANSI_}1;92m" \
;

# yellow
[[ -z "$ANSI_F_W6_YL" ]] \
&& declare -r ANSI_F_W6_YL="${ANSI_}1;93m" \
;

# cyan
[[ -z "$ANSI_F_W6_BL" ]] \
&& declare -r ANSI_F_W6_BL="${ANSI_}1;94m" \
;

# magenta
[[ -z "$ANSI_F_W6_MG" ]] \
&& declare -r ANSI_F_W6_MG="${ANSI_}1;95m" \
;

# mint
[[ -z "$ANSI_F_W6_CN" ]] \
&& declare -r ANSI_F_W6_CN="${ANSI_}1;96m" \
;

# white
[[ -z "$ANSI_F_W6_WT" ]] \
&& declare -r ANSI_F_W6_WT="${ANSI_}1;97m" \
;



# --------------------------------------------------------------------------------------
# UNDERLINE
# --------------------------------------------------------------------------------------
# black
[[ -z "$ANSI_F_UL_BK" ]] \
&& declare -r ANSI_F_UL_BK="${ANSI_}4;30m" \
;

# red
[[ -z "$ANSI_F_UL_RD" ]] \
&& declare -r ANSI_F_UL_RD="${ANSI_}4;31m" \
;

# green
[[ -z "$ANSI_F_UL_GN" ]] \
&& declare -r ANSI_F_UL_GN="${ANSI_}4;32m" \
;

# orange
[[ -z "$ANSI_F_UL_OR" ]] \
&& declare -r ANSI_F_UL_OR="${ANSI_}4;33m" \
;

# blue
[[ -z "$ANSI_F_UL_NV" ]] \
&& declare -r ANSI_F_UL_NV="${ANSI_}4;34m" \
;

# purple
[[ -z "$ANSI_F_UL_PR" ]] \
&& declare -r ANSI_F_UL_PR="${ANSI_}4;35m" \
;

# teal
[[ -z "$ANSI_F_UL_AQ" ]] \
&& declare -r ANSI_F_UL_AQ="${ANSI_}4;36m" \
;

# white
[[ -z "$ANSI_F_UL_LG" ]] \
&& declare -r ANSI_F_UL_LG="${ANSI_}4;37m" \
;



# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# BACKGROUND CONSTANTS
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# --------------------------------------------------------------------------------------
# REGULAR
# --------------------------------------------------------------------------------------
# black
[[ -z "$ANSI_BG_BK" ]] \
&& declare -r ANSI_BG_BK="${ANSI_}40m" \
;

# red
[[ -z "$ANSI_BG_RD" ]] \
&& declare -r ANSI_BG_RD="${ANSI_}41m" \
;

# green
[[ -z "$ANSI_BG_GN" ]] \
&& declare -r ANSI_BG_GN="${ANSI_}42m" \
;

# orange
[[ -z "$ANSI_BG_OR" ]] \
&& declare -r ANSI_BG_OR="${ANSI_}43m" \
;

# blue
[[ -z "$ANSI_BG_NV" ]] \
&& declare -r ANSI_BG_NV="${ANSI_}44m" \
;

# purple
[[ -z "$ANSI_BG_PR" ]] \
&& declare -r ANSI_BG_PR="${ANSI_}45m" \
;

# teal
[[ -z "$ANSI_BG_AQ" ]] \
&& declare -r ANSI_BG_AQ="${ANSI_}46m" \
;

# light_grey
[[ -z "$ANSI_BG_LG" ]] \
&& declare -r ANSI_BG_LG="${ANSI_}47m" \
;

# grey
[[ -z "$ANSI_BG_GR" ]] \
&& declare -r ANSI_BG_GR="${ANSI_}100m" \
;

# pink
[[ -z "$ANSI_BG_PK" ]] \
&& declare -r ANSI_BG_PK="${ANSI_}101m" \
;

# lime
[[ -z "$ANSI_BG_LM" ]] \
&& declare -r ANSI_BG_LM="${ANSI_}102m" \
;

# yellow
[[ -z "$ANSI_BG_YL" ]] \
&& declare -r ANSI_BG_YL="${ANSI_}103m" \
;

# light_Blue
[[ -z "$ANSI_BG_BL" ]] \
&& declare -r ANSI_BG_BL="${ANSI_}104m" \
;

# light_Purple
[[ -z "$ANSI_BG_MG" ]] \
&& declare -r ANSI_BG_MG="${ANSI_}105m" \
;

# mint
[[ -z "$ANSI_BG_CN" ]] \
&& declare -r ANSI_BG_CN="${ANSI_}106m" \
;

# white
[[ -z "$ANSI_BG_WT" ]] \
&& declare -r ANSI_BG_WT="${ANSI_}107m" \
;
