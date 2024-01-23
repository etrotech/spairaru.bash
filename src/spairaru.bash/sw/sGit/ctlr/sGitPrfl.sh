#!/usr/bin/env bash
# ######################################################################################
# GIT PROFILE CONTROLLER UTILITY GROUP
# ######################################################################################
GitPrflCtlr() {


# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ALTERNATIVE STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# COMMENT OUT
# 
# Description:
# 	Add comment remark to target lanes in cofiguration file.
#
# ======================================================================================
	GitPrflCtlr__co() {


		# MAIN PROCESSES --------

	spairaru \
			doc \
				co \
					$prfl_fl_abs_pf \
					"$@" \
		;


		# POST PROCESS : REPORT STATUS --------

		return $? ;


	} ;



# ======================================================================================
# UNCOMMENT
# 
# Description:
# 	Remove comment remark from target lanes in cofiguration file.
#
# ======================================================================================
	GitPrflCtlr__uc() {


		# MAIN PROCESSES --------

	spairaru \
			doc \
				uc \
					$prfl_fl_abs_pf \
					"$@" \
		;


		# POST PROCESS : REPORT STATUS --------

		return $? ;


	} ;



# ======================================================================================
# REMARK
# 
# Description:
# 	Add or Remove remarks in cofiguration file.
#
# ======================================================================================
	GitPrflCtlr__rmrk() {


		# MAIN PROCESSES --------

	spairaru \
			doc \
				rmrk \
					$prfl_fl_abs_pf \
					"$@" \
		;


		# POST PROCESS : REPORT STATUS --------

		return $? ;


	} ;



# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# CORE STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# CONFIGURE
# 
# Description:
# 	Add or Remove key in cofiguration file.
#
# ======================================================================================
	GitPrflCtlr__cfg() {


		# [ arguments ]
		local -a _ax=("$@") ;

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

		# [ positoined_arguments ]
		local -a _pax=` \
			spairaru \
				cbl \
					pax \
		` ;


		# [ key ]
		local ky__="${_pax[0]}" ;

		# [ value ]
		local vlu__="${_pax[1]}" ;


		# NAMED ARGUMENT --------

		# [ named_arguments ]
		local -A _nax=` \
			spairaru \
				cbl \
					nax \
						--mx "mutiple" \
		` ;


		# [ mutiple ]
		local mx="${_nax[mx]}" ;



		# PRE PROCESS : ACTION --------

		# [ action ]
		local _atn=;


		[[ \
			! "$atn" \
			&& "$vlu__" \
		]] \
		&& _atn="ad" \
		|| _atn="qry" \
		;


		# PRECHECK : KEY --------

		if [[ -z "$ky__" ]] ;
		then 


			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_CblMpa \
				"Configuration Key" \
				--pos "1st" \
			;


			return $fls ;


		fi ;


		# PRECHECK : VALUE --------

		if [[ \
			$_atn == "ad" \
			&& -z "$vlu__" \
		]] ;
		then 


			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_CblMpa \
				"Configuration Value" \
				--pos "2nd" \
			;


			return $fls ;


		fi ;


		# PRE PROCESS : SCOPE --------

		if [[ $prfl_scp == "dflt" ]] ;
		then

			_git_t2_noptx+=(--system) ;


		elif [[ $prfl_scp == "glo" ]] ;
		then

			_git_t2_noptx+=(--global) ;


		fi ;


		# MAIN PROCESS : EDIT PROFILE --------

		if [[ $_atn == "ad" ]] ;
		then

			# i ) Relocation Rule Exists

			if [[ \
				"` \
					git \
						"${_git_t1_noptx[@]}" \
						config \
							"${_git_t2_noptx[@]}" \
							--get \
							"$ky__" \
						2>/dev/null \
				`" \
				&& $mx != $tru \
			]] ;
			then

				_rslt=2 ;


			# ii ) Relocation Rule not Exists
			else

				git \
					"${_git_t1_noptx[@]}" \
					config \
						"${_git_t2_noptx[@]}" \
						--add \
						"$ky__" \
						"$vlu__" \
				;

				_rslt=$? ;


			fi ;


		elif [[ $_atn == "dl" ]] ;
		then

			# i ) Relocation Rule Exists

			if `\
				git \
					"${_git_t1_noptx[@]}" \
					config \
						"${_git_t2_noptx[@]}" \
						--get \
						"$ky__" \
					&>/dev/null \
			` ;
			then


				[[ $mx == $tru ]] \
				&& _git_t2_noptx+=(--unset-all) \
				|| _git_t2_noptx+=(--unset) \
				;


				git \
					"${_git_t1_noptx[@]}" \
					config \
						"${_git_t2_noptx[@]}" \
						"$ky__" \
				;

				_rslt=$? ;


			# ii ) Relocation Rule not Exists
			else

				_rslt=2 ;


			fi ;


		else


			[[ $mx == $tru ]] \
			&& _git_t2_noptx+=(--get-all) \
			|| _git_t2_noptx+=(--get) \
			;


			git \
				"${_git_t1_noptx[@]}" \
				config \
					"${_git_t2_noptx[@]}" \
					"$ky__" \
			;


			_rslt=$? ;


		fi ;


		# POST PROCESS : DISPLAY MESSAGE --------

		# - action is not query
		# - verbose is enabled
		[[ \
			$_atn != "qry" \
			&& $env_vbo == $tru \
		]] \
		&& spairaru \
			ppt \
				ivk \
					DocMnpAtnx \
					--atn $_atn \
					\
					--stt $_rslt \
					\
					--tgt_cat "key" \
					--tgt_ttl "$ky__" \
					\
					--doc_cat "profile" \
					--doc_ttl "$_prfl_ttl" \
					--doc_pf "$prfl_fl_abs_pf" \
		;


		# POST PROCESS : REPORT STATUS --------

		[[ $_rslt =~ ^(2)$ ]] \
		&& return $tru \
		|| return $_rslt \
		;


	} ;



# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# I/O STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# ERASE
# 
# Description:
# 	Remove lanes from cofiguration file.
#
# ======================================================================================
	GitPrflCtlr__ers() {


		# MAIN PROCESSES --------

	spairaru \
			doc \
				ers \
					"$prfl_fl_abs_pf" \
					"$@" \
		;


		# POST PROCESS : REPORT STATUS --------

		return $?


	} ;



# ======================================================================================
# WRITE
# 
# Description:
# 	Add lanes to cofiguration file.
#
# ======================================================================================
	GitPrflCtlr__wrt() {


		# MAIN PROCESSES --------

	spairaru \
			doc \
				wrt \
					"$prfl_fl_abs_pf" \
					"$@" \
		;


		# POST PROCESS : REPORT STATUS --------

		return $?


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
		spairaru \
				cbl \
					pax \
	` ;


	# [ method ]
	local mtd__="${_pax[0]}" ;


	# NAMED ARGUMENT --------

	# [ named_arguments ]
	local -A _nax=` \
		spairaru \
			cbl \
				nax \
					--prfl_fl_abs_pf "pf" "path" \
					--prfl_fl_abs_pf-nov 1 \
					\
					--prfl_scp "scp" "scope" \
					--prfl_scp-nov 1 \
					--prfl_scp-opt-dflt "dflt" "defalt" \
					--prfl_scp-opt-glo "glo" "global" \
					\
					--atn "action" \
					--atn-nov 1 \
					--atn-opt-ad "ad" "add" \
					--atn-opt-rm "rm" "remove" \
					--atn-opt-qry "qry" "query" \
	` ;


	# [ profile_file_absolute_path ]
	local prfl_fl_abs_pf="${_nax[prfl_fl_abs_pf]}" ;

	# [ profile_scope ]
	local prfl_scp="${_nax[prfl_scp]}" ;

	# [ action ]
	local atn="${_nax[atn]}" ;


	# PRE PROCESS : PROFILE PATH --------

	[[ -z "$prfl_fl_abs_pf" ]] \
	&& prfl_fl_abs_pf="` \
		s_gtGitPrflPf \
			"$@" \
			--dir "$dir_abs_pf" \
	`" \
	;


	# MAGIC PROCESS : PATH --------

	# - action is path
	[[ $mtd__ =~ ^(pf|path)$ ]] \
	&& echo "$prfl_fl_abs_pf" \
	&& return $tru \
	;


	# PRE PROCESS : PROFILE SCOPE --------

	# - profile_path is giving
	# - profile_scope is not giving
	if [[ \
		-n "$prfl_fl_abs_pf" \
		&& -z "$prfl_scp" \
	]] ;
	then

		# [ scope ]
		for scp in "sys" "glo" ;
		do

			[[
				"` \
				s_gtGitPrflPf \
					--scp $scp \
				`" \
				== "$prfl_fl_abs_pf" \
			]] \
			&& prfl_scp="$scp" \
			;

		done ;

	fi ;


	[[ -z "$prfl_scp" ]] \
	&& prfl_scp="cstm" \
	;


	# PRE PROCESS : PROFILE TITLE --------

	# [ profile_title ]
	local _prfl_ttl="` \
		s_gtPrflTtl \
			"$prfl_scp" \
	`" ;


	# PRE PROCESS : GIT OPTIONS --------

	# [ git_tier1_named_arguments ]
	local -a _git_t1_noptx ;


	# - directory is set
	[[ -n "$dir_abs_pf" ]] \
	&& _git_t1_noptx+=(-C "$dir_abs_pf") \
	;


	# PRE PROCESS : DOCUMENT OPTIONS --------

	# [ document_options ]
	local -a _doc_optx=` \
		s_gtDocOptx \
			"$@" \
	` ;


	# PRECHECK : PROFILE EXISTENCE --------

	if [[ ! -f "$prfl_fl_abs_pf" ]] ;
	then


		[[ $env_vbo == $tru ]] \
		&& s_ivkPptTpl_DfltRej \
			"%s%s has not found." \
			"$_env_vbo_ttl" \
			"profile" \
		;


		return $fls ;


	fi ;


	# MAIN PROCESS : METHOD --------

	# [ method ]
	local _mtd ;


	case "$mtd__" in


		# ALTERNATIVE

		co | commentout ) _mtd=GitPrflCtlr__co ;;

		uc | uncomment ) _mtd=GitPrflCtlr__uc ;;

		rmrk | remark ) _mtd=GitPrflCtlr__rmrk ;;


		# CORE

		cfg | configure ) _mtd=GitPrflCtlr__cfg ;;


		# I/O

		ers | erase ) _mtd=GitPrflCtlr__ers ;;

		wrt | write ) _mtd=GitPrflCtlr__wrt ;;


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
