#!/usr/bin/env bash
# ######################################################################################
# SHELL CONTROLLER UTILITY GROUP
# ######################################################################################
ShCtlr() {


# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ALTERNATIVE STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# OPTIMIZE
# 
# Description:
# 	Configure current shell environment to target shell.
#
# ======================================================================================
	ShCtlr__optmz() {


		# [ arguments ]
		local -a _ax=("$@") ;

		# [ result ]
		local _rslt=$tru ;


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


		# NAMED ARGUMENT --------

		# [ named_arguments ]
		local -A _nax=` \
			s_gtCblNax \
				--wd "withdraw" \
				\
				--tgt_lng "t" "tgt" "target" \
				--tgt_lng-nov 1 \
				\
				--usr "user" \
				--usr-nov 1 \
				--usr-dflt "$RL_USR" \
		` ;


		# [ withdraw ]
		local wd="${_nax[wd]}" ;

		# [ target_langurage ]
		local tgt_lng="${_nax[tgt_lng]}" ;

		# [ user ]
		local usr="${_nax[usr]}" ;


		# PRE PROCESS : ACTION --------

		# [ action ]
		local _atn ;


		[[ $wd == $tru ]] \
		&& _atn="rm" \
		|| _atn="ad" \
		;


		# POST PROCESS : OPTIMIZATION --------

		[[ "$tgt_lng" ]] \
		&& "s_optmz${__sh_lng__^}4${tgt_lng^}" \
			--atn "$_atn" \
			\
			"$@" \
		|| "s_optmz${__sh_lng__^}" \
			--atn "$_atn" \
			\
			"$@" \
		;

		_rslt=$? ;


		# POST PROCESS : OUT MESSAGE --------

		[[ $env_vbo == $tru ]] \
		&& s_ivkPptTpl_ShOptmz \
			--atn "$_atn" \
			--stt $_rslt \
			\
			--cur_lng "$__sh_lng__" \
			--tgt_lng "$tgt_lng" \
			\
			--usr "$usr" \
		;


		# POST PROCESS : REPORT STATUS --------

		return $_rslt ;


	} ;



# ======================================================================================
# VERSION
# 
# Description:
# 	Compare given version with current shell version.
#
# ======================================================================================
	ShCtlr__ver() {


		# [ arguments ]
		local -a _ax=("$@") ;

		# [ result ]
		local _rslt=$tru ;


		# POSITIONED ARGUMENT --------

		# [ positoined_arguments ]
		local -a _pax=` \
			s_gtCblPax \
		` ;


		# [ target_version ]
		local tgt_ver__="${_pax[0]}" ;


		# MAIN PROCESS : GET VERSION --------

		# [ current_version ]
		local _cur_ver="` "s_gt${__sh_lng__^}Ver" `" ;


		# MAIN PROCESS : COMPARE VERSION --------

		# - target_version is set
		if [[ -n "$tgt_ver__" ]] ;
		then

			s_compVer \
				"$_cur_ver" \
				"$tgt_ver__" \
			;

			_rslt=$? ;


		# MAIN PROCESS : CURRENT VERSION --------

		else

			echo "$_cur_ver" ;


		fi ;


		# POST PROCESS : REPORT STATUS --------

		return $_rslt ;


	} ;



# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# CONFIGURATIVE STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# PRPFILE
# ======================================================================================
	ShCtlr__prfl() {


		# MAIN PROCESSES --------

		ShPrflCtlr \
			"$@" \
		;


		# POST PROCESS : REPORT STATUS --------

		return $? ; 


	} ;



# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# CORE STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# ALIAS
# 
# Description:
# 	Add or Remove environment key in cofiguration file.
#
# ======================================================================================
	ShCtlr__aka() {


		# [ arguments ]
		local -a _ax=("$@") ;

		# [ result ]
		local _rslt=$tru ;


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
			s_gtCblPax \
		` ;


		# [ key ]
		local ky__="${_pax[0]}" ;

		# [ command ]
		local cmd__="${_pax[1]}" ;


		# NAMED ARGUMENT --------

		# [ named_arguments ]
		local -a _nax=` \
			s_rmArrVlux \
				"${_ax[@]}" \
				-- \
				"${_pax[@]}" \
		` ;


		# PRE PROCESS : ACTION --------

		# [ action ]
		local _atn ;


		if [[ -z "$_atn" ]] ;
		then

			if [[ ${#_pax[@]} -ge 2 ]] ;
			then

				[[ "$cmd__" ]] \
				&& _atn="ad" \
				|| _atn="dl" \
				;


			else

				_atn="qry" ;


			fi ;

		fi ;


		# PRECHECK : KEY --------

		if [[ -z "$ky__" ]] ;
		then 


			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_CblMpa \
				"Key" \
				--pos "1st" \
			;


			return $fls ;


		fi ;


		# PRECHECK : COMMAND --------

		# - its add action
		# - value is not set
		if [[ \
			$_atn == "ad" \
			&& ! "$cmd__" \
		]] ;
		then 


			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_CblMpa \
				"Command" \
				--pos "2nd" \
			;


			return $fls ;


		fi ;


		# MAIN PROCESS : ADD --------

		if [[ "$_atn" == "ad" ]] ;
		then

			# - environment key is already set
			if [[ \
				"` \
					"$__sh_lng__" \
						-ic "alias" \
					| grep \
						-Poz \
						"alias ${ky__}=.*" \
					| tr \
						-d \
						'\0' \
				`" \
				&& $env_nfc != $tru
			]] ;
			then

				_rslt=2 ;


			# - otherwise
			else

				ShPrflCtlr \
					aka \
						"$ky__" \
						"$cmd__" \
					"${_nax[@]}" \
				;

				_rslt=$? ;


			fi ;


		# MAIN PROCESS : DELETE --------

		elif [[ "$_atn" == "dl" ]] ;
		then

			# - environment key is already unset
			if [[ \
				! "` \
					"$__sh_lng__" \
						-ic "alias" \
					| grep \
						-Poz \
						"alias ${ky__}=.*" \
					| tr \
						-d \
						'\0' \
				`" \
				&& $env_nfc != $tru
			]] ;
			then

				_rslt=2 ;


			# - otherwise
			else 

				ShPrflCtlr \
					aka \
						"$ky__" \
						--dl \
					"${_nax[@]}" \
				;

				_rslt=$? ;


			fi ;


		# MAIN PROCESS : QUERY --------

		elif [[ "$_atn" == "qry" ]] ;
		then


			# [ alias_command ]
			local _aka_cmd="` \
				"$__sh_lng__" \
					-ic "alias" \
				| grep \
					-Poz \
					"alias ${ky__}=(\\\"|')\K.*(?=\\\"|')" \
				| tr \
					-d \
					'\0' \
			`" ;


			# - feature is already enabled
			if [[ "$_aka_cmd" ]] ;
			then

				echo "$_aka_cmd" ;

				_rslt=$tru ;


			# - otherwise
			else 

				_rslt=$fls ;


			fi ;


		fi ;


		# POST PROCESS : DISPLAY MESSAGE --------

		# - action is not query
		# - verbose is enabled
		# - result is 2
		[[ \
			$_atn != "qry" \
			&& $env_vbo == $tru \
			&& $_rslt == 2 \
		]] \
		&& s_ivkPptTpl_GnlIdvAtnx \
			--atn "$_atn" \
			--stt $_rslt \
			\
			--cat "alias key" \
			--ttl "${ANSI_F_OR}${__sh_lng__}${_ANSI} ${ANSI_F_GN}${ky__}${_ANSI}" \
		;


		# POST PROCESS : REPORT STATUS --------

		[[ $_rslt =~ ^(2)$ ]] \
		&& return $tru \
		|| return $_rslt \
		;


	} ;



# ======================================================================================
# ALIASES
# ======================================================================================
	ShCtlr__akax() {


		# [ arguments ]
		local -a _ax=("$@") ;

		# [ result ]
		local _rslt=$tru ;


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
			s_gtCblPax \
		` ;


		# [ action ]
		local atn__="${_pax[0]}" ;


		# NAMED ARGUMENT --------

		# [ named_arguments ]
		local -A _nax=` \
			s_gtCblNax \
				--opf "only_path" \
		` ;


		# [ only_path ]
		local opf="${_nax[opf]}" ;


		# PRE PROCESS : ACTION --------

		# [ action ]
		local _atn ;


		# - no givin action
		if [[ "${#_pax}" == 0 ]] ;
		then

			_atn="lst" ;


		# - action is givin
		else


			case "$atn__" in


				lst | list ) _atn=lst ;;


			esac ;


			if [[ ! "$_atn" ]] ;
			then


				[[ $env_vbo == $tru ]] \
				&& s_ivkPptTpl_DfltRej \
					"unknown action." \
				;


				return $fls ;


			fi ;

		fi ;


		# MAIN PROCESS : LIST --------

		if [[ "$_atn" ]] ;
		then


			# PATH ONLY

			if [[ "$opf" == $tru ]] ;
			then

				"$__sh_lng__" \
					-ic "alias" \
				| sed \
					-r \
					-e "s/(alias.*=)(\\\"|')(.*)(\\\"|')/\3/g" \
				;


			# OTHERWISE

			else

				"$__sh_lng__" \
					-ic "alias" \
				;


			fi ;


		fi ;


		# POST PROCESS : REPORT STATUS --------

		[[ "$_ftr" ]] \
		&& return $tru \
		|| return $fls \
		;


	} ;



