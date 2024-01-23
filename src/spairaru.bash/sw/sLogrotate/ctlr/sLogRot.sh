#!/usr/bin/env bash
# ######################################################################################
# LOGROTATE CONTROLLER UTILITY GROUP
#
# File System Map:
# 	📦
# 	└─ 🖿 usr
# 	   └─ 🖿 sbin
# 	      └─ 🖿 logrotate
# 	⏳
# 	└─ 🖿 etc
# 	   └─ 🖿 cron.daily
# 	      └─ 🖺 logrotate
# 	🛠️
# 	└─ 🖿 etc
# 	   ├─ 🖿 logrotate.d
# 	   │  ├─ 🖺 s
# 	   │  └─ 🖺 $USER
# 	   └─ 🖺 logrotate.conf
#
# ######################################################################################
LogRotCtlr() (


# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# CORE PRIVATE PROPERTY
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	# [ identity ]
	local __id__="logrotate" ;

	# [ command_line ]
	local __cli__="logrotate" ;



# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# CONFIGURATIVE STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# OPTIMIZE
# ======================================================================================
	LogRotCtlr__optmz() {


		# [ result ]
		local _rslt=$tru ;


		# PRECHECKS --------

		if ! isIstld ;
		then


			[[ $env_vbo == $tru ]] \
			&& ppt \
					ivk \
						GnlIdvAtnx \
						--atn "istl" \
						--stt  2 \
						--ttl "${ANSI_F_GN}${__id__}${_ANSI}" \
			;


			return $fls ;


		fi ;


		# MAIN PROCESS : GLOBAL PROFILE --------

		# [ global_profile_file_absolute_path ]
		local _glo_prfl_fl_abs_pf="` \
			s_gtLogRotPrflPf \
				--glo \
		`" ;


		# A ) KERNEL

		# 1 			: action
		# 2+ 			: contents
		LogRotPrflCtlr \
			wrt \
				"# KERNEL" \
			--pf "$_glo_prfl_fl_abs_pf" \
		;


		# B ) CRON

		# 1 			: action
		# 2+ 			: contents
		LogRotPrflCtlr \
			rmrk \
				"CRON" \
			--pf "$_glo_prfl_fl_abs_pf" \
		;


		# C ) DAEMON

		# 1 			: action
		# 2+ 			: contents
		LogRotPrflCtlr \
			rmrk \
				"DAEMON" \
			--pf "$_glo_prfl_fl_abs_pf" \
		;


		# D ) EMAIL

		# 1 			: action
		# 2+ 			: contents
		LogRotPrflCtlr \
			rmrk \
				"EMAIL" \
			--pf "$_glo_prfl_fl_abs_pf" \
		;


		# 1 			: action
		# 2+ 			: log paths
		# cmprs 		: compress
		# rsyslog 		: refresh rsyslog
		# --
		# aft 			: write in after this condition
		# --
		# vbo_ttl 		: profile path
		# Vt 			: verbose title
		LogRotPrflCtlr \
			rot \
				"/var/log/mail.err.log" \
				"/var/log/mail.info.log" \
				"/var/log/mail.warn.log" \
				--cmprs \
				--rsyslog \
				--mk_fl \
				--aft '# EMAIL\^\|' \
			\
			--pf "$_glo_prfl_fl_abs_pf" \
			--vbo_ttl "mail" \
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
# ROTATE
# ======================================================================================
	LogRotCtlr__rot() {


		# MAIN PROCESSES --------

		LogRotPrflCtlr \
			rot \
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
	LogRotCtlr__istl() {


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
	LogRotCtlr__uistl() {


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
	LogRotCtlr__isIstld() {


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

		optmz | optimize ) _mtd=LogRotCtlr__optmz ;;

		prfl | profile ) _mtd=LogRotPrflCtlr ;;


		rot | rotate ) _mtd=LogRotCtlr__rot ;;


		# PAKAGE CORE

		istl | install ) _mtd=LogRotCtlr__istl ;;

		uistl | uninstall ) _mtd=LogRotCtlr__uistl ;;

		upg | upgrade ) _mtd=LogRotCtlr__upg ;;


		# PAKAGE STATEFUL

		isIstld | isIsntalled ) _mtd=LogRotCtlr__isIstld ;;


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


 ) ;
