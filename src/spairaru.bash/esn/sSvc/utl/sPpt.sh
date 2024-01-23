#!/usr/bin/env bash
# ######################################################################################
# PROMPT UTILITY
# ######################################################################################
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# SERVICE
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ======================================================================================
# INVOKER PROMPT TEMPLATE - GENERAL ACTIONS
#
# Description:
# 	Template for service general actions.
#
# ======================================================================================
s_ivkPptTpl_SvcGnlAtnx() {


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
			--ttl "title" \
			--ttl-nov 1 \
	` ;


	# [ action ]
	local atn="${_nax[atn]}" ;

	# [ status ]
	local stt="${_nax[stt]}" ;


	# PRE PROCESS : SOURCE TITLE --------

	# [ title ]
	local _ttl ;


	[[ -n "${_nax[ttl]}" ]] \
	&& _ttl=": ${ANSI_F_BL}${_nax[ttl]}${_ANSI}" \
	;


	# MAIN PROCESS : STATUS 0 --------

	if [[ $stt == $tru ]] ;
	then

		# A ) ENABLE

		if [[ "$atn" =~ ^(nbl|enable)$ ]] ;
		then 

			s_ivkPptTpl_DfltAcpt \
				"service%s is enabled." \
				"$_ttl" \
			;


		# B ) DISABLE

		elif [[ "$atn" =~ ^(dsbl|disable)$ ]] ;
		then 

			s_ivkPptTpl_DfltAcpt \
				"service%s is disabled." \
				"$_ttl" \
			;


		# C ) START

		elif [[  "$atn" =~ ^(st|start)$ ]] ;
		then 

			s_ivkPptTpl_DfltAcpt \
				"service%s has started." \
				"$_ttl" \
			;


		# D ) RESTART

		elif [[  "$atn" =~ ^(rst|restart)$ ]] ;
		then 

			s_ivkPptTpl_DfltAcpt \
				"service%s has restarted." \
				"$_ttl" \
			;


		# E ) STOP

		elif [[  "$atn" =~ ^(sp|stop)$ ]] ;
		then 

			s_ivkPptTpl_DfltAcpt \
				"service%s has stopped." \
				"$_ttl" \
			;

		fi ;


	# MAIN PROCESS : STATUS 2 --------

	elif [[ $stt == 2 ]] ;
	then

			s_ivkPptTpl_DfltAcpt \
				"service%s dose not exist." \
				"$_ttl" \
			;


	# MAIN PROCESS : STATUS 1 --------

	else

		# A ) ENABLE

		if [[ "$atn" =~ ^(nbl|enable)$ ]] ;
		then 

			s_ivkPptTpl_DfltAcpt \
				"failed to enable service%s." \
				"$_ttl" \
			;


		# B ) DISABLE

		elif [[ "$atn" =~ ^(dsbl|disable)$ ]] ;
		then 

			s_ivkPptTpl_DfltAcpt \
				"failed to disable service%s." \
				"$_ttl" \
			;


		# C ) START

		elif [[  "$atn" =~ ^(st|start)$ ]] ;
		then 

			s_ivkPptTpl_DfltAcpt \
				"failed to start service%s." \
				"$_ttl" \
			;


		# D ) RESTART

		elif [[  "$atn" =~ ^(rst|restart)$ ]] ;
		then 

			s_ivkPptTpl_DfltAcpt \
				"failed to restart service%s." \
				"$_ttl" \
			;


		# E ) STOP

		elif [[  "$atn" =~ ^(sp|stop)$ ]] ;
		then 

			s_ivkPptTpl_DfltAcpt \
				"failed to stop service%s." \
				"$_ttl" \
			;

		fi ;


	fi ;


} ;
