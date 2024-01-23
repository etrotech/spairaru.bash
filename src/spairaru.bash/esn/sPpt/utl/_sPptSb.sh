#!/usr/bin/env bash
# ######################################################################################
# PROMPT SCROLL BAR CORE UTILITY
# ######################################################################################
# ======================================================================================
# CHECK PROMPT SCROLL BAR
# ======================================================================================
s_chkPptSclBr() {


	# [ prompt_max_rows ]
	local _ppt_max_rowx=` s_gtTmlRowx ` ;


	if [[ \
		-z $S_PPT_MAX_ROWX \
		|| $_ppt_max_rowx -ne $S_PPT_MAX_ROWX \
	]] ;
	then


		# [ number_of_scrollable_rows ]
		local _nf_sclbl_rowx=$(( _ppt_max_rowx-1 )) ;


		# 
		# ↓ Insert new lane to avoid visual glitch.
		# e 			: enable interpretation of backslash escapes
		# n 			: do not output a newline
		echo \
			-en \
		'\n' \
		;

		# Recalculate scroll height.
	
		s_stupPptSclBr \
			$_nf_sclbl_rowx \
		;


		S_PPT_MAX_ROWX=$_ppt_max_rowx ;


	fi ;


} ;



# ======================================================================================
# CLEAR PROMPT SCROLL BAR
# ======================================================================================
s_clrPptSclBr() {


	# POST PROCESS : TEMPORARIES --------

	S_PPT_MAX_ROWX= ;

	S_PPT_MAX_COLX= ;


	# POST PROCESS : REPORT STATUS --------

	return $tru


} ;



# ======================================================================================
# SETUP PROMPT SCROLL BAR
# ======================================================================================
s_stupPptSclBr() {


	# POSITIONED ARGUMENT --------

	# [ target_lines ]
	local _tgt_lnx=$1 ;


	# MAIN PROCESS : SCROLL AREA --------

	# ↓ Save cursor location.
	# \033[ 		: asni escape
	# s 			: restore cursor
	echo \
		-en \
		"$ANSI_CRSR_SV" \
	;


	# ↓ Set scroll area, from 0 to max-1.
	# * this will place the cursor in the top left
	# \033[ 		: asni escape
	# 0 			: start line
	# ; 			: range spliter
	# \d+ 			: end line
	# r 			: set scrolling region
	echo \
		-en \
		"${ANSI_}1;${_tgt_lnx}r" \
	;


	# ↓ Restore cursor, 
	#   and ensure its inside the scroll area by move a line up.
	# \033[ 		: asni escape
	# u 			: restore cursor
	echo \
		-en \
		"$ANSI_CRSR_RSTR" \
	;

	# \033[ 		: asni escape
	# 1 			: 1 line.
	# A 			: cursor up
	echo \
		-en \
		"${ANSI_}1A" \
	;


} ;
