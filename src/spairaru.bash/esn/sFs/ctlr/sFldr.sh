#!/usr/bin/env bash
# ######################################################################################
# FOLDER CONTROLLER UTILITY GROUP
# ######################################################################################
FldrCtlr() {


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
	FldrCtlr__ex() {


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


		[[ -d "${__pf__}" ]] \
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
	FldrCtlr__cp() {


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
			! FldrCtlr__ex \
				"$src_pf__" \
		;
		then

			_rslt=2 ;


		# - destination path already exists
		# - enforce is not enabled
		elif \
			FldrCtlr__ex \
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


			[[ $env_vbo == $tru ]] \
			&& _cp_noptx+=(-v) \
			;


			[[ $env_vbo == $tru ]] \
			&& echo "" \
			;


			# f 			: force
			# r 			: recursive
			# v 			: verbose
			# 1 			: source path
			# 2 			: target path
			s_ivkPptTpl_DfltBlkStrm \
				cp \
					"${_cp_noptx[@]}" \
					-r \
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
			--atn "cp" \
			\
			--stt $_rslt \
			\
			--src_cat "folder" \
			--src_pf "$src_pf__" \
			--src_ttl "$vbo_ttl" \
			\
			--dst_cat "folder" \
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
	FldrCtlr__lnk() {


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
			! FldrCtlr__ex \
				"$src_pf__" \
		;
		then

			_rslt=2 ;


		# - destination path already exists
		# - enforce is not enabled
		elif \
			FldrCtlr__ex \
				"$dst_pf__" \
			&& [[ $nfc != $tru ]] \
		;
		then

			_rslt=3 ;


		# - otherwise
		else


			# [ link_options ]
			local -a _ln_optx ;


			[[ $nfc == $tru ]] \
			&& _ln_optx+=(-f) \
			;


			# s : software
			# f : force
			# 1 : source file
			# 2 : target file
			ln \
				-s \
				"${_ln_optx[@]}" \
				"$src_pf__" \
				"$dst_pf__" \
			;

			_rslt=$? ;


		fi ;


		# POST PROCESS : DISPLAY MESSAGE --------

		[[ $env_vbo == $tru ]] \
		&& s_ivkPptTpl_FsXfrlAtnx \
			--atn "lnk" \
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
# MAKE
# ======================================================================================
	FldrCtlr__mk() {


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


		# MAIN PROCESS : CREATE FOLDER --------

		# - path not exists
		if \
			! FldrCtlr__ex \
				"$__pf__" \
		;
		then

			mkdir \
				-p \
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
			--src_cat "folder" \
			--src_ico "fldr" \
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
	FldrCtlr__mv() {


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


		# MAIN PROCESS : MOVE FOLDER --------

		# - source path not exists
		if \
			! FldrCtlr__ex \
				"$src_pf__" \
		;
		then

			_rslt=2 ;


		# - destination path already exists
		elif \
			FldrCtlr__ex \
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
	FldrCtlr__rm() {


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


		# PRE PROCESS : PATH --------

		if [[ -z "$__pf__" ]] ;
		then


			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_CblMpa \
				"path" \
				--pos "1st" \
			;


			return $fls ;


		fi ;



		# MAIN PROCESS : REMOVE FOLDER --------

		# - path exists
		if \
			FldrCtlr__ex \
				"${__pf__}" \
		;
		then


			# [ options ]
			local -a _optx ;


			[[ $nfc == $tru ]] \
			&& _optx+=(-f) \
			;


			rm \
				-r \
				"${_optx[@]}" \
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
			--atn "rm" \
			--stt $_rslt \
			--src_cat "folder" \
			--src_ico "fldr" \
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
	FldrCtlr__sync() {


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


		# NAMED ARGUMENT --------

		# [ named_arguments ]
		local -A _nax=` \
			s_gtCblNax \
				--lst "list" \
				\
				--icl "include" \
				--icl-nov 1 \
				--icl-xasgmt \
				\
				--xcl "exclude" \
				--xcl-nov 1 \
				--xcl-xasgmt \
		` ;


		# [ list ]
		local -a lst="${_nax[lst]}" ;

		# [ includes ]
		local -a iclx="${_nax[icl]}" ;

		# [ excludes ]
		local -a xclx="${_nax[xcl]}" ;


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


		# MAIN PROCESS : SYNC --------


		# - source path not exists
		if \
			! FldrCtlr__ex \
				"$src_pf__" \
		;
		then

			_rslt=2 ;


		# - otherwise
		else


			# [ rsync_named_option ]
			local -a _rsync_noptx ;


			# [ exclude ]
			for xcl in "${xclx[@]}" ;
			do

				_rsync_noptx+=(--exclude="${xcl// /\\ }") ;

			done ;


			[[ \
				"${iclx[@]}" \
				&& -z "${xclx[@]}" \
			]] \
			&& _rsync_noptx+=(--exclude='*') \
			;


			# [ include ]
			for icl in "${iclx[@]}" ;
			do

				_rsync_noptx+=(--include="${icl// /\\ }") ;

			done ;


			# - list call
			if [[ $lst == $tru ]] ;
			then

				# a 			: archive
				# n 			: dry-run
				# u 			: update only
				# v 			: verbose
				# 1 			: source path
				# 2 			: destination path

				# ▧ find
				# sent\s			: match sent and space
				# [0-9,]+			: match numbers with ,
				# \sbytes			: match space and bytes
				# (\n|\r\n)			: until the first linebreak, and capture to group 1
				# ▨ replace
				# 					: remove matched

				# ▧ find
				# (\n\n|\r\n\r\n) 	: match from dobule linebreaks
				# .*$ 				: match anything till the end
				# ▨ replace
				# 					: remove matched

				# ▧ find
				# \.\/				: match ./
				# (\n|\r\n)			: until the first linebreak, and capture to group 1
				# ▨ replace
				# 					: remove matched

				rsync \
					-anuv \
					"${_rsync_noptx[@]}" \
					"$src_pf__" \
					"$dst_pf__" \
				| sed \
					-rz \
					\
					-e 's/^.*(\n|\r\n)//m' \
					-e 's/sent\s[0-9,]+\sbytes.*$//g' \
					\
					-e 's/\.\/(\n|\r\n)//m' \
				;


			# - otherwise
			else


				[[ $env_vbo == $tru ]] \
				&& _rsync_noptx+=(-v) \
				|| _rsync_noptx+=(-q) \
				;


				[[ $env_vbo == $tru ]] \
				&& echo "" \
				;


				# a 			: archive
				# q 			: quite
				# u 			: update only
				# v 			: verbose
				# 1 			: source path
				# 2 			: destination path
				[[ $env_vbo == $tru ]] \
				&& s_ivkPptTpl_DfltBlkStrm \
					rsync \
						-au \
						"${_rsync_noptx[@]}" \
						"$src_pf__" \
						"$dst_pf__" \
				|| rsync \
					-au \
					"${_rsync_noptx[@]}" \
					"$src_pf__" \
					"$dst_pf__" \
				;


				[[ $env_vbo == $tru ]] \
				&& echo "" \
				;


			fi ;


		fi ;


		# POST PROCESS : OUTPUT MESSAGE --------

		[[ \
			$env_vbo == $tru \
			&& $lst != $tru \
		]] \
		&& s_ivkPptTpl_FsXfrlAtnx \
			--atn "sync" \
			\
			--stt $_rslt \
			\
			--src_cat "folder" \
			--src_pf "$src_pf__" \
			--src_ttl "$vbo_ttl" \
			\
			--dst_cat "folder" \
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

			cp | copy ) _mtd=FldrCtlr__cp ;;

			lnk | link ) _mtd=FldrCtlr__lnk ;;

			mk | make ) _mtd=FldrCtlr__mk ;;

			mv | move ) _mtd=FldrCtlr__mv ;;

			rm | remove ) _mtd=FldrCtlr__rm ;;

			sync | synchronize ) _mtd=FldrCtlr__sync ;;


			# STATEFUL

			ex | exists ) _mtd=FldrCtlr__ex ;;


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
