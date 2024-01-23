#!/usr/bin/env bash
# ######################################################################################
# GIT SYNCHRONIZE CONTROLLER UTILITY GROUP
# ######################################################################################
GitSyncCtlr() {


# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# CORE STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# DOWNLOAD
# ======================================================================================
	GitModxCtlr__dwld() {


		# [ arguments ]
		local _ax=("$@") ;

		# [ result ]
		local _rslt=$tru ;


		# NAMED ARGUMENT --------

		# [ named_arguments ]
		local -A _nax=` \
			spairaru \
				cbl \
					nax \
						--ovr "override" \
						--ovr-nov 1 \
						\
						--tagx "tags" \
		` ;


		# [ override ]
		local ovr="${_nax[ovr]}" ;

		# [ tags ]
		local tagx="${_nax[tagx]}" ;


		# MAIN PROCESS : DOWNLOAD --------

		# A ) Changes Detected
		
		if [[ "$_diff" ]] ;
		then


			# download from local repository to working directory.

			[[ $env_vbo == $tru ]] \
			&& echo "" \
			;


			# q 			: quiet
			# v 			: verbose
			[[ $env_vbo == $tru ]] \
			&& _git_t2_noptx+=(-v) \
			|| _git_t2_noptx+=(-q) \
			;


			if [[ $ovr == $tru ]] ;
			then

				# C 			: primary git directory
				# 1 			: command 
				# --
				# q 			: quite
				# v 			: verbose
				# 1 			: remote
				# 2 			: branch
				spairaru \
					ppt \
						ivk \
							DfltBlkStrm \
							git \
								"${_git_t1_nax[@]}" \
								rebase \
									"${_git_t2_noptx[@]}" \
									"$rmt__" \
									"$brnh__" \
				;


			else

				# C 			: primary git directory
				# 1 			: command 
				# --
				# q 			: quite
				# v 			: verbose
				# 1 			: remote
				# 2 			: branch
				spairaru \
					ppt \
						ivk \
							DfltBlkStrm \
							git \
								"${_git_t1_nax[@]}" \
								merge \
									"${_git_t2_noptx[@]}" \
									"$rmt__" \
									"$brnh__" \
				;


			fi ;


			_rslt=$? ;


			[[ $env_vbo == $tru ]] \
			&& echo "" \
			;


		# B ) Change not Detected
		
		else 

			_rslt=2 ;


		fi ;


		# POST PROCESS : OUTPUT MESSAGE --------

		if [[ $env_vbo == $tru ]] ;
		then 


			# STATUS ) 0 , 1

			if [[ $_rslt =~ ^($tru|$fls)$ ]] ;
			then

				spairaru \
					ppt \
						ivk \
							GnlAssoctvAtnx \
							--atn "sync" \
							--stt "$_rslt" \
							\
							--src_ico "tr" \
							--src_cat "branch" \
							--src_ttl "${ANSI_F_CN}${rmt__}${_ANSI}/${ANSI_F_BL}${brnh__}${_ANSI}" \
							\
							--dst_ico "tr" \
							--dst_cat "branch" \
							--dst_ttl "${_cur_brnh}" \
				;


			# STATUS ) 2

			elif [[ $_rslt == 2 ]] ;
			then

				spairaru \
					ppt \
						ivk \
							DfltAcpt \
							"%s%s is already up to date." \
							"${ANSI_F_BL}${_cur_brnh}${_ANSI} " \
							"branch" \
							--wc \
				;


			fi ;


		fi ;


		# POST PROCESS : REPORT STATUS --------

		[[ $_rslt =~ ^(2)$ ]] \
		&& return $tru \
		|| return $_rslt \
		;


	} ;



# ======================================================================================
# UPLOAD
# ======================================================================================
	GitModxCtlr__upld() {


		# [ result ]
		local _rslt=$tru ;


		# NAMED ARGUMENT --------

		# [ named_arguments ]
		local -A _nax=` \
			spairaru \
				cbl \
					nax \
						--tagx "tags" \
		` ;


		# [ tags ]
		local tagx="${_nax[tagx]}" ;


		# MAIN PROCESS : UPLOAD --------

		# A ) Changes Detected
		
		if [[ \
			"$_diff" \
			|| $env_nfc == $tru \
		]] ;
		then


			[[ $env_vbo == $tru ]] \
			&& echo "" \
			;


			# force to update is enabled.
			[[ $nfc == $tru ]] \
			&& _git_t2_noptx+=(-u -f) \
			;


			# q 			: quiet
			# v 			: verbose
			[[ $env_vbo == $tru ]] \
			&& _git_t2_noptx+=(-v) \
			|| _git_t2_noptx+=(-q) \
			;


			# upload from local to remote repository.

			# C 			: primary git directory
			# 1 			: command 
			# --
			# f 			: force
			# u 			: set-upstream; overwrite base
			# q 			: quite
			# v 			: verbose
			# 1 			: remote label
			# 2 			: branch label
			spairaru \
				ppt \
					ivk \
						DfltBlkStrm \
						git \
							"${_git_t1_nax[@]}" \
							push \
								"${_git_t2_noptx[@]}" \
								--tags \
								"$rmt__" \
								"$brnh__" \
			;

			_rslt=$? ;


			# if [[ \
			# 	$_rslt == $tru \
			# 	&& $tagx == $tru \
			# ]] ;
			# then

			# 	# C 			: primary git directory
			# 	# 1 			: command 
			# 	# --
			# 	# f 			: force
			# 	# u 			: set-upstream; overwrite base
			# 	# q 			: quite
			# 	# v 			: verbose
			# 	# tags 			: push tags
			# 	# 1 			: remote label
			# 	# 2 			: branch label
			# 	spairaru \
			# 		ppt \
			# 			ivk \
			# 				DfltBlkStrm \
			# 				git \
			# 					"${_git_t1_nax[@]}" \
			# 					push \
			# 						"${_git_t2_noptx[@]}" \
			# 						--tags \
			# 						"$rmt__" \
			# 						"$brnh__" \
			# 	;

			# 	_rslt=$? ;

			# fi ;


			[[ $env_vbo == $tru ]] \
			&& echo "" \
			;


		# B ) Change not Detected
		
		else 

			_rslt=2 ;


		fi ;


		# POST PROCESS : OUTPUT MESSAGE --------

		if [[ $env_vbo == $tru ]] ;
		then 


			# STATUS ) 0 , 1

			if [[ $_rslt =~ ^($tru|$fls)$ ]] ;
			then

				spairaru \
					ppt \
						ivk \
							GnlAssoctvAtnx \
							--atn "sync" \
							--stt "$_rslt" \
							\
							--src_ico "tr" \
							--src_cat "branch" \
							--src_ttl "${_cur_brnh}" \
							\
							--dst_ico "tr" \
							--dst_cat "branch" \
							--dst_ttl "${ANSI_F_CN}${rmt__}${_ANSI}/${ANSI_F_BL}${brnh__}${_ANSI}" \
				;


			# STATUS ) 2

			elif [[ $_rslt == 2 ]] ;
			then

				spairaru \
					ppt \
						ivk \
							DfltAcpt \
							"%s/%s branch is already up to date." \
							"${ANSI_F_BL}${rmt__}${_ANSI}" \
							"${ANSI_F_CN}${brnh__}${_ANSI}" \
							--wc \
				;


			fi ;


		fi ;


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

	# [ remote ]
	local rmt__="${_pax[1]}" ;

	# [ branch ]
	local brnh__="${_pax[2]}" ;


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


	# [ action ]
	local _atn=;


	case "$atn__" in


		dwld | download ) _atn=GitModxCtlr__dwld ;;

		upld | upload ) _atn=GitModxCtlr__upld ;;


	esac ;


	# - action is empty
	[[ -z "$_atn" ]] \
	&& return $fls \
	;


	# PRECHECK : REMOTE --------

	if [[ ! "$rmt__" ]] ;
	then


		[[ $env_vbo == $tru ]] \
		&& spairaru \
			ppt \
				mpa \
					"Remote" \
					--pos "1st" \
		;


		return $fls ;


	fi ;


	# PRECHECK : BRANCH --------

	if [[ ! "$brnh__" ]] ;
	then


		[[ $env_vbo == $tru ]] \
		&& spairaru \
			ppt \
				mpa \
					"Branch" \
					--pos "2nd" \
		;


		return $fls ;


	fi ;


	# MAIN PROCESS : GET CURRENT --------

	# [ current_branch ]
	local _cur_brnh="` GitTrCtlr__cb `" ;


	# MAIN PROCESS : FIND DIFFERENCE --------

	# ↓ download from remote to local repository.

	# C 			: primary git directory
	# 1 			: command 
	# --
	# 1 			: remote
	# 2 			: branch
	if git \
		"${_git_t1_nax[@]}" \
		fetch \
			"$rmt__" \
			"$brnh__" \
		&>/dev/null \
	;
	then


		# C 			: primary git directory
		# 1 			: command 
		# --
		# tags 			: fetch tag
		# 1 			: remote
		# 2 			: branch
		git \
			"${_git_t1_nax[@]}" \
			fetch \
				--tags \
				"$rmt__" \
				"$brnh__" \
			&>/dev/null \
		;


		# check difference.
		# [ difference ]
		local _diff="` \
			git \
				"${_git_t1_nax[@]}" \
				diff \
					--stat \
					"$_cur_brnh" \
					"${rmt__}/${brnh__}" \
				2>/dev/null \
		`" ;


	else

		# [ difference ]
		local _diff=$tru ;


	fi ;


	# MAIN PROCESS : METHOD --------

	shift 1 \
	&& "$_atn" \
		"$@" \
	;


	# POST PROCESS : REPORT STATUS --------

	return $? ;


} ;
