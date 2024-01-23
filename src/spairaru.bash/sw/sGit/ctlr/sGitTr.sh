#!/usr/bin/env bash
# ######################################################################################
# GIT TREE CONTROLLER UTILITY GROUP
# ######################################################################################
GitTrCtlr() {


# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# STATEFUL STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# HAS INITIATED
# ======================================================================================
	GitTrCtlr__hsInitd() {


		# C 			: git folder
		# 1 			: action
		` \
			git \
				"${_git_t1_nax[@]}" \
				status \
				&>/dev/null \
		` \
		&& return $tru \
		|| return $fls \
		;


	} ;



# ======================================================================================
# HAS CHANGE
# ======================================================================================
	GitTrCtlr__hsChg() {


		# MAIN PROCESS : DETERMINE --------

		# C 			: git folder
		# 1 			: action
		[[ "` \
			git \
				"${_git_t1_nax[@]}" \
				status \
			| grep \
				"git add" \
		`" ]] \
		&& return $tru \
		|| return $fls \
		;


	} ;



# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# CONFIGURATIVE STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# INITIATE
# ======================================================================================
	GitTrCtlr__init() {


		# [ arguments ]
		local _ax=("$@") ;

		# [ result ]
		local _rslt=$tru ;

		# [ git_tier_2_named_options ]
		local -a _git_t2_noptx ;

		# [ git_tier_2_positioned_options ]
		local -a _git_t2_poptx ;


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


		# [ source_path ]
		local src_pf__="${_pax[0]}" ;


		# NAMED ARGUMENT --------

		# [ named_arguments ]
		local -A _nax=` \
			spairaru \
				cbl \
					nax \
						--dst "destination" \
						--dst-nov 1 \
						\
						--ho "head_only" \
		` ;


		# [ destination ]
		local dst="${_nax[dst]}" ;

		# [ head_only ]
		local ho="${_nax[ho]}" ;


		# MAIN PROCESS : INITIATION --------

		if [[ -z "$src_pf__" ]] ;
		then

			# A ) .git Exists

			# - git is initiated
			if \
				git \
					"${_git_t1_nax[@]}" \
					status \
					&>/dev/null \
			;
			then

				_rslt=2 ;


			# B ) .git not Exists

			else

				git \
					"${_git_t1_nax[@]}" \
					init \
					&>/dev/null \
				;

				_rslt=$? ;


			fi ;


		# MAIN PROCESS : CLONE --------

		elif [[ "$src_pf__" ]] ;
		then


			# A ) Destination already Exists

			if [[ \
				"$dst" \
				&& -d "$dst" \
			]] ;
			then 

				_rslt=3 ;


			# B ) Destination does not Exists

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


				# n 		: noncheckout
				# filter 	: blob:none
				[[ $ho == $tru ]] \
				&& _git_t2_noptx+=(-n) \
				&& _git_t2_noptx+=(--filter=blob:none) \
				;


				[[ "$dst" ]] \
				&& _git_t2_poptx+=("$dst") \
				;


				# C 		: git directory
				# 1 		: command
				# --
				# n 		: noncheckout
				# q 		: quiet
				# filter 	: blob:none
				# 1 		: remote repository url
				# 2			: module git directory
				spairaru \
					ppt \
						ivk \
							DfltBlkStrm \
							git \
								"${_git_t1_nax[@]}" \
								clone \
									"${_git_t2_noptx[@]}" \
									"$src_pf__" \
									"${_git_t2_poptx[@]}" \
				;

				_rslt=$? ;


				[[ $env_vbo == $tru ]] \
				&& echo "" \
				;


			fi ;


		fi ;


		# MAIN PROCESS : CONFIGURATION --------

		if [[ $_rslt =~ ^(0|2|3)$ ]] ;
		then 


			[[ "$dst" ]] \
			&& spairaru \
				git \
					tr \
						optmz \
					\
					"$@" \
					--dir "$dst" \
			|| GitTrCtlr__optmz \
				"$@" \
			;


		fi ;


		# POST PROCESS : OUTPUT MESSAGE --------

		if [[ $env_vbo == $tru ]] ;
		then 


			# [ destination ]
			local _dst ;


			[[ "$dst" ]] \
			&& _dst="$dst" \
			|| _dst="$dir_abs_pf" \
			;


			[[ -z "$src_pf__" ]] \
			&& spairaru \
				ppt \
					ivk \
						GnlIdvAtnx \
						--atn "init" \
						\
						--stt $_rslt \
						\
						--cat "tree" \
						--pf "$_dst" \
						--ttl "$_env_vbo_ttl" \
			|| spairaru \
				ppt \
					ivk \
						FsXfrlAtnx \
						--atn "dwld" \
						\
						--stt $_rslt \
						\
						--src_cat "tree" \
						--src_pf "$src_pf__" \
						--src_ttl "$_env_vbo_ttl" \
						\
						--dst_cat "tree" \
						--dst_pf "$_dst" \
						--dst_ttl "$_env_vbo_ttl" \
			;


		fi ;


		# POST PROCESS : REPORT STATUS --------

		[[ $_rslt =~ ^(2|3)$ ]] \
		&& return $tru \
		|| return $_rslt \
		;


	} ;



# ======================================================================================
# OPTIMIZE
# ======================================================================================
	GitTrCtlr__optmz() {


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


		# NAMED ARGUMENT --------

		# [ named_arguments ]
		local -A _nax=` \
			spairaru \
				cbl \
					nax \
						--nm "name" \
						--nm-nov 1 \
						\
						--eml "email" \
						--eml-nov 1 \
		` ;


		# [ name ]
		local nm="${_nax[nm]}" ;

		# [ email ]
		local eml="${_nax[eml]}" ;


		# MAIN PROCESS : GLOBAL --------

		GitCtlr \
			optmz \
		;


		# MAIN PROCESS : LOCAL --------

		# - git is initiated
		if GitTrCtlr__hsInitd ;
		then


			# USER

			# 1 ) Email

			[[ \
				"$eml" \
				&& ! "` \
					GitPrflCtlr \
						cfg \
							"user.email" \
				`" \
			]] \
			&& GitPrflCtlr \
				cfg \
					"user.email" \
					"$eml" \
			;


			# 2 ) Name

			[[ \
				"$nm" \
				&& ! "` \
					GitPrflCtlr \
						cfg \
							"user.name" \
				`" \
			]] \
			&& GitPrflCtlr \
				cfg \
					"user.name" \
					"$nm" \
			;


		fi ;


		# POST PROCESS : REPORT STATUS --------

		return $tru ;


	} ;



# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# VERSIONING STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# CURRENT BRANCH
# ======================================================================================
	GitTrCtlr__cb() {

		git \
			"${_git_t1_nax[@]}" \
			branch \
			--show-current \
		;

	} ;



# ======================================================================================
# MARK
# ======================================================================================
	GitTrCtlr__mrk() {


		# [ arguments ]
		local _ax=("$@") ;

		# [ result ]
		local _rslt=$tru ;

		# [ git_tier_2_named_options ]
		local -a _git_t2_noptx ;


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

		# [ paths ]
		local -a _pfx=` \
			spairaru \
				cbl \
					pax \
		` ;


		# NAMED ARGUMENT --------

		# [ named_arguments ]
		local -A _nax=` \
			spairaru \
				cbl \
					nax \
						--msg "message" \
						--msg-nov 1 \
		` ;


		# [ message ]
		local msg="${_nax[msg]}" ;


		# PRECHECK : CONDITION --------

		# - no changes detected.
		if ! GitTrCtlr__hsChg ;
		then


			[[ $env_vbo == $tru ]] \
			&& spairaru \
				ppt \
					ivk \
						DfltAcpt \
						"no changes need to address." \
			;


			return $fls ;


		fi ;


		# MAIN PROCESS : STAGE --------

		[[ $env_vbo == $tru ]] \
		&& echo "" \
		;


		# v 			: verbose
		[[ $env_vbo == $tru ]] \
		&& _git_t2_noptx+=(-v) \
		;


		# A ) LIMIT FILES

		if [[ "${_pfx[@]}" ]] ;
		then 

			# grab uncommented files.
			# C 			: primary git directory
			# 1 			: command
			# --
			# v 			: verbose
			# 1+ 			: file paths
			spairaru \
				ppt \
					ivk \
						DfltBlkStrm \
						git \
							"${_git_t1_nax[@]}" \
							add \
								"${_git_t2_noptx[@]}" \
								"${_pfx[@]}" \
			;


		# B ) ALL FILES

		else 

			# grab uncommented files.
			# C 			: primary git directory
			# 1 			: command
			# --
			# A 			: all files
			# v 			: verbose
			spairaru \
				ppt \
					ivk \
						DfltBlkStrm \
						git \
							"${_git_t1_nax[@]}" \
							add \
								-A \
								"${_git_t2_noptx[@]}" \
			;


		fi ;


		[[ $env_vbo == $tru ]] \
		&& echo "" \
		;


		# MAIN PROCESS : COMMENT --------

		# q 			: quiet
		[[ $env_vbo != $tru ]] \
		&& _git_t2_noptx+=(-q) \
		;


		# add comment to above.
		# C 			: primary git directory
		# 1 			: command 
		# --
		# a 			: all
		# m 			: message
		# q 			: quite
		# v 			: verbose
		spairaru \
			ppt \
				ivk \
					DfltBlkStrm \
					git \
						"${_git_t1_nax[@]}" \
						commit \
							-a \
							-m "$msg" \
							--allow-empty-message \
							"${_git_t2_noptx[@]}" \
		;

		_rslt=$? ;


		[[ $env_vbo == $tru ]] \
		&& echo "" \
		;


		# POST PROCESS : OUTPUT MESSAGE --------

		if [[ $env_vbo == $tru ]] ;
		then 


			# A ) Status : 0

			if [[ $_rslt == $tru ]] ;
			then

				spairaru \
					ppt \
						ivk \
							DfltAcpt \
							"all changes have addressed." \
				;


			# B ) Status : 1

			elif [[ $_rslt == $fls ]] ;
			then

				spairaru \
					ppt \
						ivk \
							DfltRej \
							"failed to address changes." \
				;

			fi ;


		fi ;



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


	# [ method ]
	local mtd__="${_pax[0]}" ;


	# MAGIC PROCESS : PATH --------

	# - action is path
	[[ $mtd__ =~ ^(pf|path)$ ]] \
	&& echo "$dir_abs_pf" \
	&& return $tru \
	;


	# PRE PROCESS : DIRECTORY --------

	[[ \
		! -d "$dir_abs_pf" \
		&& $nfc == $tru \
	]] \
	&& mkdir \
		-p \
		"$dir_abs_pf" \
	;


	# MAIN PROCESS : METHOD --------

	# [ method ]
	local _mtd ;


	case "$mtd__" in


		# CONFIGURATIVE

		init | initiate ) _mtd=GitTrCtlr__init ;;


		# REPOSITORY

		mod | module ) _mtd=GitModCtlr ;;

		modx | modules ) _mtd=GitModxCtlr ;;

		rmt | remote ) _mtd=GitRmtCtlr ;;


		# STATEFUL

		hsInitd | hasInitiated ) _mtd=GitTrCtlr__hsInitd ;;

		hsChg | hasChange ) _mtd=GitTrCtlr__hsChg ;;


		# VERSIONING

		cb | cbrnh | currentBranch ) _mtd=GitTrCtlr__cb ;;

		brnh | branch ) _mtd=GitBrnhCtlr ;;

		mg | merge ) _mtd=GitTrCtlr__mg ;;

		mrk | mark ) _mtd=GitTrCtlr__mrk ;;

		sync | synchronize ) _mtd=GitSyncCtlr ;;

		tag ) _mtd=GitTagCtlr ;;


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


} ;
