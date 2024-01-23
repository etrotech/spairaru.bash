#!/usr/bin/env bash
# ######################################################################################
# GIT MODULES CONTROLLER UTILITY GROUP
# ######################################################################################
GitModxCtlr() {


# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# CORE STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# LIST
# ======================================================================================
	GitModxCtlr__lst() {


		GitModCtlr \
			lst \
				"$@" \
		;


	} ;



# ======================================================================================
# UPDATE
# ======================================================================================
	GitModxCtlr__upd() {


		# [ result ]
		local _rslt=$tru ;

		# [ git_tier_2_named_options ]
		local -a _git_t2_noptx ;


		# MAIN PROCESS : UPDATE --------

		[[ $env_vbo == $tru ]] \
		&& echo "" \
		;


		# C 		: git directory
		# 1 		: command category
		# --
		# 1 		: command
		spairaru \
			ppt \
				ivk \
					DfltBlkStrm \
					git \
						"${_git_t1_nax[@]}" \
						submodule \
							foreach \
								git \
									pull \
		;

		rslt=$? ;


		[[ $env_vbo == $tru ]] \
		&& echo "" \
		;


		# POST PROCESS : OUTPUT MESSAGE --------

		[[ $env_vbo == $tru ]] \
		&& spairaru \
			ppt \
				ivk \
					GnlIdvAtnx \
					\
					--atn "$atn__" \
					--stt "$_rslt" \
					\
					--cat "modules" \
		;


		# POST PROCESS : REPORT STATUS --------

		return $_rslt ;


	} ;



# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# DEFAULT STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# CONSTRUCTOR
# ======================================================================================


	# [ arguments ]
	local _ax=("$@") ;


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


	# [ action ]
	local atn__="${_pax[0]}" ;


	# PRECHECK : ACTION --------

	[[ -z "$atn__" ]] \
	&& atn__=lst \
	;


	# MAIN PROCESS : METHOD --------

	# [ action ]
	local _atn=;


	case "$atn__" in


		lst | list ) _atn=GitModxCtlr__lst ;;

		upd | update ) _atn=GitModxCtlr__upd ;;


	esac ;


	# - action is not empty
	if [[ "$_atn" ]] ;
	then


		shift 1 \
		&& "$_atn" \
			"$@" \
		;


		return $? ;


	fi ;


	# POST PROCESS : REPORT STATUS --------

	return $fls ;


} ;
