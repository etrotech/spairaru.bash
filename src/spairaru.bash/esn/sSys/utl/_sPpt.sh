#!/usr/bin/env bash
# ######################################################################################
# PROMPT UTILITY
# ######################################################################################
# ======================================================================================
# INVOKER PROMPT TEMPLATE - SHELL OPTIMIZE
# ======================================================================================
s_ivkPptTpl_ShOptmz() {


	# [ arguments ]
	local -a _ax=("$@") ;


	# NAMED ARGUMENT --------

	# [ named_arguments ]
	local -A _nax=` \
		s_gtCblNax \
			--atn "a" "action" \
			--atn-nov 1 \
			\
			--stt "s" "status" \
			--stt-nov 1 \
			\
			--cur_lng "current_language" \
			--cur_lng-nov 1 \
			\
			--tgt_lng "target_language" \
			--tgt_lng-dflt "optimized" \
			--tgt_lng-nov 1 \
			\
			--usr "user" \
			--usr-nov 1 \
	` ;


	# [ action ]
	local atn="${_nax[atn]}" ;

	# [ status ]
	local stt="${_nax[stt]}" ;

	# [ current_language ]
	local cur_lng="${_nax[cur_lng]}" ;

	# [ target_language ]
	local tgt_lng="${_nax[tgt_lng]}" ;

	# [ user ]
	local usr="${_nax[usr]}" ;


	# PRE PROCESS : STATUS --------

	# [ message ]
	local _msg ;

	# [ target_language ]
	local _tgt_lng ;


	[[ "$tgt_lng" == "optimized" ]] \
	&& _tgt_lng="$tgt_lng" \
	|| _tgt_lng="${ANSI_F_OR}${tgt_lng}${_ANSI}" \
	;


	# MAIN PROCESS : STATUS ) 0 --------

	if [[ $stt == $tru ]] ;
	then


		# ACTION ) ADD

		if [[ "$atn" =~ ^(ad|add)$ ]] ;
		then

			_msg="%s configuration is added to %s for %s" ;


		# ACTION ) REMOVE

		elif [[ "$atn" =~ ^(rm|remove)$ ]] ;
		then

			_msg="%s configuration is removed from %s for %s" ;


		fi ;


		s_ivkPptTpl_DfltAcpt \
			"$_msg" \
			"$_tgt_lng" \
			"${ANSI_F_OR}${cur_lng}${_ANSI}" \
			"${ANSI_F_ID}${usr}${_ANSI}" \
		;


	# MAIN PROCESS : STATUS ) 1 --------

	else


		# ACTION ) ADD

		if [[ "$atn" =~ ^(ad|add)$ ]] ;
		then

			_msg="%s configuration cloud not add to %s for %s" ;


		# ACTION ) REMOVE

		elif [[ "$atn" =~ ^(rm|remove)$ ]] ;
		then

			_msg="%s configuration cloud not remove from %s for %s" ;


		fi ;


		s_ivkPptTpl_DfltRej \
			"$_msg" \
			"$_tgt_lng" \
			"${ANSI_F_OR}${cur_lng}${_ANSI}" \
			"${ANSI_F_ID}${usr}${_ANSI}" \
		;


	fi ;


} ;
