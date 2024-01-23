#!/usr/bin/env bash
# ######################################################################################
# GENERAL OVERRIGHT
# ######################################################################################

# True
[[ -z $TRUE ]] \
&& declare -r TRUE=0 \
;

[[ -z $TRU ]] \
&& declare -r TRU=0 \
;

[[ -z $tru ]] \
&& declare -r tru=0 \
;


# False
[[ -z $FALSE ]] \
&& declare -r FALSE=1 \
;

[[ -z $FLS ]] \
&& declare -r FLS=1 \
;

[[ -z $fls ]] \
&& declare -r fls=1 \
;
