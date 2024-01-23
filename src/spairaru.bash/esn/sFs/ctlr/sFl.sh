#!/usr/bin/env bash
# ######################################################################################
# FILE CONTROLLER UTILITY GROUP
# ######################################################################################
FlCtlr() {


# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# FILE SYSTEM STATIC PUBLIC PROPERTY
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	# [ path ]
	local __pf__ ;



# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# STATEFUL STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# EXIST
# ======================================================================================
	FlCtlr__ex() {


		# [ arguments ]
		local -a _ax=("$@") ;


		# POSITIONED ARGUMENT --------

		# [ positoined_arguments ]
		local -a _pax=` \
			s_gtCblPax \
		` ;


		# [ path ]
		local __pf__="${_pax[0]}" ;


		# MAIN PROCESS : DETERMINATION --------

		[[ -z "${__pf__}" ]] \
		&& return $fls \
		;


		[[ -f "${__pf__}" ]] \
		&& return $tru \
		|| return $fls \
		;


	} ;



# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# MANIPULATIVE STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# COPY
# ======================================================================================
	FlCtlr__cp() {


		# [ arguments ]
		local -a _ax=("$@") ;

		# [ result ]
		local _rslt=$tru ;


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
			s_gtCblPax \
		` ;


		# [ source_path ]
		local src_pf__="${_pax[0]}" ;

		# [ destination_path ]
		local dst_pf__="${_pax[1]}" ;


		# PRECHECK : SOURCE PATH --------

		if [[ -z "$src_pf__" ]] ;
		then


			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_CblMpa \
				"${ANSI_F_PR}`__ "source"`${_ANSI} `__ "path"`" \
				--pos "1st" \
			;


			return $fls ;


		fi ;


		# PRECHECK : DESTINATION PATH --------

		if [[ -z "$dst_pf__" ]] ;
		then


			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_CblMpa \
				"${ANSI_F_PR}`__ "destination"`${_ANSI} `__ "path"`" \
				--pos "2nd" \
			;


			return $fls ;


		fi ;


		# MAIN PROCESS : CREATE LINK --------

		# - source path not exists
		if \
			! FlCtlr__ex \
				"$src_pf__" \
		;
		then

			_rslt=2 ;


		# - destination path already exists
		# - enforce is not enabled
		elif \
			FlCtlr__ex \
				"$dst_pf__" \
			&& [[ $nfc != $tru ]] \
		;
		then

			_rslt=3 ;


		# - otherwise
		else


			# [ copy_named_options ]
			local -a _cp_noptx ;


			[[ $nfc == $tru ]] \
			&& _cp_noptx+=(-f) \
			;


			# f 			: force
			# v 			: verbose
			# 1 			: source path
			# 2 			: target path
			cp \
				"${_cp_noptx[@]}" \
				"$src_pf__" \
				"$dst_pf__" \
			;

			_rslt=$? ;


		fi ;


		# POST PROCESS : OUTPUT MESSAGE --------

		[[ $env_vbo == $tru ]] \
		&& s_ivkPptTpl_FsXfrlAtnx \
			--atn "cp" \
			\
			--stt $_rslt \
			\
			--src_cat "file" \
			--src_pf "$src_pf__" \
			--src_ttl "$vbo_ttl" \
			\
			--dst_cat "file" \
			--dst_pf "$dst_pf__" \
			--dst_ttl "$vbo_ttl" \
		;


		# POST PROCESS : REPORT STATUS --------

		if [[ $_rslt =~ ^(2)$ ]] ;
		then

			return $fls ;


		elif [[ $_rslt =~ ^(3)$ ]] ;
		then

			return $tru ;


		else

			return $_rslt ;


		fi ;


	} ;



# ======================================================================================
# LINK
# ======================================================================================
	FlCtlr__lnk() {


		# [ arguments ]
		local -a _ax=("$@") ;

		# [ result ]
		local _rslt=$tru ;


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
			s_gtCblPax \
		` ;


		# [ source_path ]
		local src_pf__="${_pax[0]}" ;

		# [ destination_path ]
		local dst_pf__="${_pax[1]}" ;


		# PRECHECK : SOURCE PATH --------

		if [[ -z "$src_pf__" ]] ;
		then


			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_CblMpa \
				"${ANSI_F_PR}`__ "source"`${_ANSI} `__ "path"`" \
				--pos "1st" \
			;


			return $fls ;


		fi ;


		# PRECHECK : DESTINATION PATH --------

		if [[ -z "$dst_pf__" ]] ;
		then


			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_CblMpa \
				"${ANSI_F_PR}`__ "destination"`${_ANSI} `__ "path"`" \
				--pos "2nd" \
			;


			return $fls ;


		fi ;


		# MAIN PROCESS : CREATE LINK --------

		# - source path not exists
		if \
			! FlCtlr__ex \
				"$src_pf__" \
		;
		then

			_rslt=2 ;


		# - destination path already exists
		# - enforce is not enabled
		elif \
			FlCtlr__ex \
				"$dst_pf__" \
			&& [[ $nfc != $tru ]] \
		;
		then

			_rslt=3 ;


		# - otherwise
		else


			# [ link_named_options ]
			local -a _ln_noptx ;


			[[ $nfc == $tru ]] \
			&& _ln_noptx+=(-f) \
			;


			# f : force
			# 1 : source file
			# 2 : target file
			ln \
				"${_ln_noptx[@]}" \
				"$src_pf__" \
				"$dst_pf__" \
			;

			_rslt=$? ;


		fi ;


		# POST PROCESS : OUTPUT MESSAGE --------

		[[ $env_vbo == $tru ]] \
		&& s_ivkPptTpl_FsXfrlAtnx \
			--atn "lnk" \
			\
			--stt $_rslt \
			\
			--src_cat "file" \
			--src_pf "$src_pf__" \
			--src_ttl "$vbo_ttl" \
			\
			--dst_cat "file" \
			--dst_pf "$dst_pf__" \
			--dst_ttl "$vbo_ttl" \
		;


		# POST PROCESS : REPORT STATUS --------

		if [[ $_rslt =~ ^(2)$ ]] ;
		then

			return $fls ;


		elif [[ $_rslt =~ ^(3)$ ]] ;
		then

			return $tru ;


		else

			return $_rslt ;


		fi ;


	} ;



# ======================================================================================
# MAKE
# ======================================================================================
	FlCtlr__mk() {


		# [ arguments ]
		local -a _ax=("$@") ;

		# [ result ]
		local _rslt=$tru ;


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


		# PRECHECK : PATH --------

		if [[ -z "$__pf__" ]] ;
		then


			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_CblMpa \
				"path" \
				--pos "1st" \
			;


			return $fls ;


		fi ;


		# MAIN PROCESS : CREATE FILE --------

		# - path not exists
		if \
			! FlCtlr__ex \
				"$__pf__" \
		;
		then


			! s \
				fldr \
					ex \
						"${__pf__%/*}" \
			&& s \
				fldr \
					mk \
						"${__pf__%/*}" \
						"${_optx[@]}" \
			;


			touch \
				"${__pf__}" \
			;


			_rslt=$? ;


		# - otherwise
		else 

			_rslt=2 ;


		fi ;


		# POST PROCESS : DISPLAY MESSAGE --------

		[[ $env_vbo == $tru ]] \
		&& s_ivkPptTpl_FsIoAtnx \
			--atn "mk" \
			--stt $_rslt \
			--src_cat "file" \
			--src_ico "fl" \
			--src_ttl "$vbo_ttl" \
			--src_pf "$__pf__" \
		;


		# POST PROCESS : REPORT STATUS --------

		[[ $_rslt == 2 ]] \
		&& return $tru \
		|| return $_rslt \
		;


	} ;



# ======================================================================================
# MOVE
# ======================================================================================
	FlCtlr__mv() {


		# [ arguments ]
		local -a _ax=("$@") ;

		# [ result ]
		local _rslt=$tru ;


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
			s_gtCblPax \
		` ;


		# [ source_path ]
		local src_pf__="${_pax[0]}" ;

		# [ destination_path ]
		local dst_pf__="${_pax[1]}" ;


		# PRECHECK : SOURCE PATH --------

		if [[ -z "$src_pf__" ]] ;
		then


			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_CblMpa \
				"${ANSI_F_PR}`__ "source"`${_ANSI} `__ "path"`" \
				--pos "1st" \
			;


			return $fls ;


		fi ;


		# PRECHECK : DESTINATION PATH --------

		if [[ -z "$dst_pf__" ]] ;
		then


			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_CblMpa \
				"${ANSI_F_PR}`__ "destination"`${_ANSI} `__ "path"`" \
				--pos "2nd" \
			;


			return $fls ;


		fi ;


		# MAIN PROCESS : MOVE FILE --------

		# - source path not exists
		if \
			! FlCtlr__ex \
				"$src_pf__" \
		;
		then

			_rslt=2 ;


		# - destination path already exists
		elif \
			FlCtlr__ex \
				"$dst_pf__" \
		;
		then

			_rslt=3 ;


		# - otherwise
		else 

			mv \
				"$src_pf__" \
				"$dst_pf__" \
			;

			_rslt=$? ;


		fi ;


		# POST PROCESS : DISPLAY MESSAGE --------

		[[ $env_vbo == $tru ]] \
		&& s_ivkPptTpl_FsXfrlAtnx \
			--atn "mv" \
			--stt $_rslt \
			\
			--src_pf "$src_pf__" \
			--src_ttl "$vbo_ttl" \
			\
			--dst_pf "$dst_pf__" \
			--dst_ttl "$vbo_ttl" \
		;


		# POST PROCESS : REPORT STATUS --------

		# Status ) 2

		if [[ $_rslt == 2 ]] ;
		then

			return $fls ;


		# Status ) 3

		elif [[ $_rslt == 3 ]] ;
		then

			return $tru ;


		# Otherwise

		else

			return $_rslt ;


		fi ;


	} ;



# ======================================================================================
# REMOVE
# ======================================================================================
	FlCtlr__rm() {


		# [ arguments ]
		local -a _ax=("$@") ;

		# [ result ]
		local _rslt=$tru ;


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


		# PRECHECK : PATH --------

		if [[ -z "$__pf__" ]] ;
		then


			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_CblMpa \
				"path" \
				--pos "1st" \
			;


			return $fls ;


		fi ;


		# MAIN PROCESS : REMOVE FILE --------

		# - path exists
		if \
			FlCtlr__ex \
				"${__pf__}" \
		;
		then


			# [ options ]
			local -a _optx ;


			[[ $nfc == $tru ]] \
			&& _optx+=(-f) \
			;


			rm \
				"${_optx[@]}" \
				"$__pf__" \
			;

			_rslt=$? ;


		# - otherwise
		else 

			_rslt=2 ;


		fi ;


		# POST PROCESS : DISPLAY MESSAGE --------

		[[ $env_vbo == $tru ]] \
		&& s_ivkPptTpl_FsIoAtnx \
			--atn "rm" \
			--stt $_rslt \
			--src_cat "file" \
			--src_ico "fl" \
			--src_ttl "$vbo_ttl" \
			--src_pf "$__pf__" \
		;


		# POST PROCESS : REPORT STATUS --------

		[[ $_rslt == 2 ]] \
		&& return $tru \
		|| return $_rslt \
		;


	} ;



# ======================================================================================
# SYNC
# ======================================================================================
	FlCtlr__sync() {


		# [ arguments ]
		local -a _ax=("$@") ;

		# [ result ]
		local _rslt=$tru ;


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
			s_gtCblPax \
		` ;


		# [ source_path ]
		local src_pf__="${_pax[0]}" ;

		# [ destination_path ]
		local dst_pf__="${_pax[1]}" ;


		# PRECHECK : SOURCE PATH --------

		if [[ -z "$src_pf__" ]] ;
		then


			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_CblMpa \
				"${ANSI_F_PR}`__ "source"`${_ANSI} `__ "path"`" \
				--pos "1st" \
			;


			return $fls ;


		fi ;


		# PRECHECK : DESTINATION PATH --------

		if [[ -z "$dst_pf__" ]] ;
		then


			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_CblMpa \
				"${ANSI_F_PR}`__ "destination"`${_ANSI} `__ "path"`" \
				--pos "2nd" \
			;


			return $fls ;


		fi ;


		# MAIN PROCESS : CREATE LINK --------

		# - source path not exists
		if \
			! FlCtlr__ex \
				"$src_pf__" \
		;
		then

			_rslt=2 ;


		# - otherwise
		else


			[[ $env_vbo == $tru ]] \
			&& echo "" \
			;


			# [ copy_named_options ]
			local -a _cp_noptx ;


			[[ $nfc == $tru ]] \
			&& _cp_noptx+=(-f) \
			;


			# f 			: force
			# u 			: update
			# v 			: verbose
			# 1 			: source path
			# 2 			: target path
			cp \
				"${_cp_noptx[@]}" \
				-u \
				"$src_pf__" \
				"$dst_pf__" \
			;

			_rslt=$? ;


			[[ $env_vbo == $tru ]] \
			&& echo "" \
			;


		fi ;


		# POST PROCESS : OUTPUT MESSAGE --------

		[[ $env_vbo == $tru ]] \
		&& s_ivkPptTpl_FsXfrlAtnx \
			--atn "sync" \
			\
			--stt $_rslt \
			\
			--src_cat "file" \
			--src_pf "$src_pf__" \
			--src_ttl "$vbo_ttl" \
			\
			--dst_cat "file" \
			--dst_pf "$dst_pf__" \
			--dst_ttl "$vbo_ttl" \
		;


		# POST PROCESS : REPORT STATUS --------

		[[ $_rslt == 2 ]] \
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
		s_gtCblPax \
	` ;


	# [ method ]
	local mtd__="${_pax[0]}" ;

	# [ path ]
	__pf__="${_pax[1]}" ;


	# NAMED ARGUMENT --------

	# [ named_arguments ]
	local -A _nax=` \
		s_gtCblNax \
			--nfc "f" "enforce" \
			\
			--vbo_ttl "vt" "verbose_title" \
			--vbo_ttl-nov 1 \
	` ;


	# [ enforce ]
	local nfc="${_nax[nfc]}" ;

	# [ verbose_title ]
	local vbo_ttl="${_nax[vbo_ttl]}" ;


	# MAIN PROCESS : METHOD --------

	# - method is set
	if [[ "$mtd__" ]] ;
	then


		# [ controller ]
		local _Ctlr ;

		# [ method ]
		local _mtd ;


		case "$mtd__" in


			# ACCESS CONTROLL 

			onr | owner ) _Ctlr=FsAbs ;;

			perm | link ) _Ctlr=FsAbs ;;


			# MANIPULATIVE

			cp | copy ) _mtd=FlCtlr__cp ;;

			lnk | link ) _mtd=FlCtlr__lnk ;;

			mk | make ) _mtd=FlCtlr__mk ;;

			mv | move ) _mtd=FlCtlr__mv ;;

			rm | remove ) _mtd=FlCtlr__rm ;;

			sync | synchronize ) _mtd=FlCtlr__sync ;;


			# STATEFUL

			ex | exists ) _mtd=FlCtlr__ex ;;


		esac ;


		# - controller is not empty
		if [[ "$_Ctlr" ]] ;
		then


			"$_Ctlr" \
				"$@" \
			;


			return $? ;


		# - method is not empty
		elif [[ "$_mtd" ]] ;
		then


			shift 1 \
			&& "$_mtd" \
				"$@" \
			;


			return $? ;


		fi ;


	fi ;


	# POST PROCESS : REPORT STATUS --------

	return $fls ;


} ;
