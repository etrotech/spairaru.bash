#!/usr/bin/env bash
# ######################################################################################
# GIT BRANCH CONTROLLER UTILITY GROUP
# ######################################################################################
GitBrnhCtlr() {


# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# CORE STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# ADD
# ======================================================================================
	GitBrnhCtlr__ad() {


		# [ arguments ]
		local _ax=("$@") ;

		# [ result ]
		local _rslt=$tru ;

		# [ git_tier_2_named_options ]
		local -a _git_t2_noptx ;


		# NAMED ARGUMENT --------

		# [ named_arguments ]
		local -A _nax=` \
			spairaru \
				cbl \
					nax \
						--prn "parent" \
						--prn-nov 1 \
						\
						--ovr "override" \
						--ovr-nov 1 \
		` ;


		# [ parent ]
		local prn="${_nax[prn]}" ;

		# [ override ]
		local ovr="${_nax[ovr]}" ;


		# MAIN PROCESS : ADD --------

		# git will not have branch until the first commit, 
		# the initial always 'master'.

		# - if not existing branch.
		if [[ -z "${_brnhx[@]}" ]] ;
		then


			# create empty file.
			touch \
				"$dir_abs_pf/__git__" \
			;


			GitTrCtlr__mrk \
				"$dir_abs_pf/__git__" \
			;


			# remove empty file.
			rm \
				-fr \
				"$dir_abs_pf/__git__" \
			;


			# [ branches ]
			local -a _brnhx=` GitBrnhCtlr__lst ` ;


		fi ;


		# A ) TARGET NOT EXISTS

		# - target branch not exists
		if [[ ! " ${_brnhx[@]} " =~ " ${lbl__} " ]] ;
		then


			# q 			: quiet
			[[ $env_vbo != $tru ]] \
			&& _git_t2_noptx+=(-q) \
			;


			# a ) Overwrite Current

			if [[ $ovr == $tru ]] ;
			then

				# rename current branch.
				# C 			: primary git directory
				# 1 			: command
				# --
				# m 			: rename current branch
				# q 			: quite
				# 1 			: new branch label
				spairaru \
					ppt \
						ivk \
							DfltBlkStrm \
							git \
								"${_git_t1_nax[@]}" \
								branch \
									-m \
									"$lbl__" \
									"${_git_t2_noptx[@]}" \
				;

				_rslt=$? ;


			# b ) New from Current

			else


				[[ $env_vbo == $tru ]] \
				&& echo "" \
				;


				[[ "$prn" ]] \
				&& _git_t2_poptx+=("$prn") \
				|| _git_t2_poptx+=("` \
					git \
						"${_git_t1_nax[@]}" \
						branch \
							--show-current \
				`") \
				;


				# C 			: primary git directory
				# 1 			: command
				# --
				# b 			: create branch
				# q 			: quite
				# 1 			: new branch label
				# 2 			: parent branch label
				spairaru \
					ppt \
						ivk \
							DfltBlkStrm \
							git \
								"${_git_t1_nax[@]}" \
								checkout \
									-b \
									"${_git_t2_noptx[@]}" \
									"$lbl__" \
									"${_git_t2_poptx[@]}" \
				;

				_rslt=$? ;


				[[ $env_vbo == $tru ]] \
				&& echo "" \
				;


			fi ;


		# B ) TARGET EXISTS
	
		# -  target branch its not current branch
		elif [[ "` GitTrCtlr__cb `" != "$lbl__" ]] ;
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
			# q 			: quite
			# 1 			: branch label
			spairaru \
				ppt \
					ivk \
						DfltBlkStrm \
						git \
							"${_git_t1_nax[@]}" \
							checkout \
								"${_git_t2_noptx[@]}" \
								"$lbl__" \
			;

			_rslt=$? ;


			[[ $env_vbo == $tru ]] \
			&& echo "" \
			;


		# - force to target branch
		elif [[ $nfc == $tru ]] ;
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
			# f 			: force
			# q 			: quite
			# 1 			: branch label
			spairaru \
				ppt \
					ivk \
						DfltBlkStrm \
						git \
						"${_git_t1_nax[@]}" \
						checkout \
							-f \
							"${_git_t2_noptx[@]}" \
							"$lbl__" \
			;

			_rslt=$? ;


			[[ $env_vbo == $tru ]] \
			&& echo "" \
			;


		# - target branch its current branch
		else 

			_rslt=2 ;


		fi ;


		# POST PROCESS : OUTPUT MESSAGE --------

		[[ $env_vbo == $tru ]] \
		&& spairaru \
			ppt \
				ivk \
					GnlIdvAtnx \
					\
					--atn "ad" \
					--stt "$_rslt" \
					\
					--cat "branch" \
					--ttl "$lbl__" \
		;


		# POST PROCESS : REPORT STATUS --------

		[[ $_rslt =~ ^(2)$ ]] \
		&& return $tru \
		|| return $_rslt \
		;


	} ;



# ======================================================================================
# CHANGE
# ======================================================================================
	GitBrnhCtlr__chg() {


		# [ result ]
		local _rslt=$tru ;

		# [ git_tier_2_named_options ]
		local -a _git_t2_noptx ;


		# MAIN PROCESS : CHANGE --------

		# [ current_branch ]
		local _cur_brnh="` GitTrCtlr__cb `" ;


		# A ) TARGET EXISTS

		if [[ " ${_brnhx[@]} " =~ " ${lbl__} " ]] ;
		then

			# - target branch its current branch
			# - enforce is not enabled
			if [[ \
				"$_cur_brnh" == "$lbl__" \
				&& $nfc != $tru
			]] ;
			then

				_rslt=2 ;


			else


				[[ $env_vbo == $tru ]] \
				&& echo "" \
				;


				# q 			: quiet
				[[ $env_vbo != $tru ]] \
				&& _git_t2_noptx+=(-q) \
				;


				# f 			: foce
				[[ $nfc == $tru ]] \
				&& _git_t2_noptx+=(-f) \
				;


				# C 			: primary git directory
				# 1 			: command
				# --
				# q 			: quite
				# 1 			: new branch label
				# 2 			: parent branch label
				spairaru \
					ppt \
						ivk \
							DfltBlkStrm \
							git \
								"${_git_t1_nax[@]}" \
								checkout \
									"${_git_t2_noptx[@]}" \
									"$lbl__" \
				;

				_rslt=$? ;


				[[ $env_vbo == $tru ]] \
				&& echo "" \
				;


			fi ;


		# B ) TARGET NOT EXISTS
	
		else

			_rslt=3 ;


		fi ;


		# POST PROCESS : OUTPUT MESSAGE --------

		if [[ $env_vbo == $tru ]] ;
		then


			# STATUS ) 0 , 1

			if [[ $_rslt =~ ^(0|1)$ ]] ;
			then

				spairaru \
					ppt \
						ivk \
							GnlAssoctvAtnx \
							\
							--atn "$atn__" \
							--stt "$_rslt" \
							\
							--src_cat "branch" \
							--src_ico "fldr" \
							--src_ttl "$_cur_brnh" \
							\
							--dst_cat "branch" \
							--dst_ico "fldr" \
							--dst_ttl "$lbl__" \
				;


			# STATUS ) 2

			elif [[ $_rslt == 2 ]] ;
			then

				spairaru \
					ppt \
						ivk \
							DfltAcpt \
							"already in %s%s." \
							"${ANSI_F_BL}${lbl__}${_ANSI} " \
							"branch" \
							--wc \
				;


			# STATUS ) 3

			elif [[ $_rslt == 3 ]] ;
			then

				spairaru \
					ppt \
						ivk \
							DfltRej \
							"%s%s does not exist." \
							"${ANSI_F_BL}${lbl__}${_ANSI}" \
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
# DELETE
# ======================================================================================
	GitBrnhCtlr__dl() {


		# [ arguments ]
		local _ax=("$@") ;

		# [ result ]
		local _rslt=$tru ;

		# [ git_tier_2_named_options ]
		local -a _git_t2_noptx ;


		# NAMED ARGUMENT --------

		# [ named_arguments ]
		local -A _nax=` \
			spairaru \
				cbl \
					nax \
						--fb "fallback" \
						--fb-nov 1 \
		` ;


		# [ fallback ]
		local fb="${_nax[fb]}" ;


		# MAIN PROCESS : DELETE --------

		# A ) TARGET NOT EXISTS

		# - target branch not exists
		if [[ ! " ${_brnhx[@]} " =~ " ${lbl__} " ]] ;
		then

			_rslt=2 ;


		# B ) TARGET EXISTS

		else


			# q 			: quiet
			[[ $env_vbo != $tru ]] \
			&& _git_t2_noptx+=(-q) \
			;


			# If current branch is target, 
			# must switch to different branch first.

			if [[ "` GitTrCtlr__cb `" == "$lbl__" ]] ;
			then


				# [ fallback ]
				local _fb ;


				# - fallback is givin
				# - fallback exists
				if [[ \
					-n "$fb" \
					&& " ${_brnhx[@]} " =~ " ${fb} "
				]] ;
				then

					_fb="$fb" ;


				else

					_fb="` \
						GitBrnhCtlr____gtFbBrnh \
							"$lbl__" \
							"${_brnhx[@]}" \
					`" ;


				fi ;


				# - fallback is set
				if [[ -n "$_fb" ]] ;
				then


					[[ $env_vbo == $tru ]] \
					&& echo "" \
					;


					# C 			: primary git directory
					# 1 			: command
					# --
					# q 			: quite
					# 1 			: branch label
					spairaru \
						ppt \
							ivk \
								DfltBlkStrm \
								git \
									"${_git_t1_nax[@]}" \
									checkout \
										"${_git_t2_noptx[@]}" \
										"$_fb" \
					;


					_rslt=$? ;


				# - fallback is empty
				else

					_rslt=3 ;


				fi ;


			fi ;


			if [[ $_rslt == $tru ]] ;
			then


				[[ $env_vbo == $tru ]] \
				&& echo "" \
				;


				# d 			: delete
				_git_t2_noptx+=(-d) ;


				# C 			: primary git directory
				# 1 			: command
				# --
				# d 			: delete
				# q 			: quite
				# 1 			: branch label
				spairaru \
					ppt \
						ivk \
							DfltBlkStrm \
							git \
								"${_git_t1_nax[@]}" \
								branch \
									"${_git_t2_noptx[@]}" \
									"$lbl__" \
				;

				_rslt=$? ;


			fi ;


			[[ $env_vbo == $tru ]] \
			&& echo "" \
			;


		fi ;

		# POST PROCESS : OUTPUT MESSAGE --------

		[[ $env_vbo == $tru ]] \
		&& spairaru \
			ppt \
				ivk \
					GnlIdvAtnx \
					\
					--atn "dl" \
					--stt "$_rslt" \
					\
					--cat "branch" \
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
	GitBrnhCtlr__hs() {

		# - target branch not exists
		[[ " ${_brnhx[@]} " =~ " ${lbl__} " ]] \
		&& return $tru \
		|| return $fls \
		;


	} ;



# ======================================================================================
# LIST
# ======================================================================================
	GitBrnhCtlr__lst() {


		# MAIN PROCESS : GET BRANCHES --------

		# Branches format likely to below,
		# Replace * with space in order to perform array contains.
		# 
		# * xxx
		#   master
		#   ...

		# [ branches ]
		local -a _brnhx="` \
			git \
				"${_git_t1_nax[@]}" \
				branch \
			| sed \
				-r \
				-z \
				-e 's/(\*| )//g' \
				-e 's/(\n|\r\n)/ /g' \
		`";



		# POST PROCESS : OUTPUT RESULT --------

		echo "(${_brnhx[@]})" ;


		# POST PROCESS : REPORT STATUS --------

		return $tru ;


	} ;



# ======================================================================================
# MERGE
# ======================================================================================
	GitBrnhCtlr__mg() {


		# [ arguments ]
		local _ax=("$@") ;

		# [ result ]
		local _rslt=$tru ;

		# [ git_tier_2_named_options ]
		local -a _git_t2_noptx ;


		# NAMED ARGUMENT --------

		# [ named_arguments ]
		local -A _nax=` \
			spairaru \
				cbl \
					nax \
						--ovr "override" \
						--ovr-nov 1 \
		` ;


		# [ override ]
		local ovr="${_nax[ovr]}" ;


		# MAIN PROCESS : MERGE --------

		# [ current_branch ]
		local _cur_brnh="` GitTrCtlr__cb `" ;


		# A ) TAGET IS CURRENT

		if [[ "$_cur_brnh" == "$lbl__" ]] ;
		then

			_rslt=2 ;


		# A ) TAGET IS NOT CURRENT

		else


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
									"$lbl__" \
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
									"$lbl__" \
				;


			fi ;


			_rslt=$? ;


			[[ $env_vbo == $tru ]] \
			&& echo "" \
			;


		fi ;


		# POST PROCESS : OUTPUT MESSAGE --------

		[[ $env_vbo == $tru ]] \
		&& spairaru \
			ppt \
				ivk \
					GnlAssoctvAtnx \
					\
					--atn "$atn__" \
					--stt "$_rslt" \
					\
					--src_cat "branch" \
					--src_ico "fldr" \
					--src_ttl "$lbl__" \
					\
					--dst_cat "branch" \
					--dst_ico "fldr" \
					--dst_ttl "$_cur_brnh" \
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

	# [ lable ]
	local lbl__="${_pax[1]}" ;


	# PRECHECK : ACTION --------

	if [[ -z "$atn__" ]] ;
	then


		[[ $env_vbo == $tru ]] \
		&& spairaru \
			ppt \
				ivk \
					CblMpa \
					"Action" \
					--pos "1st" \
		;


		return $fls ;


	fi ;


	# PRECHECK : LABEL --------

	if [[ -z "$lbl__" ]] ;
	then


		[[ $env_vbo == $tru ]] \
		&& spairaru \
			ppt \
				ivk \
					CblMpa \
					"Module Label" \
					--pos "2nd" \
		;


		return $fls ;


	fi ;


	# MAIN PROCESS : BRANCHES --------

	# [ branches ]
	local -a _brnhx=` GitBrnhCtlr__lst ` ;


	# MAIN PROCESS : METHOD --------

	# [ action ]
	local _atn=;


	case "$atn__" in


		ad | add ) _atn=GitBrnhCtlr__ad ;;

		chg | change ) _atn=GitBrnhCtlr__chg ;;

		dl | delete ) _atn=GitBrnhCtlr__dl ;;

		hs | has ) _atn=GitBrnhCtlr__hs ;;

		lst | list ) _atn=GitBrnhCtlr__lst ;;

		mg | merge ) _atn=GitBrnhCtlr__mg ;;


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
