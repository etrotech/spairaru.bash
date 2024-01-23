#!/usr/bin/env bash
# ######################################################################################
# PROMPT UTILITY
# ######################################################################################
# ======================================================================================
# INVOKER PROMPT TEMPLATE - MANIPULATION ACTIONS
#
# Description:
# 	Template for document action of Add, Delete and Remove.
#
# ======================================================================================
s_ivkPptTpl_DocMnpAtnx() {


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
			--tgt_cat "sc" "target_category" \
			--tgt_cat-nov 1 \
			--tgt_ttl "st" "target_title" \
			--tgt_ttl-nov 1 \
			\
			--doc_cat "dc" "document_category" \
			--doc_cat-nov 1 \
			--doc_ttl "dt" "document_title" \
			--doc_ttl-nov 1 \
			--doc_pf "dp" "document_path" \
			--doc_pf-nov 1 \
	` ;


	# [ action ]
	local atn="${_nax[atn]}" ;

	# [ status ]
	local stt="${_nax[stt]}" ;


	# [ document_path ]
	local doc_pf="${_nax[doc_pf]}" ;


	# PRE PROCESS : SOURCE CATEGORY --------

	# [ target_category ]
	local _tgt_cat ;


	[[ \
		"${_nax[tgt_cat]}" \
		&& "${_nax[tgt_ttl]}" \
	]] \
	&& _tgt_cat="${_nax[tgt_cat]}: " \
	|| _tgt_cat="${_nax[tgt_cat]}" \
	;


	# PRE PROCESS : SOURCE TITLE --------

	# [ target_title ]
	local _tgt_ttl ;


	[[ -n "${_nax[tgt_ttl]}" ]] \
	&& _tgt_ttl="${ANSI_F_BL}${_nax[tgt_ttl]}${_ANSI}" \
	;


	# PRE PROCESS : DESTINATION CATEGORY --------

	# [ document_category ]
	local _doc_cat ;


	[[ \
		"${_nax[doc_cat]}" \
		&& "${_nax[doc_ttl]}" \
	]] \
	&& _doc_cat="${_nax[doc_cat]}: " \
	|| _doc_cat="${_nax[doc_cat]}" \
	;


	# PRE PROCESS : DESTINATION TITLE --------

	# [ document_title ]
	local _doc_ttl ;


	[[ -n "${_nax[doc_ttl]}" ]] \
	&& _doc_ttl="${ANSI_F_PR}${_nax[doc_ttl]}${_ANSI}" \
	;


	# MAIN PROCESS : STATUS 0 --------

	if [[ $stt == $tru ]] ;
	then

		# A ) ADD

		if [[ $atn == "ad" ]] ;
		then 
		
			s_ivkPptTpl_DfltAcpt \
				"%s%s is added into %s%s." \
				"$_tgt_cat" \
				"$_tgt_ttl" \
				"$_doc_cat" \
				"$_doc_ttl" \
			;


		# B ) DELETE

		elif [[ $atn == "dl" ]] ;
		then

			s_ivkPptTpl_DfltAcpt \
				"%s%s is deleted from %s%s." \
				"$_tgt_cat" \
				"$_tgt_ttl" \
				"$_doc_cat" \
				"$_doc_ttl" \
			;


		# C ) REMOVE

		elif [[ $atn == "rm" ]] ;
		then

			s_ivkPptTpl_DfltAcpt \
				"%s%s is removed from %s%s." \
				"$_tgt_cat" \
				"$_tgt_ttl" \
				"$_doc_cat" \
				"$_doc_ttl" \
			;


		fi ;


	# MAIN PROCESS : STATUS 2 --------

	elif [[ $stt == 2 ]] ;
	then

		# A ) ADD

		if [[ $atn == "ad" ]] ;
		then 

			s_ivkPptTpl_DfltAcpt \
				"%s%s is already added into %s%s." \
				"$_tgt_cat" \
				"$_tgt_ttl" \
				"$_doc_cat" \
				"$_doc_ttl" \
				--wc \
			;


		# B ) DELETE

		elif [[ $atn == "dl" ]] ;
		then

			s_ivkPptTpl_DfltAcpt \
				"%s%s is already deleted from %s%s." \
				"$_tgt_cat" \
				"$_tgt_ttl" \
				"$_doc_cat" \
				"$_doc_ttl" \
				--wc \
			;


		# C ) REMOVE

		elif [[ $atn == "rm" ]] ;
		then

			s_ivkPptTpl_DfltAcpt \
				"%s%s is already remove from %s%s." \
				"$_tgt_cat" \
				"$_tgt_ttl" \
				"$_doc_cat" \
				"$_doc_ttl" \
				--wc \
			;


		fi ;


	# MAIN PROCESS : STATUS 1 --------

	else

		# A ) ADD

		if [[ $atn == "ad" ]] ;
		then 

			s_ivkPptTpl_DfltRej \
				"unable to add %s%s into %s%s." \
				"$_tgt_cat" \
				"$_tgt_ttl" \
				"$_doc_cat" \
				"$_doc_ttl" \
			;


		# B ) DELETE

		elif [[ $atn == "dl" ]] ;
		then

			s_ivkPptTpl_DfltRej \
				"unable to delete %s%s from %s%s." \
				"$_tgt_cat" \
				"$_tgt_ttl" \
				"$_doc_cat" \
				"$_doc_ttl" \
			;


		# C ) REMOVE

		elif [[ $atn == "rm" ]] ;
		then

			s_ivkPptTpl_DfltRej \
				"unable to remove %s%s from %s%s." \
				"$_tgt_cat" \
				"$_tgt_ttl" \
				"$_doc_cat" \
				"$_doc_ttl" \
			;


		fi ;


	fi ;


	# MAIN PROCESS : ADDITIONALS --------

	# A ) DESTINATION PATH

	if [[ "$doc_pf" ]] ;
	then


		# [ action_icon ]
		local _atn_ico ;


		# - action is add
		if [[ $atn == "ad" ]] ;
		then

			_atn_ico="icr" ;


		# - otherwise
		else 

			_atn_ico="dcr" ;


		fi ;


		s_ivkPptTpl_DfltBlkCnt \
			"${ANSI_F_LG}`s_gtIco $_atn_ico`${_ANSI}${ANSI_F_LG}`s_gtIco fl`${_ANSI}${ANSI_F_CN}%s${_ANSI}" \
			"` s_prtFsPf "$doc_pf" `" \
		;


	fi ;


} ;
