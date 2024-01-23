#!/usr/bin/env bash
# ######################################################################################
# VERBOSE UTILITY
# ######################################################################################
# ======================================================================================
# INVOKER PROMPT TEMPLATE - MISSING POSITIONED ARGUMENT
# ======================================================================================
s_ivkPptTpl_CblMpa () {


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
			--pos "position" \
			--pos-nov 1 \
			--pos-dflt "lo" \
	` ;


	# [ position ]
	local pos="${_nax[pos]}" ;


	# MAIN PROCESS : ERROR --------

	s_ivkPptTpl_DfltRej \
		"%s is not given." \
		"${ANSI_F_PR}`__ "${_pax[@]}"`${_ANSI}" \
	;


	# MAIN PROCESS : POSITION --------

	[[ -n "$pos" ]] \
	&& s_ivkPptTpl_DfltBlkCnt \
		"↑ the %s positoined argument" \
		"${ANSI_F_OR}`__ "$pos"`${_ANSI}" \
	;


	# POST PROCESS : REPORT STATUS --------

	return $tru ;


} ;
