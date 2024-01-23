#!/usr/bin/env bash
# ######################################################################################
# GIT REMOTE CONTROLLER UTILITY GROUP
# ######################################################################################
GitRmtCtlr() {


# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# CORE STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# ADD
# ======================================================================================
	GitRmtCtlr__ad() {


		# [ result ]
		local _rslt=$tru ;

		# [ git_tier_2_named_options ]
		local -a _git_t2_noptx ;


		# POSITIONED ARGUMENT --------

		# [ lable ]
		local lbl__="${_pax[1]}" ;

		# [ address ]
		local addr__="${_pax[2]}" ;


		# PRECHECK : LABEL --------

		if [[ -z "$lbl__" ]] ;
		then


			[[ $env_vbo == $tru ]] \
			&& spairaru \
				ppt \
					ivk \
						CblMpa \
						"Remote Label" \
						--pos "1st" \
			;


			return $fls ;


		fi ;


		# PRECHECK : ADDRESSS --------

		if [[ -z "$addr__" ]] ;
		then


			[[ $env_vbo == $tru ]] \
			&& spairaru \
				ppt \
					ivk \
						CblMpa \
						"Address" \
						--pos "2nd" \
			;


			return $fls ;


		fi ;


		# MAIN PROCESS : ADD --------

		# - if remote lable found.
		if [[ "` \
			git \
				"${_git_t1_nax[@]}" \
				remote \
			| grep \
				"$lbl__" \
		`" ]] ;
		then

			_rslt=2 ;


		else


			# 1 ) Register Remote

			# register remote.

			# C 			: primary git directory
			# 1 			: command 
			# --
			# 1 			: action
			# 2 			: remote label
			# 3 			: remote url
			git \
				"${_git_t1_nax[@]}" \
				remote \
					add \
						"$lbl__" \
						"$addr__" \
			;

			_rslt=$? ;


			# 2 ) Pull Remote Heads

			# C 			: primary git directory
			# 1 			: command 
			# 2 			:action
			# 3 : remote label
			# git \
			# 	"${_git_t1_nax[@]}" \
			# 	remote \
			# 		update \
			# 			"$lbl__" \
			# ;


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
					--cat "remote" \
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
	GitRmtCtlr__dl() {


		# [ result ]
		local _rslt=$tru ;

		# [ git_tier_2_named_options ]
		local -a _git_t2_noptx ;


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
						"Remote Label" \
						--pos "1st" \
			;


			return $fls ;


		fi ;


	} ;



# ======================================================================================
# HAS
# ======================================================================================
	GitRmtCtlr__hs() {


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
						"Remote Label" \
						--pos "1st" \
			;


			return $fls ;


		fi ;


		# POST PROCESS : REPORT STATUS --------

		[[ "`GitRmtCtlr__lst`" =~ "$lbl__" ]] \
		&& return $tru \
		|| return $fls \
		;


	} ;



# ======================================================================================
# LIST
# ======================================================================================
	GitRmtCtlr__lst() {


		# C 			: primary git directory
		# 1 			: command 
		git \
			"${_git_t1_nax[@]}" \
			remote \
		;

		return $? ;


	} ;



# ======================================================================================
# UPDATE
# ======================================================================================
	GitRmtCtlr__upd() {


		# [ result ]
		local _rslt=$tru ;

		# [ git_tier_2_named_options ]
		local -a _git_t2_noptx ;


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
						"Remote Label" \
						--pos "1st" \
			;


			return $fls ;


		fi ;


		# MAIN PROCESS : UPDATE --------

		# A ) Remote Exists

		if [[ "`GitRmtCtlr__lst`" =~ "$lbl__" ]] ;
		then


			# i ) Changes Detected

			if [[ "` \
				git \
					"${_git_t1_nax[@]}" \
					pull \
					--dry-run \
			`" ]] ;
			then


				[[ $env_vbo == $tru ]] \
				&& echo "" \
				;


				# q 			: quiet
				[[ $env_vbo != $tru ]] \
				&& _git_t2_noptx+=(-q) \
				;


				# C 			: primary git directory
				# 1 			: command 
				# --
				# q 			: quiet
				spairaru \
					ppt \
						ivk \
							DfltBlkStrm \
							git \
								"${_git_t1_nax[@]}" \
								pull \
									"${_git_t2_noptx[@]}" \
				;

				_rslt=$? ;


				[[ $env_vbo == $tru ]] \
				&& echo "" \
				;


			# ii ) No Changes Detected

			else 

				_rslt=2 ;


			fi ;


		# B ) Module not Exists

		else 

			_rslt=$fls ;


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
					--cat "remote" \
					--ttl "$lbl__" \
		;


		# POST PROCESS : REPORT STATUS --------

		[[ $_rslt =~ ^(2)$ ]] \
		&& return $tru \
		|| return $_rslt \
		;


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


		ad | add ) _atn=GitRmtCtlr__ad ;;

		dl | delete ) _atn=GitRmtCtlr__dl ;;

		hs | has ) _atn=GitRmtCtlr__hs ;;

		lst | list ) _atn=GitRmtCtlr__lst ;;

		upd | update ) _atn=GitRmtCtlr__upd ;;


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
