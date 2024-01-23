#!/usr/bin/env bash
# ######################################################################################
# FISH UTILITY
# ######################################################################################
# ======================================================================================
# GET BASH PROFILE PATH
# 
# Description:
# 	Determine configuration file location.
#
# ======================================================================================1
s_gtBashPrflPf() {


	# [ arguments ]
	local -a _ax=("$@") ;


	# NAMED ARGUMENT --------

	# [ named_arguments ]
	local -A _nax=` \
		s_gtCblNax \
			--pf "path" "fl" "file" \
			--pf-nov 1 \
			\
			--scp "scope" \
			--scp-nov 1 \
			--scp-dflt "lo" \
			--scp-opt-dflt "dflt" "defalt" \
			--scp-opt-lo "lo" "local" \
			--scp-opt-glo "glo" "global" \
			\
			--usr "user" \
			--usr-nov 1 \
			--usr-dflt "$RL_USR" \
	` ;


	# [ path ]
	local pf="${_nax[pf]}" ;

	# [ scope ]
	local scp="${_nax[scp]}" ;

	# [ user ]
	local usr="${_nax[usr]}" ;


	# MAIN PROCESS : DETERMINE HOME --------

	# [ home_absolute_path ]
	local _hm_abs_pf ;


	[[ "$usr" == "$RL_USR" ]] \
	&& _hm_abs_pf="$RL_HM" \
	|| _hm_abs_pf="` \
		s_gtUsrHmPf \
			"$usr" \
	`" \
	;


	# MAIN PROCESS : DETERMINE PROFILE --------

	# [ profile_absolute_path ]
	local _prfl_abs_pf ;


	# A ) CUSTOM

	# - profile_path is set
	if [[ -n "$pf" ]] ;
	then

		_prfl_abs_pf="$pf" ;


	# B ) DEFAULT
	# 	🛠️
	# 	├─ 🖿 etc
	# 	│  └─ 🖿 EtroTech spairaru.bash
	# 	│     └─ 🖺 bash
	# 	└─ $HOME
	# 	   ├─ 🖺 .bash_aliases
	# 	   ├─ 🖺 .bashrc 👈 1
	# 	   ├─ 🖺 .bash_profile 👈 2
	# 	   └─ 🖿 .s.bash
	# 	      └─ 🖺 bash

	# - scope is default
	elif [[ "$scp" == "dflt" ]] ;
	then


		# $HOME/.bashrc
		[[ -f "${_hm_abs_pf}/.bashrc" ]] \
		&& _prfl_abs_pf="${_hm_abs_pf}/.bashrc" \
		;


		# $HOME/.bash_profile
		[[ \
			-z "$_prfl_abs_pf" \
			&& -f "${_hm_abs_pf}/.bash_profile" \
		]] \
		&& _prfl_abs_pf="${_hm_abs_pf}/.bash_profile" \
		;


	# C ) GLOBAL
	# 	🛠️
	# 	├─ 🖿 etc
	# 	│  └─ 🖿 /EtroTech spairaru.bash 
	# 	│     └─ 🖺 bash 👈 2
	# 	└─ $HOME
	# 	   ├─ 🖺 .bash_aliases 👈 1
	# 	   ├─ 🖺 .bashrc
	# 	   ├─ 🖺 .bash_profile
	# 	   └─ 🖿 .s.bash
	# 	      └─ 🖺 bash

	# - scope is global
	elif [[ "$scp" == "glo" ]] ;
	then


		[[ -n "$BASH_ENV" ]] \
		&& _prfl_abs_pf="$BASH_ENV" \
		;


		# $HOME/.bash_aliases
		[[ \
			-z "$_prfl_abs_pf" \
			&& -f "${_hm_abs_pf}/.bash_aliases" \
		]] \
		&& _prfl_abs_pf="${_hm_abs_pf}/.bash_aliases" \
		;


		# etc/spairaru.bash/bash
		[[ -z "$_prfl_abs_pf" ]] \
		&& _prfl_abs_pf="${S_D_CNF_FLDR}/bash" \
		;


	# D ) LOCAL
	# 	🛠️
	# 	├─ 🖿 etc
	# 	│  └─ 🖿 /EtroTech spairaru.bash 
	# 	│     └─ 🖺 bash
	# 	└─ $HOME
	# 	   ├─ 🖺 .bash_aliases 👈 1
	# 	   ├─ 🖺 .bashrc
	# 	   ├─ 🖺 .bash_profile
	# 	   └─ 🖿 .s.bash
	# 	      └─ 🖺 bash 👈 2

	# - otherwise
	else


		[[ -n "$BASH_ENV" ]] \
		&& _prfl_abs_pf="$BASH_ENV" \
		;


		# $HOME/.bash_aliases
		[[ \
			-z "$_prfl_abs_pf" \
			&& -f "${_hm_abs_pf}/.bash_aliases" \
		]] \
		&& _prfl_abs_pf="${_hm_abs_pf}/.bash_aliases" \
		;


		# $HOME/.spairaru.bash/bash
		[[ -z "$_prfl_abs_pf" ]] \
		&& _prfl_abs_pf="${S_G_CNF_FLDR}/bash" \
		;


	fi ;


	# POST PROCESS : OUTPUT RESULT --------

	echo "$_prfl_abs_pf" ;


	# POST PROCESS : REPORT STATUS --------

	return $tru ;


} ;



