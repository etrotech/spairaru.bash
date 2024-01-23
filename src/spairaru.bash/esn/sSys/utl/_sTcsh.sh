#!/usr/bin/env bash
# ######################################################################################
# FISH UTILITY
# ######################################################################################
# ======================================================================================
# GET TCSH PROFILE PATH
# 
# Description:
# 	Determine configuration file location.
#
# ======================================================================================1
s_gtTcshPrflPf() {


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


	# PROFILE ) CUSTOM

	# - profile_path is set
	if [[ -n "$pf" ]] ;
	then

		_prfl_abs_pf="$pf" ;


	# PROFILE ) LOCAL
	# 	🛠️
	# 	└─ 🖿 $HOME
	# 	   └─ 🖺 .tcshrc 👈

	# - otherwise
	else

		_prfl_abs_pf="${_hm_abs_pf}/.tcshrc" ;


	fi ;


	# POST PROCESS : OUTPUT RESULT --------

	s_xcpFsPf \
		"$_prfl_abs_pf" \
	;


	# POST PROCESS : REPORT STATUS --------

	return $tru ;


} ;



# ======================================================================================
# GET TCSH PROFILE PATH
# ======================================================================================1
s_gtTcshVer() {


	echo $version ;


} ;



# ======================================================================================
# OPTIMIZE ZSH FOR BASH
# ======================================================================================1
s_optmzTcsh4Bash() {


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


	# PRE PROCESS : ACTION --------

	# [ user_tcsh_local_profile_absolute_path ]
	local _usr_tcsh_lo_prfl_abs_pf="` \
		s_gtTcshPrflPf \
			--scp lo \
			--usr "$usr" \
	`" ;

	# [ user_bash_global_profile_absolute_path ]
	local _usr_bash_glo_prfl_abs_pf="` \
		s_gtBashPrflPf \
			--scp glo \
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


		TcshCtlr \
			prfl \
				rmrk \
					"$S_RMRK" \
				\
				--pf "$_usr_tcsh_lo_prfl_abs_pf" \
				--scp lo \
		;


			# 1 )  Configure Environment

			[[ ! "$BASH_ENV" ]] \
			&& ! TcshCtlr \
				prfl \
					hs \
						'export BASH_ENV.*' \
					\
					--pf "$_usr_tcsh_lo_prfl_abs_pf" \
					--scp lo \
			&& TcshCtlr \
				prfl \
					env \
						"BASH_ENV" \
						"$_usr_bash_glo_prfl_abs_pf" \
						--aft "$_cnvd_rmrk"'\^\|\^\|' \
					\
					--scp lo \
					--pf "$_usr_tcsh_lo_prfl_abs_pf" \
			;


			# 2 ) Safe Sudo

			! TcshCtlr \
				aka \
					'sudo' \
			&& ! TcshCtlr \
				prfl \
					hs \
						'alias sudo.*' \
						\
						--pf "$_usr_tcsh_lo_prfl_abs_pf" \
						--scp "glo" \
			&& TcshCtlr \
				prfl \
					aka \
						'sudo' \
						'sudo ' \
						--aft "$_cnvd_rmrk"'\^\|' \
					\
					--pf "$_usr_tcsh_lo_prfl_abs_pf" \
					--scp "glo" \
			;


	# MAIN PROCESS : ACTION ) REMOVE --------

	elif [[ "$atn" =~ ^(rm|remove)$ ]] ;
	then

		# 1 )  Configure Environment

		[[ \
			! "$BASH_ENV" \
			|| "$BASH_ENV" == "${S_D_CNF_FLDR}/bash" \
		]] \
		&& TcshCtlr \
			prfl \
				hs \
					'export BASH_ENV.*' \
				\
				--pf "$_usr_tcsh_lo_prfl_abs_pf" \
				--scp lo \
		&& TcshCtlr \
			prfl \
				env \
					"BASH_ENV" \
					--aft "$_cnvd_rmrk"'.*' \
					--dl \
				\
				--scp lo \
				--pf "$_usr_tcsh_lo_prfl_abs_pf" \
		;


	fi ;


	# POST PROCESS : REPORT STATUS --------

	return $tru ;


} ;
