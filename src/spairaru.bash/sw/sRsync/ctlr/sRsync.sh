#!/usr/bin/env bash
# ######################################################################################
# REMOTE SYNC CONTROLLER UTILITY GROUP
# 
# Description:
# 	This package is use to manage applicaiton: rsysnc.
#
# ######################################################################################
RmtSyncCtlr() {


# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# CORE PRIVATE PROPERTY
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	# [ identity ]
	local __id__="rsync" ;

	# [ command_line ]
	local __cli__="rsync" ;



# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# PACKAGE STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# INSTALL
# ======================================================================================
	RmtSyncCtlr__istl() {


		# POST PROCESSES --------

		spairaru \
			os \
				istl \
					$__id__ \
		;


		# POST PROCESS : REPORT STATUS --------

		return $? ;


	} ;



# ======================================================================================
# UNINSTALL
# ======================================================================================
	RmtSyncCtlr__uistl() {


		# POST PROCESSES --------

		spairaru \
			os \
				uistl \
					$__id__ \
		;


		# POST PROCESS : REPORT STATUS --------

		return $? ;


	} ;



# ======================================================================================
# UPGRADE
# ======================================================================================
	RmtSyncCtlr__upg() {


		# POST PROCESSES --------

		spairaru \
			os \
				upg \
					$__id__ \
		;


		# POST PROCESS : REPORT STATUS --------

		return $? ;


	} ;



# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# STATEFUL STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# IS INSTALLED
# ======================================================================================
	RmtSyncCtlr__isIstld() {


		# POST PROCESSES --------

		spairaru \
			os \
				isIstld \
					$__id__ \
					--cli $__cli__ \
		;


		# POST PROCESS : REPORT STATUS --------

		return $? ;


	} ;



# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# DEFAULT STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# CONSTRUCTOR
# ======================================================================================

	# [ arguments ]
	local -a _ax=("$@") ;


	# HELP --------

	s_isHlp \
		"$@" \
	&& echo "" \
	&& return $tru \
	;


	# VERSION --------

	s_isVer \
		"$@" \
	&& echo "" \
	&& return $tru \
	;


	# POSITIONED ARGUMENT --------

	# [ positoined_arguments ]
	local -a _pax=` \
		spairaru \
			cbl \
				pax \
	` ;


	# [ method ]
	local mtd__="${_pax[0]}" ;


	# MAIN PROCESS : METHOD --------

	# [ method ]
	local _mtd ;


	case "$mtd__" in


		# PAKAGE CORE

		istl | install ) _mtd=RmtSyncCtlr__istl ;;

		uistl | uninstall ) _mtd=RmtSyncCtlr__uistl ;;

		upg | upgrade ) _mtd=RmtSyncCtlr__upg ;;


		# PAKAGE STATEFUL

		isIstld | isIsntalled ) _mtd=RmtSyncCtlr__isIstld ;;


	esac ;


	# - method is not empty
	if [[ "$_mtd" ]] ;
	then


		shift 1 \
		&& "$_mtd" \
			"$@" \
		;


		return $? ;


	fi ;


	# POST PROCESS : REPORT STATUS --------

	return $fls ;


} ;