# ======================================================================================
# COMMAND LINE INTERFACE
# 
# Description:
# 	Add or Remove command line in cofiguration file.
#
# ======================================================================================
	ShCtlr__cli() {


		# [ arguments ]
		local -a _ax=("$@") ;

		# [ result ]
		local _rslt=$tru ;


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
			s_gtCblPax \
		` ;


		# [ commnad ]
		local cmd__="${_pax[0]}" ;


		# PRECHECK : COMMNAD --------

		if [[ -z $cmd__ ]] ;
		then


			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_CblMpa \
				"Command" \
				"1st" \
			;


			return $fls ;


		fi ;


		# MAIN PROCESS : DETERMINE --------

		# [ commnad_path ]
		local _cmd_pf="` \
			"$__sh_lng__" \
				-ic \
				"\
					type \
						-P \
						\\\"$cmd__\\\" \
				" \
		`" ;


		[[ -z "$_cmd_pf" ]] \
		&&  _cmd_pf="` \
			"$__sh_lng__" \
				-ic \
				"\
					type \
						-f \
						\\\"$cmd__\\\" \
				" \
			| grep \
				-Poz \
				".*\\\`\K.*(?=\')" \
			| tr \
				-d \
				'\0' \
		`" ;


		# POST PROCESS : OUT MESSAGE --------

		echo "${_cmd_pf// /\\\\\ }" ;


		# POST PROCESS : REPORT STATUS --------

		[[ "$_cmd_pf" ]] \
		&& return $tru \
		|| return $fls \
		;


	} ;



# ======================================================================================
# ENVIRONMENT
# 
# Description:
# 	Add or Remove environment key in cofiguration file.
#
# ======================================================================================
	ShCtlr__env() {


		# [ arguments ]
		local -a _ax=("$@") ;

		# [ result ]
		local _rslt=$tru ;


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
			s_gtCblPax \
		` ;


		# [ key ]
		local ky__="${_pax[0]}" ;

		# [ value ]
		local vlu__="${_pax[1]}" ;


		# NAMED ARGUMENT --------

		# [ named_arguments ]
		local -a _nax=` \
			s_rmArrVlux \
				"${_ax[@]}" \
				-- \
				"${_pax[@]}" \
		` ;


		# PRE PROCESS : ACTION --------

		# [ action ]
		local _atn ;


		if [[ -z "$_atn" ]] ;
		then

			if [[ ${#_pax[@]} -ge 2 ]] ;
			then

				[[ "$vlu__" ]] \
				&& _atn="ad" \
				|| _atn="dl" \
				;


			else

				_atn="qry" ;


			fi ;

		fi ;


		# PRECHECK : KEY --------

		if [[ -z "$ky__" ]] ;
		then 


			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_CblMpa \
				"Key" \
				--pos "1st" \
			;


			return $fls ;


		fi ;


		# PRECHECK : VALUE --------

		# - its add action
		# - value is not set
		if [[ \
			$_atn == "ad" \
			&& ! "$vlu__" \
		]] ;
		then 


			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_CblMpa \
				"Value" \
				--pos "2nd" \
			;


			return $fls ;


		fi ;


		# MAIN PROCESS : ADD --------

		if [[ "$_atn" == "ad" ]] ;
		then

			# - environment key is already set
			if [[ \
				"${!ky__}" \
				&& $env_nfc != $tru
			]] ;
			then

				_rslt=2 ;


			# - otherwise
			else

				ShPrflCtlr \
					env \
						"$ky__" \
						"$vlu__" \
					"${_nax[@]}" \
				;

				_rslt=$? ;


			fi ;


		# MAIN PROCESS : DELETE --------

		elif [[ "$_atn" == "dl" ]] ;
		then

			# - environment key is already unset
			if [[ \
				! "${!ky__}" \
				&& $env_nfc != $tru
			]] ;
			then

				_rslt=2 ;


			# - otherwise
			else 

				ShPrflCtlr \
					env \
						"$ky__" \
						--dl \
					"${_nax[@]}" \
				;

				_rslt=$? ;


			fi ;


		# MAIN PROCESS : QUERY --------

		elif [[ "$_atn" == "qry" ]] ;
		then

			# - feature is already enabled
			if [[ "${!ky__}" ]] ;
			then

				echo "${!ky__}" ;

				_rslt=$tru ;


			# - otherwise
			else 

				_rslt=$fls ;


			fi ;

		fi ;


		# POST PROCESS : DISPLAY MESSAGE --------

		# - action is not query
		# - verbose is enabled
		# - result is 2
		[[ \
			$_atn != "qry" \
			&& $env_vbo == $tru \
			&& $_rslt == 2 \
		]] \
		&& s_ivkPptTpl_GnlIdvAtnx \
			--atn "$_atn" \
			--stt $_rslt \
			\
			--cat "environment key" \
			--ttl "${ANSI_F_OR}${__sh_lng__}${_ANSI} ${ANSI_F_BL}${ky__}${_ANSI}" \
		;


		# POST PROCESS : REPORT STATUS --------

		[[ $_rslt =~ ^(2)$ ]] \
		&& return $tru \
		|| return $_rslt \
		;


	} ;



# ======================================================================================
# FEATURE
# 
# Description:
# 	Add or Remove command line in cofiguration file.
#
# ======================================================================================
	ShCtlr__ftr() {


		# [ arguments ]
		local -a _ax=("$@") ;

		# [ result ]
		local _rslt=$tru ;


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
			s_gtCblPax \
		` ;


		# [ key ]
		local ky__="${_pax[0]}" ;

		# [ action ]
		local atn__="${_pax[1]}" ;


		# NAMED ARGUMENT --------

		# [ named_arguments ]
		local -a _nax=` \
			s_rmArrVlux \
				"${_ax[@]}" \
				-- \
				"${_pax[@]}" \
		` ;


		# PRE PROCESS : ACTION --------

		# [ action ]
		local _atn ;


		if [[ -z "$_atn" ]] ;
		then

			if [[ ${#_pax[@]} -ge 2 ]] ;
			then

				[[ \
					-z "$atn__" \
					|| "$atn__" =~ ^(dsbl|disable|off)$ \
				]] \
				&& _atn="dsbl" \
				|| _atn="nbl" \
				;


			else

				_atn="qry" ;


			fi ;

		fi ;


		# PRECHECK : KEY --------

		if [[ -z "$ky__" ]] ;
		then 


			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_CblMpa \
				"Key" \
				--pos "1st" \
			;


			return $fls ;


		fi ;


		if [[ ! "` \
			shopt \
				-p \
			| grep \
				-Poz \
				'shopt.*'"$ky__" \
			| tr \
				-d \
				'\0' \
		`" ]] ;
		then


			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_DfltRej \
				"feature %s is not supported." \
				"${ANSI_F_BL}${atn__}${_ANSI}" \
			;


			return $fls ;


		fi ;


		# PRECHECK : ACTION --------

		if [[ \
			"$atn__" \
			&& ! "$atn__" =~ ^(nbl|enable|dsbl|disable|on|off)$ \
		]] ;
		then 


			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_DfltRej \
				"%s %s is not supported." \
				"action" \
				"${ANSI_F_BL}${atn__}${_ANSI}" \
			;


			return $fls ;


		fi ;


		# MAIN PROCESS : ACTIONS --------

		# ACTION ) ENABL

		if [[ "$_atn" == "nbl" ]] ;
		then

			# - feature is already enabled
			if [[ \
				"` \
					shopt \
						-sp \
					| grep \
						-Poz \
						"$ky__" \
					| tr \
						-d \
						'\0' \
				`" \
				&& $env_nfc != $tru
			]] ;
			then

				_rslt=2 ;


			# - otherwise
			else

				ShPrflCtlr \
					ftr \
						"$ky__" \
						"on" \
					"${_nax[@]}" \
				;

				_rslt=$? ;


			fi ;


		# ACTION ) DISABLE

		elif [[ "$_atn" == "dsbl" ]] ;
		then

			# - feature is already disabled
			if [[ \
				"` \
					shopt \
						-up \
					| grep \
						-Poz \
						"$ky__" \
					| tr \
						-d \
						'\0' \
				`" \
				&& $env_nfc != $tru
			]] ;
			then

				_rslt=2 ;


			# - otherwise
			else 

				ShPrflCtlr \
					ftr \
						"$ky__" \
						"off" \
					"${_nax[@]}" \
				;

				_rslt=$? ;


			fi ;


		# ACTION ) QUERY

		elif [[ "$_atn" == "qry" ]] ;
		then

				shopt \
					-sp \
				| grep \
					-Poz \
					"$ky__" \
				| tr \
					-d \
					'\0' \


			# - feature is already enabled
			if [[ "` \
				shopt \
					-sp \
				| grep \
					-Poz \
					"$ky__" \
				| tr \
					-d \
					'\0' \
			`" ]] ;
			then

				_rslt=$tru ;


			# - otherwise
			else 

				_rslt=$fls ;


			fi ;


		# ACTION ) FALLBACK

		else 

			_rslt=$fls ;


		fi ;


		# POST PROCESS : DISPLAY MESSAGE --------

		# - action is not query
		# - verbose is enabled
		# - result is 2
		[[ \
			$_atn != "qry" \
			&& $env_vbo == $tru \
			&& $_rslt == 2 \
		]] \
		&& s_ivkPptTpl_GnlIdvAtnx \
			--atn "$_atn" \
			--stt $_rslt \
			\
			--cat "feature" \
			--ttl "${ANSI_F_OR}${__sh_lng__}${_ANSI} ${ANSI_F_BL}${ky__}${_ANSI}" \
		;


		# POST PROCESS : REPORT STATUS --------

		[[ $_rslt =~ ^(2)$ ]] \
		&& return $tru \
		|| return $_rslt \
		;


	} ;



# ======================================================================================
# FEATURES
# ======================================================================================
	ShCtlr__ftrx() {


		# [ arguments ]
		local -a _ax=("$@") ;

		# [ result ]
		local _rslt=$tru ;


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
			s_gtCblPax \
		` ;


		# [ action ]
		local atn__="${_pax[0]}" ;


		# NAMED ARGUMENT --------

		# [ named_arguments ]
		local -A _nax=` \
			s_gtCblNax \
				--icl "include" \
				--icl-dflt "all" \
				--icl-nov 1 \
				--icl-opt-all "@" \
				--icl-opt-nbld_ol "s" "nbld" "enabled" \
				--icl-opt-dsbld_ol "u" "dsbld" "disabled" \
		` ;


		# [ include ]
		local icl="${_nax[icl]}" ;


		# PRE PROCESS : ACTION --------

		# [ action ]
		local _atn ;


		# - no givin action
		if [[ "${#_pax}" == 0 ]] ;
		then

			_atn="lst" ;


		# - action is givin
		else


			case "$atn__" in


				lst | list ) _atn=lst ;;


			esac ;


			if [[ ! "$_atn" ]] ;
			then


				[[ $env_vbo == $tru ]] \
				&& s_ivkPptTpl_DfltRej \
					"unknown action." \
				;


				return $fls ;


			fi ;

		fi ;


		# MAIN PROCESS : LIST --------

		if [[ "$_atn" ]] ;
		then


			# ICNLUDE ) ALL 

			if [[ "$icl" == "all" ]] ;
			then

				bash \
					-c "shopt -p" \
				| sed \
					-r \
					-e 's/^shopt .* //g' \
				;


			# ICNLUDE ) ENABLED 

			elif [[ "$icl" == "nbld_ol" ]] ;
			then

				bash \
					-c "shopt -sp" \
				| sed \
					-r \
					-e 's/^shopt .* //g' \
				;


			# ICNLUDE ) DISABLED 

			elif [[ "$icl" == "dsbld_ol" ]] ;
			then

				bash \
					-c "shopt -up" \
				| sed \
					-r \
					-e 's/^shopt .* //g' \
				;


			fi ;


		fi ;


		# POST PROCESS : REPORT STATUS --------

		[[ "$_ftr" ]] \
		&& return $tru \
		|| return $fls \
		;


	} ;



# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# STATEFUL STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# IS INSTALLED
# ======================================================================================
	isIstld() {


		type \
			-t \
			"$__sh_lng__" \
			&>/dev/null \
		&& return $tru \
		|| return $fls \
		;


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


			# ALTERNATIVE

			optmz | optimize ) _mtd=ShCtlr__optmz ;;

			ver | version ) _mtd=ShCtlr__ver ;;


			# CONFIGURATIVE

			prfl | profile ) _mtd=ShCtlr__prfl ;;


			# CORE

			aka | alias ) _mtd=ShCtlr__aka ;;

			akax | aliass ) _mtd=ShCtlr__akax ;;

			cli ) _mtd=ShCtlr__cli ;;

			env | environment ) _mtd=ShCtlr__env ;;

			ftr | feature ) _mtd=ShCtlr__ftr ;;

			ftrx | features ) _mtd=ShCtlr__ftrx ;;


			# STATEFUL

			isIstld | isInstalled ) _mtd=ShCtlr__isIstld ;;


		esac ;


		# - method is set
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
