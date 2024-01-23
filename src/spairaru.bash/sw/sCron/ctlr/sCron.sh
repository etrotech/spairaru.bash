#!/usr/bin/env bash
# ######################################################################################
# CRON CONTROLLER UTILITY GROUP
#
# File System Map:
# 	📦
# 	└─ 🖿 usr
# 	   └─ 🖿 sbin
# 	      └─ 🖿 cron
# 	🛠️
# 	├─ 🖿 etc
# 	│  ├─ 🖿 cron.d
# 	│  │  ├─ 🖺 s
# 	│  │  └─ 🖺 $USER 👈
# 	│  ├─ 🖿 cron.daily
# 	│  ├─ 🖿 cron.hourly
# 	│  ├─ 🖿 cron.monthly
# 	│  ├─ 🖿 cron.weekly
# 	│  └─ 🖺 crontab
# 	└─ 🖿 var
# 	   └─ 🖿 spool
# 	      ├─ 🖺 cron
# 	      ├─ 🖺 atjobs
# 	      ├─ 🖺 atspool
# 	      └─ 🖿 crontabs
# 	         └─ ...
#
# ######################################################################################
CronCtlr() {


# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# CORE PRIVATE PROPERTY
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	# [ identity ]
	local __id__="cron" ;

	# [ command_line ]
	local __cli__="cron" ;



# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# CONFIGURATIVE STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# TASK
# ======================================================================================
	tsk() {


		# MAIN PROCESSES --------

		CronPrflCtlr \
			tsk \
				"$@" \
		;


		# POST PROCESS : REPORT STATUS --------

		return $? ;


	} ;



# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# PACKAGE STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# UPGRADE
# ======================================================================================
	GitCtlr__upg() {


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
	isIstld() {


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


		# CONFIGURATIVE

		prfl | profile ) _mtd=CronPrflCtlr ;;

		tsk | task ) _mtd=CronCtlr__tsk ;;


		# PAKAGE CORE

		upg | upgrade ) _mtd=LogRotCtlr__upg ;;


		# PAKAGE STATEFUL

		isIstld | isIsntalled ) _mtd=CronCtlr__isIstld ;;


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
