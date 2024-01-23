#!/usr/bin/env bash
# ######################################################################################
# FEDORA CONTROLLER UTILITY GROUP
# ######################################################################################
FedoraCtlr() (


# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# PACKAGE STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# INSTALL
# ======================================================================================
	istl() {


		# [ arguments ]
		local -a _ax=("$@") ;

		# [ result ]
		local _rslt=$tru ;


		# POSITIONED ARGUMENT --------

		# [ positoined_arguments ]
		local -a _pax=` \
			s_gtCblPax \
		` ;


		# [ applicaiton_id ]
		local app_id__="${_pax[0]}" ;


		# PRECHECK : ID --------

		# - id is not set
		if [[ -z "$app_id__" ]] ;
		then 


			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_CblMpa \
				"Applilcaiton Id" \
				--pos "1st" \
			;


			return $fls ;


		fi ;


		# PRECHECKS --------

		if \
			isIstld \
				"$app_id__" \
		;
		then


			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_GnlIdvAtnx \
				--atn "istl" \
				--stt $_rslt \
				--ttl "${ANSI_F_GN}${app_id__}${_ANSI}" \
			;


			return $tru ;


		fi ;


		# MAIN PROCESS : PACKAGE MANAGER --------

		# [ package_manager_options ]
		local -a _pm_optx ;


		[[ $env_vbo == $tru ]] \
		&& echo "" \
		;


		[[ $env_vbo == $tru ]] \
		&& _pm_optx+=(-v) \
		|| _pm_optx+=(-q) \
		;


		# q 			: quite
		# y 			: assumeyes
		# v 			: verbose
		yus \
			install \
				-y \
				"${_pm_optx[@]}" \
				$app_id__ \
		| sed \
			's/^/'"${S_PPT_ITND}"'&/g' \
		;

		_rslt=$? ;


		[[ $env_vbo == $tru ]] \
		&& echo "" \
		;


		# POST PROCESS : DISPLAY MESSAGE --------

		# ant 			: action
		# stt 			: status
		# ttl 			: title
		[[ $env_vbo == $tru ]] \
		&& s_ivkPptTpl_GnlIdvAtnx \
			--atn "istl" \
			--stt $_rslt \
			--ttl "${ANSI_F_GN}${app_id__}${_ANSI}" \
		;


		# POST PROCESS : REPORT STATUS --------

		return $_rslt ;


	} ;



# ======================================================================================
# UNINSTALL
# ======================================================================================
	uistl() {


		# [ arguments ]
		local -a _ax=("$@") ;

		# [ result ]
		local _rslt=$tru ;


		# POSITIONED ARGUMENT --------

		# [ positoined_arguments ]
		local -a _pax=` \
			s_gtCblPax \
		` ;


		# [ applicaiton_id ]
		local app_id__="${_pax[0]}" ;


		# PRECHECK : ID --------

		# - id is not set
		if [[ -z "$app_id__" ]] ;
		then 


			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_CblMpa \
				"Applilcaiton Id" \
				--pos "1st" \
			;


			return $fls ;


		fi ;


		# PRECHECKS --------

		if \
			! isIstld \
				"$app_id__" \
		;
		then


			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_GnlIdvAtnx \
				--atn "uistl" \
				--stt $_rslt \
				--ttl "${ANSI_F_GN}${app_id__}${_ANSI}" \
			;


			return $tru ;


		fi ;


		# MAIN PROCESS : PACKAGE MANAGER --------

		# [ package_manager_options ]
		local -a _pm_optx ;


		[[ $env_vbo == $tru ]] \
		&& echo "" \
		;


		[[ $env_vbo == $tru ]] \
		&& _pm_optx+=(-v) \
		|| _pm_optx+=(-q) \
		;


		# q 			: quite
		# y 			: assumeyes
		# v 			: verbose
		yus \
			remove \
				-y \
				"${_pm_optx[@]}" \
				$app_id__ \
		| sed \
			's/^/'"${S_PPT_ITND}"'&/g' \
		;

		_rslt=$? ;


		[[ $env_vbo == $tru ]] \
		&& echo "" \
		;


		# POST PROCESS : DISPLAY MESSAGE --------

		# ant 			: action
		# stt 			: status
		# ttl 			: title
		[[ $env_vbo == $tru ]] \
		&& s_ivkPptTpl_GnlIdvAtnx \
			--atn "uistl" \
			--stt $_rslt \
			--ttl "${ANSI_F_GN}${app_id__}${_ANSI}" \
		;


		# POST PROCESS : REPORT STATUS --------

		return $_rslt ;


	} ;



# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# STATUS STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# IS INSTALLED
# ======================================================================================
	isIstld() {


		# [ arguments ]
		local -a _ax=("$@") ;

		# [ result ]
		local _rslt=$tru ;


		# POSITIONED ARGUMENT --------

		# [ positoined_arguments ]
		local -a _pax=` \
			s_gtCblPax \
		` ;


		# [ applicaiton_id ]
		local app_id__="${_pax[0]}" ;


		# PRECHECK : ID --------

		# - id is not set
		if [[ -z "$app_id__" ]] ;
		then 


			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_CblMpa \
				"Applilcaiton Id" \
				--pos "1st" \
			;


			return $fls ;


		fi ;


		# NAMED ARGUMENT --------

		# [ named_arguments ]
		local -A _nax=` \
			s_gtCblNax \
				--cli \
				--cli-nov 1 \
		` ;


		# [ cli ]
		local cli="${_nax[cli]}" ;


		# MAIN PROCESS : PACKAGE MANAGER --------

		yum  \
			list \
			--installed \
		| grep \
			-Pq \
			'^'"$app_id__"'\.' \
		;

		_rslt=$? ;


		# MAIN PROCESS : PACKAGE MANAGER --------

		if [[ \
			$_rslt == $fls \
			&& "$cli" \
		]] ;
		then


			which \
				"$cli" \
				&>/dev/null \
			;


			_rslt=$? ;


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


	# MAIN PROCESS : METHOD --------

	# - action is callable
	if [[ "`
		type \
			-t \
			$mtd__ \
			2>/dev/null \
	`" ]] ;
	then


		shift 1 ;


		"$mtd__" \
			"$@" \
		;


		return $? ;


	fi ;


	# POST PROCESS : REPORT STATUS --------

	return $fls ;


 ) ;