# ======================================================================================
# GET BASH PROFILE PATH
# ======================================================================================1
s_gtBashVer() {


	# At 2023, bash version format is like below:
	# 	"GNU bash, version x.x.xx(x)-xxx (xxx)".
	# 	                   ↑↑↑↑↑↑↑↑↑

	# P 			: use regex
	# o 			: display matched only

	# version\s 			: contains version and space
	# \K 					: capture from here
	# .+? 					: match anything with or without next condition
	# (?=-|\s|\$) 			: capture untill next hyphen or space or till very end

	# [ current_version ]
	bash \
		--version \
	| grep \
		-Po \
		"version\s\K.+?(?=\-|\s|\$)" \
	| head \
		-1 \
	;


} ;



# ======================================================================================
# OPTIMIZE BASH
# ======================================================================================1
s_optmzBash() {


	# [ arguments ]
	local -a _ax=("$@") ;


	# POSITIONED ARGUMENT --------

	# [ positoined_arguments ]
	local -a _pax=` \
		s_gtCblPax \
	` ;


	# NAMED ARGUMENT --------

	# [ named_arguments ]
	local -A _nax=` \
		s_gtCblNax \
			--atn \
			--atn-nov 1 \
			\
			--usr "user" \
			--usr-nov 1 \
			--usr-dflt "$RL_USR" \
	` ;


	# [ action ]
	local atn="${_nax[atn]}" ;

	# [ user ]
	local usr="${_nax[usr]}" ;


	# PRE PROCESS : DETERMINE PROFILE --------

	# [ user_bash_default_profile_absolute_path ]
	local _usr_bash_dflt_prfl_abs_pf="` \
		s_gtBashPrflPf \
			--scp "dflt" \
			--usr "$usr" \
	`" ;

	# [ user_bash_global_profile_absolute_path ]
	local _usr_bash_glo_prfl_abs_pf="` \
		s_gtBashPrflPf \
			--scp "glo" \
			--usr "$usr" \
	`" ;

	# [ user_bash_local_profile_absolute_path ]
	local _usr_bash_lcl_prfl_abs_pf="` \
		s_gtBashPrflPf \
			--scp "lo" \
			--usr "$usr" \
	`" ;


	# [ converted_remark ]
	local _cnvd_rmrk="` \
		s_cnvDocLnx2Ln \
			$( \
				s_coDocLnx \
					"$S_RMRK" \
					--rtn_typ str \
			) \
	`" ;


	# MAIN PROCESS : ACTION ) ADD --------

	if [[ "$atn" =~ ^(ad|add)$ ]] ;
	then


		# DEFAULT PROFILE

		BashCtlr \
			prfl \
				rmrk \
					"$S_RMRK" \
				\
				--pf "$_usr_bash_dflt_prfl_abs_pf" \
				--scp "dflt" \
		;


			# 1 ) Configure Environment

			[[ ! "$BASH_ENV" ]] \
			&& ! BashCtlr \
				prfl \
					hs \
						'export BASH_ENV.*' \
						\
						--pf "$_usr_bash_dflt_prfl_abs_pf" \
						--scp  "dflt" \
			&& BashCtlr \
				prfl \
					env \
						"BASH_ENV" \
						"$_usr_bash_glo_prfl_abs_pf" \
						--aft "$_cnvd_rmrk"'\^\|' \
					\
					--pf "$_usr_bash_dflt_prfl_abs_pf" \
					--scp "dflt" \
			;


			# 2 ) Load Configuration File

			[[ "$_usr_bash_dflt_prfl_abs_pf" != "$_usr_bash_glo_prfl_abs_pf" ]] \
			&& BashCtlr \
				prfl \
					wrt \
						'. "'"$_usr_bash_glo_prfl_abs_pf"'" ;\^\|' \
						--aft "$_cnvd_rmrk"'\^\|' \
					\
					--pf "$_usr_bash_dflt_prfl_abs_pf" \
					--scp "dflt" \
			;


		# GLOBAL PROFILE

		# - file name is not bash
		[[ \
			"` \
			basename \
				"$_usr_bash_glo_prfl_abs_pf" \
			`" \
			!= "bash" \
		]] \
		&& BashCtlr \
			prfl \
				rmrk \
					"$S_RMRK" \
				\
				--pf "$_usr_bash_glo_prfl_abs_pf" \
				--scp "glo" \
		;


			# 1 ) Enable Alias Feature

			! BashCtlr \
				ftr \
					'expand_aliases' \
			&& ! BashCtlr \
				prfl \
					hs \
						'shopt -s expand_aliases.*' \
						\
						--pf "$_usr_bash_glo_prfl_abs_pf" \
						--scp  glo \
			&& BashCtlr \
				prfl \
					ftr \
						'expand_aliases' \
						on \
						--aft "$_cnvd_rmrk"'\^\|' \
					\
					--pf "$_usr_bash_glo_prfl_abs_pf" \
					--scp  glo \
			;


			# 2 ) Enable Extented Glob Feature

			! BashCtlr \
				ftr \
					'extglob' \
			&& ! BashCtlr \
				prfl \
					hs \
						'shopt -s extglob.*' \
						\
						--pf "$_usr_bash_glo_prfl_abs_pf" \
						--scp "glo" \
			&& BashCtlr \
				prfl \
					ftr \
						'extglob' \
						on \
						--aft "$_cnvd_rmrk"'\^\|' \
					\
					--prfl "$_usr_bash_glo_prfl_abs_pf" \
					--scp "glo" \
			;


			# 3 ) Include Local Profile

			[[ "$_usr_bash_glo_prfl_abs_pf" != "$_usr_bash_lcl_prfl_abs_pf" ]] \
			&& BashCtlr \
				prfl \
					wrt \
						'\[\[ "\$USER" \=\= "'"$RL_USR"'" \&\& \-f \"'"$_usr_bash_lcl_prfl_abs_pf"'\" \]\] \&\& \. \"'"$_usr_bash_lcl_prfl_abs_pf"'\" ;\^\|' \
						--aft "$_cnvd_rmrk"'\^\|' \
					\
					--pf "$_usr_bash_glo_prfl_abs_pf" \
					--scp "glo" \
			;


			# 4 ) Safe Sudo

			! BashCtlr \
				aka \
					'sudo' \
			&& ! BashCtlr \
				prfl \
					hs \
						'alias sudo.*' \
						\
						--pf "$_usr_bash_glo_prfl_abs_pf" \
						--scp "glo" \
			&& BashCtlr \
				prfl \
					aka \
						'sudo' \
						'sudo ' \
						--aft "$_cnvd_rmrk"'\^\|' \
					\
					--pf "$_usr_bash_glo_prfl_abs_pf" \
					--scp "glo" \
			;


	# MAIN PROCESS : ACTION ) REMOVE --------

	elif [[ "$atn" =~ ^(rm|remove)$ ]] ;
	then


		# 1 ) Configure Environment

		[[ \
			! "$BASH_ENV" \
			|| "$BASH_ENV" == "${S_D_CNF_FLDR}/bash" \
		]] \
		&& BashCtlr \
			prfl \
				hs \
					'export BASH_ENV.*' \
					\
					--pf "$_usr_bash_dflt_prfl_abs_pf" \
					--scp  "dflt" \
		&& BashCtlr \
			prfl \
				env \
					"BASH_ENV" \
					--aft "$_cnvd_rmrk"'\^\|' \
					--dl \
				\
				--pf "$_usr_bash_dflt_prfl_abs_pf" \
				--scp "dflt" \
		;


		# 2 ) Load Configuration File

		[[ \
			"$_usr_bash_dflt_prfl_abs_pf" != "$_usr_bash_glo_prfl_abs_pf" \
			&& "$_usr_bash_glo_prfl_abs_pf" == "${S_D_CNF_FLDR}/bash" \
		]] \
		&& BashCtlr \
			prfl \
				ers \
					'. "'"$_usr_bash_glo_prfl_abs_pf"'" ;\^\|' \
					--aft "$_cnvd_rmrk"'\^\|' \
				\
				--pf "$_usr_bash_dflt_prfl_abs_pf" \
				--scp "dflt" \
		;


		# GLOBAL PROFILE

		# - file name is not bash
		[[ \
			"` \
			basename \
				"$_usr_bash_glo_prfl_abs_pf" \
			`" \
			!= "bash" \
		]] \
		&& BashCtlr \
			prfl \
				rmrk \
					"$S_RMRK" \
					--dl \
				\
				--pf "$_usr_bash_glo_prfl_abs_pf" \
				--scp "glo" \
		;


			# 1 ) Include Local Profile

			[[ "$_usr_bash_glo_prfl_abs_pf" != "$_usr_bash_lcl_prfl_abs_pf" ]] \
			&& BashCtlr \
				prfl \
					ers \
						'\[\[ \"\$USER\" \=\= \"'"$RL_USR"'\" \&\& \-f \"'"$_usr_bash_lcl_prfl_abs_pf"'\" \]\] \&\& \. \"'"$_usr_bash_lcl_prfl_abs_pf"'\" ;\^\|' \
						--aft "$_cnvd_rmrk"'\^\|' \
					\
					--pf "$_usr_bash_glo_prfl_abs_pf" \
					--scp "glo" \
			;


	fi ;


	# POST PROCESS : REPORT STATUS --------

	return $tru ;


} ;
