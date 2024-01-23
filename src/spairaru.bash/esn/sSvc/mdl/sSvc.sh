#!/usr/bin/env bash
# ######################################################################################
# SHELL CONTROLLER UTILITY GROUP
# ######################################################################################
SvcCtlr() (


# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# CORE STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# ENABLE
# ======================================================================================
	nbl() {


		# [ result ]
		local _rslt=$tru ;


		# PRECHECKS --------

		if ! ex ;
		then


			# ant 			: action
			# stt 			: status
			# ttl 			: title
			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_SvcGnlAtnx \
				--atn "nbl" \
				--stt 2 \
				--ttl "${ANSI_F_GN}${id}${_ANSI}" \
			;


			return $fls ;


		fi ;


		# MAIN PROCESS : SERVICE --------

		systemctl \
			enable \
				$id \
				&>/dev/null \
		;

		_rslt=$? ;


		systemctl \
			daemon-reload \
		;


		# POST PROCESS : DISPLAY MESSAGE --------

		# ant 			: action
		# stt 			: status
		# ttl 			: title
		[[ $env_vbo == $tru ]] \
		&& s_ivkPptTpl_SvcGnlAtnx \
			--atn "nbl" \
			--stt $_rslt \
			--ttl "${ANSI_F_GN}${id}${_ANSI}" \
		;


		# POST PROCESS : REPORT STATUS --------

		return $_rslt ;


	} ;



# ======================================================================================
# DISABLE
# ======================================================================================
	dsbl() {


		# [ result ]
		local _rslt=$tru ;


		# PRECHECKS --------

		if ! ex ;
		then


			# ant 			: action
			# stt 			: status
			# ttl 			: title
			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_SvcGnlAtnx \
				--atn "dsbl" \
				--stt 2 \
				--ttl "${ANSI_F_GN}${id}${_ANSI}" \
			;


			return $fls ;


		fi ;


		# MAIN PROCESS : SERVICE --------

		systemctl \
			disable \
				$id \
				&>/dev/null \
		;

		_rslt=$? ;


		systemctl \
			daemon-reload \
		;


		# POST PROCESS : DISPLAY MESSAGE --------

		# ant 			: action
		# stt 			: status
		# ttl 			: title
		[[ $env_vbo == $tru ]] \
		&& s_ivkPptTpl_SvcGnlAtnx \
			--atn "dsbl" \
			--stt $_rslt \
			--ttl "${ANSI_F_GN}${id}${_ANSI}" \
		;


		# POST PROCESS : REPORT STATUS --------

		return $_rslt ;


	} ;



# ======================================================================================
# START
# ======================================================================================
	st() {


		# [ result ]
		local _rslt=$tru ;


		# PRECHECKS --------

		if ! ex ;
		then


			# ant 			: action
			# stt 			: status
			# ttl 			: title
			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_SvcGnlAtnx \
				--atn "st" \
				--stt 2 \
				--ttl "${ANSI_F_GN}${id}${_ANSI}" \
			;


			return $fls ;


		fi ;


		# MAIN PROCESS : SERVICE --------

		systemctl \
			start \
				$id \
				&>/dev/null \
		;

		_rslt=$? ;


		# POST PROCESS : DISPLAY MESSAGE --------

		# ant 			: action
		# stt 			: status
		# ttl 			: title
		[[ $env_vbo == $tru ]] \
		&& s_ivkPptTpl_SvcGnlAtnx \
			--atn "st" \
			--stt $_rslt \
			--ttl "${ANSI_F_GN}${id}${_ANSI}" \
		;


		# POST PROCESS : REPORT STATUS --------

		return $_rslt ;


	} ;



# ======================================================================================
# RESTART
# ======================================================================================
	rst() {


		# [ result ]
		local _rslt=$tru ;


		# PRECHECKS --------

		if ! ex ;
		then


			# ant 			: action
			# stt 			: status
			# ttl 			: title
			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_SvcGnlAtnx \
				--atn "rst" \
				--stt 2 \
				--ttl "${ANSI_F_GN}${id}${_ANSI}" \
			;


			return $fls ;


		fi ;


		# MAIN PROCESS : SERVICE --------

		systemctl \
			restart \
				$id \
				&>/dev/null \
		;

		_rslt=$? ;


		# POST PROCESS : DISPLAY MESSAGE --------

		# ant 			: action
		# stt 			: status
		# ttl 			: title
		[[ $env_vbo == $tru ]] \
		&& s_ivkPptTpl_SvcGnlAtnx \
			--atn "rst" \
			--stt $_rslt \
			--ttl "${ANSI_F_GN}${id}${_ANSI}" \
		;


		# POST PROCESS : REPORT STATUS --------

		return $_rslt ;


	} ;



# ======================================================================================
# STOP
# ======================================================================================
	sp() {


		# [ result ]
		local _rslt=$tru ;


		# PRECHECKS --------

		if ! ex ;
		then


			# ant 			: action
			# stt 			: status
			# ttl 			: title
			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_SvcGnlAtnx \
				--atn "sp" \
				--stt 2 \
				--ttl "${ANSI_F_GN}${id}${_ANSI}" \
			;


			return $fls ;


		fi ;


		# MAIN PROCESS : SERVICE --------

		systemctl \
			stop \
				$id \
				&>/dev/null \
		;

		_rslt=$? ;


		# POST PROCESS : DISPLAY MESSAGE --------

		# ant 			: action
		# stt 			: status
		# ttl 			: title
		[[ $env_vbo == $tru ]] \
		&& s_ivkPptTpl_SvcGnlAtnx \
			--atn "sp" \
			--stt $_rslt \
			--ttl "${ANSI_F_GN}${id}${_ANSI}" \
		;


		# POST PROCESS : REPORT STATUS --------

		return $_rslt ;


	} ;


# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# STATEFULL STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# EXIST
# ======================================================================================
	ex() {


		[[ "` \
			service \
				--status-all \
			2>&1 \
			| grep \
				-F \
				'.* \K'"$id"'$' \
		`" ]] \
		&& return $tru \
		|| return $fls \
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


	# NAMED ARGUMENT --------

	# [ named_arguments ]
	local -A _nax=` \
		s_gtCblNax \
			--id \
			--id-nov 1 \
	` ;


	# [ id ]
	local id="${_nax[id]}" ;


	# PRECHECK : ID --------

	# [[ -z "$id" ]] \
	# &&



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
