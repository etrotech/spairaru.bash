#!/usr/bin/env bash
# ######################################################################################
# SPAIRARU PACKAGE CONTROLLER UTILITY GROUP
# ######################################################################################
SpairaruCtlr_Pkg() {


# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# PACKAGE STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# INSTALL
# ======================================================================================
	SpairaruCtlr_Pkg__istl() {


		# [ result ]
		local _rslt ;


		# MAIN PROCESS : ADD FILES --------

		[[ $env_vbo == $tru ]] \
		&& s_ivkPptTpl_DfltBlkTtl \
			"Adding Files and Changing Permissions..." \
			"`__ "${ANSI_F_BL}${S_NM}${_ANSI}"`" \
		;


		SpairaruCtlr_Pkg____istlFlx ;

		_rslt=$? ;


		# MAIN PROCESS : ADD ALIASES --------


		if [[ $_rslt == $tru ]] ;
		then


			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_DfltBlkTtl \
				"Adding Aliases..." \
			;


			SpairaruCtlr_Pkg____istlAkax ;

			_rslt=$? ;


		fi ;


		# POST PROCESS : REPORT STATUS --------

		return $_rslt ;


	} ;



# ======================================================================================
# UNINSTALL
# ======================================================================================
	SpairaruCtlr_Pkg__uistl() {


		# [ result ]
		local _rslt ;


		[[ $env_vbo == $tru ]] \
		&& s_ivkPptTpl_DfltSecTtl \
			"%s : Uninstallation" \
			"$S_TTL" \
		;


		# MAIN PROCESS : REMOVE ALIASES --------

		[[ $env_vbo == $tru ]] \
		&& s_ivkPptTpl_DfltBlkTtl \
			"Removing Aliases..." \
		;


		SpairaruCtlr_Pkg____unistlAkax ;

		_rslt=$? ;


		# MAIN PROCESS : REMOVE FILES --------

		if [[ $_rslt == $tru ]] ;
		then


			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_DfltBlkTtl \
				"Removing Files..." \
			;


			SpairaruCtlr_Pkg____unistlFlx ;

			_rslt=$? ;


		fi ;


		# POST PROCESS : REPORT STATUS --------

		return $_rslt ;


	} ;



# ======================================================================================
# UPGRADE
# ======================================================================================
	SpairaruCtlr_Pkg__upg() {


		# [ result ]
		local _rslt=$fls ;


		[[ $env_vbo == $tru ]] \
		&& s_ivkPptTpl_DfltSecTtl \
			"%s : Upgradation" \
			"$S_TTL" \
		;


		[[ $env_vbo == $tru ]] \
		&& s_ivkPptTpl_DfltBlkTtl \
			"Checking Update..." \
		;


		# POST PROCESS : OUTPUT MESSAGE --------

		[[ $env_vbo == $tru ]] \
		&& s_ivkPptTpl_GnlIdvAtnx \
			--atn "upg" \
			--stt $_rslt \
		;


		# POST PROCESS : REPORT STATUS --------

		return $_rslt ;


	} ;



# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# PACKAGE PRIVATE FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# __INSTALL FILES
# ======================================================================================
	SpairaruCtlr_Pkg____istlFlx() {


		# 	📦
		# 	└─ 🖿 opt
		# 	   └─ 🖿 EtroTech spairaru.bash 👈
		# 	      └─ 🖺 spairaru.sh
		# 	🛠️
		# 	├─ 🖿 etc
		# 	│  └─ 🖿 EtroTech spairaru.bash
		# 	│     └─ 🖺 s.cnf
		# 	├─ 🖿 $HOME
		# 	│  └─ 🖿 .s.bash
		# 	?     └─ 🖺 s.cnf
		# 	└─ 🖿 $PWD
		# 	   └─ 🖿 .s.bash
		# 	      └─ 🖺 s.cnf
		# 	📄
		# 	└─ 🖿 var
		# 	   └─ 🖿 log
		# 	      └─ 🖿 EtroTech spairaru.bash
		# 	🗑️
		# 	└─ 🖿 tmp
		# 	   └─ 🖿 EtroTech spairaru.bash

		! s \
			fldr \
				ex \
					"$S_APP_FLDR" \
		&& return $fls \
		;


		[[ "$RL_USR" != root ]] \
		&& s \
			fldr \
				onr \
					"$S_APP_FLDR" \
					"$RL_USR" \
			\
			--vbo_ttl "Applicaiton" \
		;


		# 	📦
		# 	└─ 🖿 opt
		# 	   └─ 🖿 EtroTech spairaru.bash
		# 	      └─ 🖺 spairaru.sh 👈
		# 	🛠️
		# 	├─ 🖿 etc
		# 	│  └─ 🖿 EtroTech spairaru.bash
		# 	│     └─ 🖺 s.cnf
		# 	├─ 🖿 $HOME
		# 	│  └─ 🖿 .s.bash
		# 	?     └─ 🖺 s.cnf
		# 	└─ 🖿 $PWD
		# 	   └─ 🖿 .s.bash
		# 	      └─ 🖺 s.cnf
		# 	📄
		# 	└─ 🖿 var
		# 	   └─ 🖿 log
		# 	      └─ 🖿 EtroTech spairaru.bash
		# 	🗑️
		# 	└─ 🖿 tmp
		# 	   └─ 🖿 EtroTech spairaru.bash

		# 1 			: file path
		# 2 			: +x , rwxr-xr-x , 755
		[[ "$RL_USR" != root ]] \
		&& s \
			fl \
				perm \
					"$S_APP_EXC_FL" \
					"+x" \
			\
			--vbo_ttl "Applicaiton" \
		;


		# 	📦
		# 	└─ 🖿 opt
		# 	   └─ 🖿 EtroTech spairaru.bash
		# 	      └─ 🖺 spairaru.sh
		# 	🛠️
		# 	├─ 🖿 etc
		# 	│  └─ 🖿 EtroTech spairaru.bash
		# 	│     ├─ 🖺 *.env
		# 	│     ├─ 🖺 s.cnf 👈
		# 	│     └─ 🖺 *.ini
		# 	├─ 🖿 $HOME
		# 	│  └─ 🖿 .s.bash
		# 	│     ├─ 🖺 *.env
		# 	│     ├─ 🖺 s.cnf
		# 	?     └─ 🖺 *.ini
		# 	└─ 🖿 $PWD
		# 	   └─ 🖿 .s.bash
		# 	      ├─ 🖺 *.env
		# 	      └─ 🖺 s.cnf
		# 	      └─ 🖺 *.ini
		# 	📄
		# 	└─ 🖿 var
		# 	   └─ 🖿 log
		# 	      └─ 🖿 EtroTech spairaru.bash
		# 	🗑️
		# 	└─ 🖿 tmp
		# 	   └─ 🖿 EtroTech spairaru.bash

		[[ ! -f "$S_D_CNF_FL" ]] \
		&& s \
			fl \
				mk \
					"$S_D_CNF_FL" \
			\
			--vbo_ttl "${ANSI_F_PR}`s_gtPrflTtl "dflt"`${_ANSI} ${ANSI_F_BL}`__ "Configuration"`${_ANSI}" \
		;


		# 	📦
		# 	└─ 🖿 opt
		# 	   └─ 🖿 EtroTech spairaru.bash
		# 	      └─ 🖺 spairaru.sh
		# 	🛠️
		# 	├─ 🖿 etc
		# 	│  └─ 🖿 EtroTech spairaru.bash 👈
		# 	│     ├─ 🖺 *.env
		# 	│     ├─ 🖺 s.cnf
		# 	│     └─ 🖺 *.ini
		# 	├─ 🖿 $HOME
		# 	│  └─ 🖿 .s.bash
		# 	│     ├─ 🖺 *.env
		# 	│     ├─ 🖺 s.cnf
		# 	?     └─ 🖺 *.ini
		# 	└─ 🖿 $PWD
		# 	   └─ 🖿 .s.bash
		# 	      ├─ 🖺 *.env
		# 	      └─ 🖺 s.cnf
		# 	      └─ 🖺 *.ini
		# 	📄
		# 	└─ 🖿 var
		# 	   └─ 🖿 log
		# 	      └─ 🖿 EtroTech spairaru.bash
		# 	🗑️
		# 	└─ 🖿 tmp
		# 	   └─ 🖿 EtroTech spairaru.bash

		[[ "$RL_USR" != root ]] \
		&& s \
			fldr \
				onr \
					"$S_D_CNF_FLDR" \
					"$RL_USR" \
			\
			--vbo_ttl "${ANSI_F_PR}`s_gtPrflTtl "dflt"`${_ANSI} ${ANSI_F_BL}`__ "Configuration"`${_ANSI}" \
		;


		# 	📦
		# 	└─ 🖿 opt
		# 	   └─ 🖿 EtroTech spairaru.bash
		# 	      └─ 🖺 spairaru.sh
		# 	🛠️
		# 	├─ 🖿 etc
		# 	│  └─ 🖿 EtroTech spairaru.bash
		# 	│     ├─ 🖺 *.env
		# 	│     ├─ 🖺 s.cnf
		# 	│     └─ 🖺 *.ini
		# 	├─ 🖿 $HOME
		# 	│  └─ 🖿 .s.bash
		# 	│     ├─ 🖺 *.env
		# 	│     ├─ 🖺 s.cnf 👈
		# 	?     └─ 🖺 *.ini
		# 	└─ 🖿 $PWD
		# 	   └─ 🖿 .s.bash
		# 	      ├─ 🖺 *.env
		# 	      └─ 🖺 s.cnf
		# 	      └─ 🖺 *.ini
		# 	📄
		# 	└─ 🖿 var
		# 	   └─ 🖿 log
		# 	      └─ 🖿 EtroTech spairaru.bash
		# 	🗑️
		# 	└─ 🖿 tmp
		# 	   └─ 🖿 EtroTech spairaru.bash

		# - local configuration folder path is set
		[[ ! -f "$S_G_CNF_FL" ]] \
		&& s \
			fl \
				mk \
					"$S_G_CNF_FL" \
				\
				--vbo_ttl "${ANSI_F_PR}`s_gtPrflTtl "glo"`${_ANSI} ${ANSI_F_BL}`__ "Configuration"`${_ANSI}" \
		;


		# 	📦
		# 	└─ 🖿 opt
		# 	   └─ 🖿 EtroTech spairaru.bash
		# 	      └─ 🖺 spairaru.sh
		# 	🛠️
		# 	├─ 🖿 etc
		# 	│  └─ 🖿 EtroTech spairaru.bash
		# 	│     ├─ 🖺 *.env
		# 	│     ├─ 🖺 s.cnf
		# 	│     └─ 🖺 *.ini
		# 	├─ 🖿 $HOME
		# 	│  └─ 🖿 .s.bash 👈
		# 	│     ├─ 🖺 *.env
		# 	│     ├─ 🖺 s.cnf
		# 	?     └─ 🖺 *.ini
		# 	└─ 🖿 $PWD
		# 	   └─ 🖿 .s.bash
		# 	      ├─ 🖺 *.env
		# 	      └─ 🖺 s.cnf
		# 	      └─ 🖺 *.ini
		# 	📄
		# 	└─ 🖿 var
		# 	   └─ 🖿 log
		# 	      └─ 🖿 EtroTech spairaru.bash
		# 	🗑️
		# 	└─ 🖿 tmp
		# 	   └─ 🖿 EtroTech spairaru.bash

		[[ "$RL_USR" != root ]] \
		&& s \
			fldr \
				onr \
					"$S_G_CNF_FLDR" \
					"$RL_USR" \
				\
				--vbo_ttl "${ANSI_F_PR}`s_gtPrflTtl "glo"`${_ANSI} ${ANSI_F_BL}`__ "Configuration"`${_ANSI}" \
		;


		# 	📦
		# 	└─ 🖿 opt
		# 	   └─ 🖿 EtroTech spairaru.bash
		# 	      └─ 🖺 spairaru.sh
		# 	🛠️
		# 	├─ 🖿 etc
		# 	│  └─ 🖿 EtroTech spairaru.bash
		# 	│     └─ 🖺 s.cnf
		# 	├─ 🖿 $HOME
		# 	│  └─ 🖿 .s.bash
		# 	?     └─ 🖺 s.cnf
		# 	└─ 🖿 $PWD
		# 	   └─ 🖿 .s.bash
		# 	      └─ 🖺 s.cnf
		# 	📄
		# 	└─ 🖿 var
		# 	   └─ 🖿 log
		# 	      └─ 🖿 EtroTech spairaru.bash 👈
		# 	🗑️
		# 	└─ 🖿 tmp
		# 	   └─ 🖿 EtroTech spairaru.bash

		! s \
			fldr \
				ex \
					"$S_LOG_FLDR" \
		&& s \
			fldr \
				mk \
					"$S_LOG_FLDR" \
			\
			--vbo_ttl "Log" \
		;


		[[ "$RL_USR" != root ]] \
		&& s \
			fldr \
				onr \
					"$S_LOG_FLDR" \
					"$RL_USR" \
			\
			--vbo_ttl "Log" \
		;


		# 	📦
		# 	└─ 🖿 opt
		# 	   └─ 🖿 EtroTech spairaru.bash
		# 	      └─ 🖺 spairaru.sh
		# 	🛠️
		# 	├─ 🖿 etc
		# 	│  └─ 🖿 EtroTech spairaru.bash
		# 	│     └─ 🖺 s.cnf
		# 	├─ 🖿 $HOME
		# 	│  └─ 🖿 .s.bash
		# 	?     └─ 🖺 s.cnf
		# 	└─ 🖿 $PWD
		# 	   └─ 🖿 .s.bash
		# 	      └─ 🖺 s.cnf
		# 	📄
		# 	└─ 🖿 var
		# 	   └─ 🖿 log
		# 	      └─ 🖿 EtroTech spairaru.bash
		# 	🗑️
		# 	└─ 🖿 tmp
		# 	   └─ 🖿 EtroTech spairaru.bash 👈


		! s \
			fldr \
				ex \
					"$S_TMP_FLDR" \
		&& s \
			fldr \
				mk \
					"$S_TMP_FLDR" \
			\
			--vbo_ttl "Temporary" \
		;


		[[ "$RL_USR" != root ]] \
		&& s \
			fldr \
				onr \
					"$S_TMP_FLDR" \
					"$RL_USR" \
			\
			--vbo_ttl "Temporary" \
		;


		return $tru ;


	} ;



# ======================================================================================
# __INSTALL ALIASES
# ======================================================================================
	SpairaruCtlr_Pkg____istlAkax() {


		# PRE PROCESSES --------

		# [ converted_remark ]
		local _cnvd_rmrk="` \
			s_cnvDocLnx2Ln \
				$( \
					s_coDocLnx \
						"$S_RMRK" \
						--rtn_typ str \
				) \
		`" ;


		# MAIN PROCESS : SHELL ) BASH --------

		# [ user_bash_global_profile_absolute_path ]
		local _usr_bash_glo_prfl_abs_pf="` \
			s \
				bash \
					prfl \
						pf \
						\
						--scp "glo" \
				\
				"$@" \
		`" ;


		# 1 			: utility group
		# 2 			: action
		# usr 			: user
		# -- environment option --
		# vbo 			: verbose
		s \
			bash \
				optmz \
			\
			"$@" \
		;


		# CLI ) spairaru

		# 1 			: utility group
		# 2 			: method
		# 3 			: action
		# 4 			: alias key
		# 5 			: alias value
		# -- document option --
		# aft 			: wrtite in after this
		# -- profile option --
		# pf 			: profile path
		# scp 			: profile scope
		# -- environment option --
		# vbo 			: verbose

		! s \
			bash \
				prfl \
					aka \
						"$S_L_CLI" \
						"` \
							s \
								fs \
									pf \
										"$S_APP_EXC_FL" \
										--fmt rgx \
						`" \
						--aft "$_cnvd_rmrk"'\^\|' \
					\
					--pf "$_usr_bash_glo_prfl_abs_pf" \
					--scp "glo" \
			\
			"$@" \
		&& return $fls \
		;


		# CLI ) s

		# 1 			: utility group
		# 2 			: method
		# 3 			: action
		# 4 			: alias key
		# 5 			: alias value
		# -- document option --
		# aft 			: wrtite in after this
		# -- profile option --
		# pf 			: profile path
		# scp 			: profile scope
		# -- environment option --
		# vbo 			: verbose
		s \
			bash \
				prfl \
					aka \
						"$S_S_CLI" \
						"` \
							s \
								fs \
									pf \
										"$S_APP_EXC_FL" \
										--fmt rgx \
						`" \
						--aft '.*alias '"$S_L_CLI"'=.*\^\|' \
					\
					--pf "$_usr_bash_glo_prfl_abs_pf" \
					--scp "glo" \
			\
			"$@" \


		# CLI ) __

		# 1 			: utility group
		# 2 			: method
		# 3 			: action
		# 4 			: alias key
		# 5 			: alias value
		# -- document option --
		# aft 			: wrtite in after this
		# -- profile option --
		# pf 			: profile path
		# scp 			: profile scope
		# -- environment option --
		# vbo 			: verbose
		s \
			bash \
				prfl \
					aka \
						"__" \
						"` \
							s \
								fs \
									pf \
										"$S_APP_FLDR" \
										--fmt rgx \
						`/"'__.sh' \
						--aft '.*alias '"$S_L_CLI"'=.*;\^\|' \
					\
					--pf "$_usr_bash_glo_prfl_abs_pf" \
					--scp "glo" \
			\
			"$@" \
		;


		# MAIN PROCESS : SHELL ) CURRENT --------

		# - shell is not bash
		if [[ "$CUR_SH_LNG" != "bash" ]] ;
		then


			# A ) SHELL SUPPORTED

			# - shell is supported
			if [[ $CUR_SH_LNG =~ ^(csh|fish|tcsh|zsh)$ ]] ;
			then


				# [ user_shell_global_profile_absolute_path ]
				local _usr_sh_glo_prfl_abs_pf="` \
					s \
						"$CUR_SH_LNG" \
							prfl \
								pf \
								\
								--scp "glo" \
						\
						"$@" \
				`" ;


				# 1 			: utility group
				# 2 			: action
				# 3 			: shell type
				# tgt 			: target langurage
				# usr 			: user
				# -- environment option --
				# vbo 			: verbose
				s \
					$CUR_SH_LNG \
						optmz \
							--tgt "bash" \
					\
					"$@" \
				;


				# CLI ) spairaru

				# 1 			: utility group
				# 2 			: method
				# 3 			: action
				# 4 			: alias key
				# 5 			: alias value
				# -- document option --
				# aft 			: wrtite in after this
				# -- profile option --
				# pf 			: profile path
				# -- environment option --
				# vbo 			: verbose
				s \
					$CUR_SH_LNG \
						prfl \
							aka \
								"spairaru" \
								'bash \+x '"` \
									s \
										fs \
											pf \
												"$S_APP_EXC_FL" \
												--fmt rgx \
								`" \
								--aft "$_cnvd_rmrk"'\^\|' \
							\
							--pf "$_usr_sh_glo_prfl_abs_pf" \
							--scp "glo" \
					\
					"$@" \
				;


				# CLI ) s

				# 1 			: utility group
				# 2 			: method
				# 3 			: action
				# 4 			: alias key
				# 5 			: alias value
				# -- document option --
				# aft 			: wrtite in after this
				# -- profile option --
				# pf 			: profile path
				# -- environment option --
				# vbo 			: verbose
				s \
					$CUR_SH_LNG \
						prfl \
							aka \
								"$S_S_CLI" \
								'bash \+x '"` \
									s \
										fs \
											pf \
												"$S_APP_EXC_FL" \
												--fmt rgx \
								`" \
								--aft '.*alias '"$S_L_CLI"'=.*;\^\|' \
							\
							--pf "$_usr_sh_glo_prfl_abs_pf" \
							--scp "glo" \
					\
					"$@" \
				;


				# CLI ) __

				# 1 			: utility group
				# 2 			: method
				# 3 			: action
				# 4 			: alias key
				# 5 			: alias value
				# -- document option --
				# aft 			: wrtite in after this
				# -- profile option --
				# pf 			: profile path
				# -- environment option --
				# vbo 			: verbose
				s \
					$CUR_SH_LNG \
						prfl \
							aka \
								"__" \
								'bash \+x '"` \
									s \
										fs \
											pf \
												"$S_APP_FLDR" \
												--fmt rgx \
								`"'/__.sh' \
								--aft '.*alias '"$S_L_CLI"'=.*;\^\|' \
							\
							--pf "$_usr_sh_glo_prfl_abs_pf" \
							--scp "glo" \
					\
					"$@" \
				;


			# B ) SHELL NOT SUPPORTED

			else 

				# 1 			: message
				# 2+ 			: fragments
				# wc 			: with condition
				s_ivkPptTpl_DfltAcpt \
					"%s does not support for current %s shell yet." \
					"`__ "${ANSI_F_GN}${S_TTL}${_ANSI}"`" \
					"`__ "${ANSI_F_OR}${CUR_SH_LNG}${_ANSI}"`" \
					--wc \
				;


			fi ;


		fi ;


		return $tru ;


	} ;



# ======================================================================================
# __UNINSTALL FILES
# ======================================================================================
	SpairaruCtlr_Pkg____unistlFlx() {


		# MAIN PROCESS : CREATE TEMPORARY FILES --------

		# 	📦
		# 	└─ 🖿 opt
		# 	   └─ 🖿 EtroTech spairaru.bash
		# 	      └─ 🖿 co
		# 	         └─ 🖿 pkg 👈
		# 	🗑️
		# 	└─ 🖿 tmp
		# 	   └─ 🖿 EtroTech spairaru.bash
		# 	      └─ 🖿 pkg 👈

		s \
			fldr \
				cp \
					"$S_APP_FLDR"/co/pkg \
					"$S_TMP_FLDR"/pkg \
			--nfc $tru \
			--vbo $fls \
		;


		# MAIN PROCESS : CONTINUE UNINSTALL --------

		. "$S_TMP_FLDR"/pkg/sUistl.sh \


		return $tru ;


	} ;



# ======================================================================================
# __UNINSTALL ALIASES
# ======================================================================================
	SpairaruCtlr_Pkg____unistlAkax() {


		# MAIN PROCESS : SHELL ) BASH --------

		# [ user_bash_global_profile_absolute_path ]
		local _usr_bash_glo_prfl_abs_pf="` \
			s \
				bash \
					prfl \
						pf \
							--scp "glo" \
				\
				"$@" \
		`" ;


		# 1 			: utility group
		# 2 			: action
		# usr 			: user
		# wd 			: withdrawal
		# -- environment option --
		# vbo 			: verbose
		s \
			bash \
				optmz \
					--wd \
			\
			"$@" \
		;


		# CLI ) spairaru

		# 1 			: utility group
		# 2 			: method
		# 3 			: action
		# 4 			: alias key
		# 5 			: alias value
		# dl 			: perform delete action
		# -- profile option --
		# glo 			: global profile
		# -- environment option --
		# vbo 			: verbose
		s \
			bash \
				prfl \
					aka \
						"$S_L_CLI" \
						--dl \
				\
				--pf "$_usr_bash_glo_prfl_abs_pf" \
				--scp "glo" \
			\
			"$@" \
		;


		# CLI ) s

		# 1 			: utility group
		# 2 			: method
		# 3 			: action
		# 4 			: alias key
		# 5 			: alias value
		# dl 			: perform delete action
		# -- profile option --
		# glo 			: global profile
		# -- environment option --
		# vbo 			: verbose
		s \
			bash \
				prfl \
					aka \
						"$S_S_CLI" \
						--dl \
				\
				--pf "$_usr_bash_glo_prfl_abs_pf" \
				--scp "glo" \
			\
			"$@" \
		;


		# CLI ) __

		# 1 			: utility group
		# 2 			: method
		# 3 			: action
		# 4 			: alias key
		# 5 			: alias value
		# dl 			: perform delete action
		# -- profile option --
		# glo 			: global profile
		# -- environment option --
		# vbo 			: verbose
		s \
			bash \
				prfl \
					aka \
						"__" \
						--dl \
				\
				--pf "$_usr_bash_glo_prfl_abs_pf" \
				--scp "glo" \
			\
			"$@" \
		;


		# MAIN PROCESS : SHELL ) CURRENT --------

		# - shell is not bash
		# - shell is supported
		if [[ \
			"$CUR_SH_LNG" != "bash" \
			&& $CUR_SH_LNG =~ ^(csh|fish|tcsh|zsh)$ \
		]] ;
		then


			# [ user_shell_global_profile_absolute_path ]
			local _usr_sh_glo_prfl_abs_pf="` \
				s \
					"$CUR_SH_LNG" \
						prfl \
							pf \
							--scp "glo" \
					\
					"$@" \
			`" ;


			# 1 			: utility group
			# 2 			: action
			# 3 			: shell type
			# tgt 			: target langurage
			# usr 			: user
			# wd 			: withdrawal
			# -- environment option --
			# vbo 			: verbose
			s \
				$CUR_SH_LNG \
					optmz \
						--tgt "bash" \
						--wd \
				\
				"$@" \
			;


			# CLI ) spairaru

			# 1 			: utility group
			# 2 			: method
			# 3 			: action
			# 4 			: alias key
			# 5 			: alias value
			# dl 			: perform delete action
			# -- profile option --
			# glo 			: global profile
			# -- environment option --
			# vbo 			: verbose
			s \
				$CUR_SH_LNG \
					prfl \
						aka \
							"spairaru" \
							--dl \
					\
					--pf "$_usr_sh_glo_prfl_abs_pf" \
					--scp "glo" \
				\
				"$@" \
			;


			# CLI ) s

			# 1 			: utility group
			# 2 			: method
			# 3 			: action
			# 4 			: alias key
			# 5 			: alias value
			# dl 			: perform delete action
			# -- profile option --
			# glo 			: global profile
			# -- environment option --
			# vbo 			: verbose
			s \
				$CUR_SH_LNG \
					prfl \
						aka \
							"$S_S_CLI" \
							--dl \
					\
					--pf "$_usr_sh_glo_prfl_abs_pf" \
					--scp "glo" \
				\
				"$@" \
			;


			# CLI ) : __

			# 1 			: utility group
			# 2 			: method
			# 3 			: action
			# 4 			: alias key
			# 5 			: alias value
			# dl 			: perform delete action
			# -- profile option --
			# glo 			: global profile
			# -- environment option --
			# vbo 			: verbose
			s \
				$CUR_SH_LNG \
					prfl \
						aka \
							"__" \
							--dl \
						\
						--pf "$_usr_sh_glo_prfl_abs_pf" \
						--scp "glo" \
				\
				"$@" \
			;


		fi ;


		return $tru ;


	} ;



# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# STATEFUL STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# IS INSTALLED
# ======================================================================================
	SpairaruCtlr_Pkg__isIstld() {


		# a 					: 
		# alias __cli__=\' 		: match anything after thsi
		# \K 					: capture from here
		# .* 					: capture anything
		# (?=\') 				: capture until next '

		# [ command_path ]
		local _cmd_pf="` \
			alias \
			| grep \
				-Po \
				"alias ${S_S_CLI}=\'\K.*(?=\')" \
		`" ;


		[[ -z "$_cmd_pf" ]] \
		&& return $fls \
		;


		# 1 		: utility group
		# 2 		: action
		# 3 		: path
		fl \
			ex \
				"$_cmd_pf" \
		;


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


	# ARGUMENT : POSITIONED --------

	# [ positoined_arguments ]
	local -a _pax=` \
		s_gtCblPax \
	` ;


	# [ method ]
	local mtd__="${_pax[0]}" ;


	# MAIN PROCESS : METHOD --------

	# - method is set
	if [[ "$mtd__" ]] ;
	then


		# [ method ]
		local _mtd ;


		case "$mtd__" in


			istl | install ) _mtd=SpairaruCtlr_Pkg__istl ;;

			uistl | uninstall ) _mtd=SpairaruCtlr_Pkg__uistl ;;

			upg | upgrade ) _mtd=SpairaruCtlr_Pkg__upg ;;


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


	fi ;


	# POST PROCESS : REPORT STATUS --------

	return $fls ;


 } ;
