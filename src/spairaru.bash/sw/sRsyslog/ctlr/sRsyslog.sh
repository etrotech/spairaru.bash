#!/usr/bin/env bash
# ######################################################################################
# REMOTE SYSTEM LOG CONTROLLER UTILITY GROUP
# 
# Description:
# 	This package is use to manage applicaiton: rsyslog.
#
# File System Map:
# 	📦
# 	└─ 🖿 usr
# 	   └─ 🖿 sbin
# 	      └─ 🖿 systemd
# 	⏳
# 	├─ 🖿 etc
# 	│  └─ 🖿 systemd
# 	│     └─ 🖿 system
# 	│        ├─ 🖺 multi-user.target.wants
# 	│        └─ 🖺 syslog.service
# 	└─ lib
# 	   └─ systemd
# 	      └─ system
# 	         ├─ 🖺 multi-user.target.wants
# 	         └─ 🖺 syslog.service
# 	🛠️
# 	└─ 🖿 etc
# 	   ├─ 🖿 rsyslog.d
# 	   │  ├─ 🖺 50-spairaru.conf
# 	   │  └─ 🖺 100-~.conf
# 	   └─ 🖺 rsyslog.conf
# 	👟
# 	└─ 🖿 var
# 	   └─ 🖿 spool
# 	      └─ 🖺 rsyslog
#
# ######################################################################################
RmtSysLogCtlr() {


# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# CORE PRIVATE PROPERTY
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	# [ identity ]
	local __id__="rsyslog" ;

	# [ command_line ]
	local __cli__="rsyslogd" ;



# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# CONFIGURATIVE STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# OPTIMIZE
# ======================================================================================
	RmtSysLogCtlr__optmz() {


		# [ result ]
		local _rslt=$tru ;


		# PRECHECKS --------

		if ! isIstld ;
		then


			[[ $env_vbo == $tru ]] \
			&& spairaru \
				ppt \
					ivk \
						GnlIdvAtnx \
						--atn "istl" \
						--stt  2 \
						--ttl "${ANSI_F_GN}${__id__}${_ANSI}" \
			;


			return $fls ;


		fi ;


		# MAIN PROCESS : DEFAULT PROFILE --------

		# [ default_profile_file_absolute_path ]
		local _dflt_prfl_fl_abs_pf="` \
			s_gtRsyslogRotPrflPf \
				--dflt \
		`" ;


		# A ) ENABLE MODULES

		# 1 			: action
		# 2 			: file path
		# 3+ 			: contents
		RmtSysLogPrflCtlr \
			uc \
				"module\(load=\"imtcp\"\)" \
				"module\(load=\"imudp\"\)" \
			--pf "$_dflt_prfl_fl_abs_pf" \
		;


		# MAIN PROCESS : GLOBAL PROFILE --------

		# [ global_profile_file_absolute_path ]
		local _glo_prfl_fl_abs_pf="` \
			s_gtRsyslogRotPrflPf \
				--glo \
		`" ;


		# A ) KERNEL

		# 1 			: action
		# 2+ 			: contents
		# pf 			: profile path
		RmtSysLogPrflCtlr \
			wrt \
				"# KERNEL" \
			--pf "$_glo_prfl_fl_abs_pf" \
		;


		# B ) CRON

		# 1 			: action
		# 2+ 			: contents
		# pf 			: profile path
		RmtSysLogPrflCtlr \
			rmrk \
				"CRON" \
			--pf "$_glo_prfl_fl_abs_pf" \
		;

		# 1 			: action
		# 2+ 			: log paths
		# fac 			: facility
		# prio 			: priority
		# mk_fl 		: make file if not exists
		# sp 			: stop progression
		# --
		# aft 			: write in after this condition
		# --
		# pf 			: profile path
		# vbo_ttl		: verbose title
		RmtSysLogPrflCtlr \
			fltr \
				"/var/log/cron.log" \
				--fac "cron" \
				--mk_fl \
				\
				--aft '# CRON(\n|\n\r)' \
			\
			--pf "$_glo_prfl_fl_abs_pf" \
			--vbo_ttl "cron.*" \
		;


		# C ) DAEMON

		# 1 			: action
		# 2+ 			: contents
		RmtSysLogPrflCtlr \
			rmrk \
				"DAEMON" \
			--pf "$_glo_prfl_fl_abs_pf" \
		;

		# 1 			: action
		# 2+ 			: log paths
		# fac 			: facility
		# prio 			: priority
		# mk_fl 		: make file if not exists
		# sp 			: stop progression
		# --
		# aft 			: write in after this condition
		# --
		# pf 			: profile path
		# vbo_ttl		: verbose title
		RmtSysLogPrflCtlr \
			fltr \
				"/var/log/daemon.log" \
				--fac "daemon" \
				--mk_fl \
				\
				--aft '# DAEMON\^\|' \
			\
			--vbo_ttl "daemon.*" \
			--pf "$_glo_prfl_fl_abs_pf" \
		;


		# D ) EMAIL

		# 1 			: action
		# 2+ 			: contents
		RmtSysLogPrflCtlr \
			rmrk \
				"EMAIL" \
			--pf "$_glo_prfl_fl_abs_pf" \
		;

		# 1 			: action
		# 2+ 			: log paths
		# fac 			: facility
		# prio 			: priority
		# mk_fl 		: make file if not exists
		# sp 			: stop progression
		# --
		# aft 			: write in after this condition
		# --
		# pf 			: profile path
		# vbo_ttl		: verbose title
		RmtSysLogPrflCtlr \
			fltr \
				"/var/log/mail.err.log" \
				--fac "mail" \
				--prio "err" \
				--mk_fl \
				\
				--aft '# EMAIL\^\|' \
			\
			--pf "$_glo_prfl_fl_abs_pf" \
			--vbo_ttl "mail.err" \
		;

		# 1 			: action
		# 2+ 			: log paths
		# fac 			: facility
		# prio 			: priority
		# mk_fl 		: make file if not exists
		# sp 			: stop progression
		# --
		# aft 			: write in after this condition
		# --
		# vbo_ttl		: verbose title
		# pf 			: profile path
		RmtSysLogPrflCtlr \
			fltr \
				"/var/log/mail.info.log" \
				--fac "mail" \
				--prio "info" \
				--mk_fl \
				--aft 'mail\.err.*\^\|' \
			--vbo_ttl "mail.info" \
			--pf "$_glo_prfl_fl_abs_pf" \
		;

		# 1 			: action
		# 2+ 			: log paths
		# fac 			: facility
		# prio 			: priority
		# mk_fl 		: make file if not exists
		# sp 			: stop progression
		# --
		# aft 			: write in after this condition
		# --
		# vbo_ttl		: verbose title
		# pf 			: profile path
		RmtSysLogPrflCtlr \
			fltr \
				"/var/log/mail.warn.log" \
				--fac "warn" \
				--prio "warn" \
				--mk_fl \
				--aft 'mail\.info.*\^\|' \
			--vbo_ttl "mail.warn" \
			--pf "$_glo_prfl_fl_abs_pf" \
		;


		# MAIN PROCESS : /etc/rsyslog.d/50-default.conf --------

		# A ) KERNEL

		# B ) CRON

		# 1 			: action
		# 2+ 			: conditions
		RmtSysLogPrflCtlr \
			co \
				"cron\.\*.*cron\.log" \
			--pf "/etc/rsyslog.d/50-default.conf" \
		;


		# C ) DAEMON

		# 1 			: action
		# 2+ 			: conditions
		RmtSysLogPrflCtlr \
			co \
				"daemon\.\*.*daemon\.log" \
			--pf "/etc/rsyslog.d/50-default.conf" \
		;

		# D ) EMAIL

		# 1 			: action
		# 2+ 			: conditions
		RmtSysLogPrflCtlr \
			co \
				"mail\.\*.*mail\.log" \
				"mail\.err.*mail\.err" \
				"mail\.info.*mail\.info" \
				"mail\.warn.*mail\.warn" \
			--pf "/etc/rsyslog.d/50-default.conf" \
		;


		# POST PROCESS : DISPLAY MESSAGE --------

		[[ $env_vbo == $tru ]] \
		&& s_ivkPptTpl_DfltAcpt \
			"%s is been optimized." \
			"${ANSI_F_GN}${__id__}${_ANSI}" \
		;


		# POST PROCESS : REPORT STATUS --------

		return $_rslt ;


	} ;



# ======================================================================================
# FILTER
# ======================================================================================
	RmtSysLogCtlr__fltr() {


		# MAIN PROCESSES --------

		RmtSysLogPrflCtlr \
			fltr \
				"$@" \
		;


		# POST PROCESS : REPORT STATUS --------

		return $? ;


	} ;



# ======================================================================================
# FORMAT
# ======================================================================================
	RmtSysLogCtlr__fmt() {


		# MAIN PROCESSES --------

		RmtSysLogPrflCtlr \
			fmt \
				"$@" \
		;


		# POST PROCESS : REPORT STATUS --------

		return $? ;


	} ;



# ======================================================================================
# TEMPLATE
# ======================================================================================
	RmtSysLogCtlr__tpl() {


		# MAIN PROCESSES --------

		RmtSysLogPrflCtlr \
			tpl \
				"$@" \
		;


		# POST PROCESS : REPORT STATUS --------

		return $? ;


	} ;



# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# PACKAGE STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# INSTALL
# ======================================================================================
	RmtSysLogCtlr__istl() {


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
	RmtSysLogCtlr__uistl() {


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
	RmtSysLogCtlr__upg() {


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
	RmtSysLogCtlr__isIstld() {


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

		optmz | optimize ) _mtd=RmtSysLogCtlr__optmz ;;

		prfl | profile ) _mtd=RmtSysLogPrflCtlr ;;


		fltr | filter ) _mtd=RmtSysLogCtlr__fltr ;;

		fmt | format ) _mtd=RmtSysLogCtlr__fmt ;;

		tpl | template ) _mtd=RmtSysLogCtlr__tpl ;;


		# PAKAGE CORE

		istl | install ) _mtd=RmtSysLogCtlr__istl ;;

		uistl | uninstall ) _mtd=RmtSysLogCtlr__uistl ;;

		upg | upgrade ) _mtd=RmtSysLogCtlr__upg ;;


		# PAKAGE STATEFUL

		isIstld | isIsntalled ) _mtd=RmtSysLogCtlr__isIstld ;;


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
