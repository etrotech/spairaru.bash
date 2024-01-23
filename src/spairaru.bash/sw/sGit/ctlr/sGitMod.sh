#!/usr/bin/env bash
# ######################################################################################
# GIT MODULE CONTROLLER UTILITY GROUP
# ######################################################################################
GitModCtlr() {


# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# CORE STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# ADD
# ======================================================================================
	GitModCtlr__ad() {


		# [ result ]
		local _rslt=$tru ;

		# [ git_tier_2_named_options ]
		local -a _git_t2_noptx ;


		# POSITIONED ARGUMENT --------

		# [ address ]
		local addr__="${_pax[2]}" ;


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

		# - if module lable found.
		if [[ "` \
			git \
				"${_git_t1_nax[@]}" \
				config \
				--file .gitmodules \
				--get-regexp path \
			| sed 's/^.*\s//' \
			| grep \
				"$lbl__" \
		`" ]] ;
		then

			_rslt=2 ;


		else 


			# 1 ) Register Submodule

			[[ $env_vbo == $tru ]] \
			&& echo "" \
			;


			# q 			: quiet
			[[ $env_vbo != $tru ]] \
			&& _git_t2_noptx+=(-q) \
			;


			# C 		: git directory
			# 1 			: command category
			# --
			# 1 			: command 
			# --
			# f 			: force
			# 1 			: remote repository url
			# 2 			: module git directory
			spairaru \
				ppt \
					ivk \
						DfltBlkStrm \
						git \
							"${_git_t1_nax[@]}" \
							submodule \
								add \
									-f \
									"${_git_t2_noptx[@]}" \
									"$addr__" \
									"$lbl__" \
			;

			_rslt=$? ;


			[[ $env_vbo == $tru ]] \
			&& echo "" \
			;


			# 2 ) Enable SparseCheckout

			# C 			: primary git directory
			# 1 			: command 
			# --
			# 1 			: attribute name
			# 2 			: attribute value
			spairaru \
				ppt \
					ivk \
						DfltBlkStrm \
						git \
							-C "${dir_abs_pf}/${lbl__}" \
							config \
								core.sparseCheckout true \
			;


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
					--cat "module" \
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
	GitModCtlr__dl() {

		...

	} ;



# ======================================================================================
# HAS
# ======================================================================================
	GitModCtlr__hs() {


		[[ "`GitModCtlr__lst`" =~ "$lbl__" ]] \
		&& return $tru \
		|| return $fls \
		;


	} ;



# ======================================================================================
# LIST
# ======================================================================================
	GitModCtlr__lst() {


		# C 			: primary git directory
		# 1 			: command 
		# --file 		
		# --get-regexp 	
		git \
			"${_git_t1_nax[@]}" \
			config \
				--file .gitmodules \
				--get-regexp path \
		| sed \
			's/^.*\s//' \
		;


		return $? ;


	} ;



# ======================================================================================
# UPDATE
# ======================================================================================
	GitModCtlr__upd() {


		# [ result ]
		local _rslt=$tru ;

		# [ git_tier_2_named_options ]
		local -a _git_t2_noptx ;


		# MAIN PROCESS : UPDATE --------

		# A ) Module Exists

		if [[ "`GitModCtlr__lst`" =~ "$lbl__" ]] ;
		then

			
			# [ module_path ]
			local _mod_pf="${dir_abs_pf}/${lbl__}" ;


			# i ) Changes Detected

			if [[ "` \
				git \
					-C "${_mod_pf}" \
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
								-C "${_mod_pf}" \
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
					--cat "module" \
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
					--pos "1st" \
		;


		return $fls ;


	fi ;


	# MAIN PROCESS : METHOD --------

	# [ action ]
	local _atn=;


	case "$atn__" in


		ad | add ) _atn=GitModCtlr__ad ;;

		dl | delete ) _atn=GitModCtlr__dl ;;

		hs | has ) _atn=GitModCtlr__hs ;;

		lst | list ) _atn=GitModCtlr__lst ;;

		upd | update ) _atn=GitModCtlr__upd ;;


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
