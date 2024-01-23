#!/usr/bin/env bash
# ######################################################################################
# FILE SYSTEM ABSTRACT UTILITY GROUP
# ######################################################################################
FsAbs() {


# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ACCESS CONTROLL STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# OWNER
# ======================================================================================
	FsAbs__ownr() {


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

		# [ user ]
		local usr__="${_pax[1]}" ;

		# [ group ]
		local grp__="${_pax[2]}" ;


		# PRECHECK : PATH --------

		if [[ \
			! -d "$src_pf__" \
			&& ! -f "$src_pf__" \
		]] ;
		then


			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_DfltRej \
				"%s does not exist." \
				"Path" \
			;


			return $fls ;


		fi ;


		# PRECHECK : USER --------

		if [[ ! "$usr__" ]] ;
		then


			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_CblMpa \
				"User" \
				--pos "2nd" \
			;


			return $fls ;


		fi ; 


		# MAIN PROCESS : BUILD OWNERHSIP --------

		# [ ownership ]
		local _os="$usr__" ;


		[[ "$grp__" ]] \
		&& _os="${_os}:${grp__}" \
		;


		# MAIN PROCESS : CHANGE PERMISSION --------

		# R 			: recursive
		chown \
			-R \
			"$_os" \
			"$src_pf__" \
		;

		_rslt=$? ;


		# POST PROCESS : DISPLAY MESSAGE --------

		# [ category ]
		local _cat ;


		[[ -d "$src_pf__" ]] \
		&& _cat="folder" \
		|| _cat="file" \
		;


		_cat="${_cat} ownership" ;


		[[ $env_vbo == $tru ]] \
		&& s_ivkPptTpl_GnlIdvAtnx \
			--atn "chg" \
			--stt $_rslt \
			\
			--cat "$_cat" \
			--pf "$src_pf__" \
			--ttl "$vbo_ttl" \
		;


		# POST PROCESS : REPORT STATUS --------

		return $_rslt ;


	} ;



# ======================================================================================
# PERMISSION
# ======================================================================================
	FsAbs__perm() {


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

		# [ permission ]
		local perm__="${_pax[1]}" ;


		# PRECHECK : PATH --------

		if [[ \
			! -d "$src_pf__" \
			&& ! -f "$src_pf__" \
		]] ;
		then


			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_DfltRej \
				"%s does not exist." \
				"Path" \
			;


			return $fls ;


		fi ;


		# PRECHECK : PERMISSION --------

		if [[ ! "$perm__" ]] ;
		then


			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_CblMpa \
				"Permission" \
				--pos "2nd" \
			;


			return $fls ;


		fi ; 


		# MAIN PROCESS : CHANGE PERMISSION --------

		chmod \
			"$perm__" \
			"$src_pf__" \
		;

		_rslt=$? ;


		# POST PROCESS : DISPLAY MESSAGE --------

		# [ category ]
		local _cat ;


		[[ -d "$src_pf__" ]] \
		&& _cat="folder" \
		|| _cat="file" \
		;


		_cat="${_cat} permission" ;


		[[ $env_vbo == $tru ]] \
		&& s_ivkPptTpl_GnlIdvAtnx \
			--atn "chg" \
			--stt $_rslt \
			\
			--cat "$_cat" \
			--pf "$src_pf__" \
			--ttl "$vbo_ttl" \
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
	local -a _ax=("$@") ;


	# POSITIONED ARGUMENT --------

	# [ positoined_arguments ]
	local -a _pax=` \
		s_gtCblPax \
	` ;


	# [ method ]
	local mtd__="${_pax[0]}" ;


	# MAIN PROCESS : METHOD --------

	# - method is set
	if [[ "$mtd__" ]] ;
	then


		# [ method ]
		local _mtd ;


		case "$mtd__" in


			# ACCESS CONTROLL 

			onr | owner ) _mtd=FsAbs__ownr ;;

			perm | link ) _mtd=FsAbs__perm ;;


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


	fi ;


	# POST PROCESS : REPORT STATUS --------

	return $fls ;


} ;
