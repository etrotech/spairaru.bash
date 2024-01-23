#!/usr/bin/env bash
# ######################################################################################
# GIT TAG CONTROLLER UTILITY GROUP
# ######################################################################################
GitTagCtlr() {


# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# CORE STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# ADD
# ======================================================================================
	GitTagCtlr__ad() {


		# [ result ]
		local _rslt=$tru ;

		# [ git_tier_2_named_options ]
		local -a _git_t2_noptx ;


		# POSITIONED ARGUMENT --------

		# [ lable ]
		local lbl__="${_pax[1]}" ;

		# [ branch ]
		local brnh__="${_pax[2]}" ;


		# PRECHECK : LABEL --------

		if [[ -z "$lbl__" ]] ;
		then


			[[ $env_vbo == $tru ]] \
			&& spairaru \
				ppt \
					ivk \
						CblMpa \
						"Tag Label" \
						--pos "1st" \
			;


			return $fls ;


		fi ;


		# PRECHECK : BRANCH --------

		# [ branch ]
		local _brnh="$brnh__" ;


		[[ -z "$_brnh" ]] \
		&& _brnh="` \
			GitTrCtlr \
				cb \
		`" \
		;


		if [[ -z "$_brnh" ]] ;
		then


			[[ $env_vbo == $tru ]] \
			&& spairaru \
				ppt \
					ivk \
						CblMpa \
						"Branch Label" \
						--pos "2nd" \
			;


			return $fls ;


		fi ;


		# MAIN PROCESS : ADD --------

		# - tag found
		if GitTagCtlr__hs ;
		then

			_rslt=2 ;


		else 


			# 1 ) Register Submodule

			# C 			: git directory
			# 1 			: command category
			# --
			# 1 			: command 
			# --
			# 1 			: tag label
			# 2 			: branch label
			spairaru \
				ppt \
					ivk \
						DfltBlkStrm \
						git \
							"${_git_t1_nax[@]}" \
							tag \
								"$lbl__" \
								"$_brnh" \
								"${_git_t2_noptx[@]}" \
			;

			_rslt=$? ;


		fi ;


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
					--cat "tag" \
					--ttl "$lbl__" \
		;


		# POST PROCESS : REPORT STATUS --------

		[[ $_rslt =~ ^(2)$ ]] \
		&& return $tru \
		|| return $_rslt \
		;


	} ;



# ======================================================================================
# DELETE
# ======================================================================================
	GitTagCtlr__dl() {


		# [ result ]
		local _rslt=$tru ;

		# [ git_tier_2_named_options ]
		local -a _git_t2_noptx ;


		# POSITIONED ARGUMENT --------

		# [ lable ]
		local lbl__="${_pax[1]}" ;

		# [ branch ]
		local brnh__="${_pax[2]}" ;


		# PRECHECK : LABEL --------

		if [[ -z "$lbl__" ]] ;
		then


			[[ $env_vbo == $tru ]] \
			&& spairaru \
				ppt \
					ivk \
						CblMpa \
						"Tag Label" \
						--pos "1st" \
			;


			return $fls ;


		fi ;


		# PRECHECK : BRANCH --------

		# [ branch ]
		local _brnh="$brnh__" ;


		[[ -z "$_brnh" ]] \
		&& _brnh="` \
			GitTrCtlr \
				cb \
		`" \
		;


		if [[ -z "$_brnh" ]] ;
		then


			[[ $env_vbo == $tru ]] \
			&& spairaru \
				ppt \
					ivk \
						CblMpa \
						"Branch Label" \
						--pos "2nd" \
			;


			return $fls ;


		fi ;


		# MAIN PROCESS : DELETE --------

		# - tag not found
		if ! GitTagCtlr__hs ;
		then

			_rslt=2 ;


		else 


			# 1 ) Register Submodule

			# C 			: git directory
			# 1 			: command category
			# --
			# 1 			: command 
			# --
			# 1 			: tag label
			# 2 			: branch label
			spairaru \
				ppt \
					ivk \
						DfltBlkStrm \
						git \
							"${_git_t1_nax[@]}" \
							tag \
								"$lbl__" \
								-d \
			;

			_rslt=$? ;


		fi ;


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
					--cat "tag" \
					--ttl "$lbl__" \
		;


		# POST PROCESS : REPORT STATUS --------

		[[ $_rslt =~ ^(2)$ ]] \
		&& return $tru \
		|| return $_rslt \
		;


	} ;



# ======================================================================================
# HAS
# ======================================================================================
	GitTagCtlr__hs() {


		# POSITIONED ARGUMENT --------

		# [ lable ]
		local lbl__="${_pax[1]}" ;


		# PRECHECK : LABEL --------

		if [[ -z "$lbl__" ]] ;
		then


			[[ $env_vbo == $tru ]] \
			&& spairaru \
				ppt \
					ivk \
						CblMpa \
						"Tag Label" \
						--pos "1st" \
			;


			return $fls ;


		fi ;


		# POST PROCESS : REPORT STATUS --------

		[[ "`GitTagCtlr__lst`" =~ "$lbl__" ]] \
		&& return $tru \
		|| return $fls \
		;


	} ;



# ======================================================================================
# LIST
# ======================================================================================
	GitTagCtlr__lst() {


		# C 			: primary git directory
		# 1 			: command 
		# --file 		
		# --get-regexp 	
		git \
			"${_git_t1_nax[@]}" \
			tag \
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

	if [[ -z "$atn__" ]] ;
	then


		[[ $env_vbo == $tru ]] \
		&& spairaru \
			ppt \
				ivk \
					CblMpa \
					"Action" \
		;


		return $fls ;


	fi ;


	# MAIN PROCESS : METHOD --------

	# [ action ]
	local _atn=;


	case "$atn__" in


		ad | add ) _atn=GitTagCtlr__ad ;;

		dl | delete ) _atn=GitTagCtlr__dl ;;

		hs | has ) _atn=GitTagCtlr__hs ;;

		lst | list ) _atn=GitTagCtlr__lst ;;


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


