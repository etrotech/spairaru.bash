#!/usr/bin/env bash
# ######################################################################################
# URL UTILITY
# ######################################################################################
# ======================================================================================
# DOWNLOAD URL HEAD
# ======================================================================================
s_dwldUrlHd() {


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


	# NAMED ARGUMENT --------

	# [ named_arguments ]
	local -A _nax=` \
		s_gtCblNax\
			--cmd "command" \
			--cmd-nov 1 \
			--cmd-opt-curl \
			--cmd-opt-wget \
			\
			--to "timeout" \
			--to-nov 1 \
	` ;


	# [ command ]
	local cmd="${_nax[cmd]}" ;

	# [ timeout ]
	local to="${_nax[to]}" ;


	# PRECHECK : COMMAND --------

	cmd="` \
		s_gtDwldMtd \
			$cmd \
	`" ;

	_rslt=$? ;


	[[ $_rslt != $tru ]] \
	&& return $fls \
	;


	# PRECHECK : SOURCE PATH --------

	# - source path is not given
	if [[ -z "$src_pf__" ]] ;
	then


		[[ $env_vbo == $tru ]] \
		&& s_ivkPptTpl_CblMpa \
			"Source Path" \
			--pos "1st" \
		;


		return $fls ;


	fi ;


	# - source path is not url
	if [[ $src_pf__ != http?(s)://* ]] ;
	then


		[[ $env_vbo == $tru ]] \
		&& s_ivkPptTpl_DfltRej \
			"%s is not a valid URL" \
			"${ANSI_F_PR}`__ "Source Path"`${_ANSI}" \
		;


		return $fls ;


	fi ;


	# PRE PROCESS : TIMEOUT --------

	[[ -z "$to" ]] \
	&& to=3 \
	;


	# MAIN PROCESS : DOWNLOAD --------

	# i ) Curl

	if [[ $cmd == "curl" ]] ;
	then

		# I 				: head only
		# f 				: fail silenty
		# s 				: silent mode
		# connect-timeout 	: timeout in second
		# 1 				: source path
		curl \
			-I \
			-f \
			-s \
			--connect-timeout $to \
			"$src_pf__" \
			&>/dev/null \
		;


	# ii ) Wget

	elif [[ $cmd == "wget" ]] ;
	then

		# T 		: timeout in second
		# q 		: quiet mode
		# t 		: number of retry
		# method 	: limit content information
		# 1 		: source path
		wget \
			-T 3 \
			-q \
			-t 1 \
			--method=HEAD \
			"$src_pf__" \
			&>/dev/null \
		;


	fi ;


	_rslt=$? ;


	# POST PROCESS : DISPLAY MESSAGE --------

	if [[ $env_vbo == $tru ]] ;
	then


		# Status ) 0

		if [[ $_rslt == $tru ]] ;
		then

			s_ivkPptTpl_DfltAcpt \
				"${ANSI_F_LG}`s_gtIco inet`${_ANSI}${ANSI_F_CN}%s${_ANSI}" \
				"$src_pf__" \
			&& s_ivkPptTpl_DfltBlkCnt \
				"${ANSI_F_LG} 🡔${_ANSI}%sis connectable." \
				"$_env_vbo_ttl" \
			;


		# Status ) 1

		else

			s_ivkPptTpl_DfltRej \
				"${ANSI_F_LG}`s_gtIco inet`${_ANSI}${ANSI_F_CN}%s${_ANSI}" \
				"$src_pf__" \
			&& s_ivkPptTpl_DfltBlkCnt \
				"${ANSI_F_LG} 🡔${_ANSI}%sis not connectable." \
				"$_env_vbo_ttl" \
			;

		fi ;


	fi ;


	# POST PROCESS : REPORT STATUS --------

	return $_rslt ;


} ;



# ======================================================================================
# DOWNLOAD URL
# ======================================================================================
s_dwldUrl() {


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
			--cmd "command" \
			--cmd-nov 1 \
			--cmd-opt-curl \
			--cmd-opt-wget \
			\
			--to "timeout" \
			--to-nov 1 \
	` ;


	# [ command ]
	local cmd="${_nax[cmd]}" ;

	# [ timeout ]
	local to="${_nax[to]}" ;


	# PRECHECK : COMMAND --------

	cmd="` \
		s_gtDwldMtd \
			$cmd\
	`" ;

	_rslt=$? ;


	[[ $_rslt != $tru ]] \
	&& return $fls \
	;


	# PRECHECK : SOURCE PATH --------

	# - source path is not given
	if [[ -z "$src_pf__" ]] ;
	then


		[[ $env_vbo == $tru ]] \
		&& s_ivkPptTpl_CblMpa \
			"Source Path" \
			--pos "1st" \
		;


		return $fls ;


	fi ;


	# - source path is not url
	if [[ $src_pf__ != http?(s)://* ]] ;
	then


		[[ $env_vbo == $tru ]] \
		&& s_ivkPptTpl_DfltRej \
			"%s is not a valid URL" \
			"${ANSI_F_PR}`__ "Source Path"`${_ANSI}" \
		;


		return $fls ;


	fi ;


	# PRE PROCESS : DESTINATION PATH --------

	# - destination is not set
	[[ -z "$dst_pf__" ]] \
	&& dst_pf__="$PWD" \
	&& dst_pf__="${PWD}/`basename "$src_pf__"`" \
	;


	# PRE PROCESS : TIMEOUT --------

	[[ -z "$to" ]] \
	&& to=3 \
	;


	# MAIN PROCESS : DOWNLOAD --------

	# [ command_options ]
	local -a _cmd_optx ;


	[[ $env_vbo == $tru ]] \
	&& echo "" \
	;


	# i ) Curl

	if [[ $cmd == "curl" ]] ;
	then


		[[ $env_vbo != $tru ]] \
		&& _cmd_optx+=(-s) \
		;


		# L 				: location, follow redirects
		# o 				: save to destination
		# s 				: silent
		# connect-timeout 	: timeout in second
		# 1 				: source url
		s_ivkPptTpl_DfltBlkStrm \
			curl \
				-L \
				-o "$dst_pf__" \
				--connect-timeout $to \
				"${_cmd_optx[@]}" \
				"$src_pf__" \
		;


	# ii ) Wget

	elif [[ $cmd == "wget" ]] ;
	then


		[[ $env_vbo != $tru ]] \
		&& _cmd_optx+=(-s) \
		;


		# 1 : source url
		# O : output to file
		# T : timeout
		# t : number of retry
		# s : silent
		s_ivkPptTpl_DfltBlkStrm \
			wget \
				-O "$dst_pf__" \
				-T $to \
				-t 1 \
				"$src_pf__" \
				"${_cmd_optx[@]}" \
		;


	fi ;


	_rslt=$? ;


	[[ $env_vbo == $tru ]] \
	&& echo "" \
	;


	# POST PROCESS : DISPLAY MESSAGE --------

	[[ $env_vbo == $tru ]] \
	&& s_ivkPptTpl_FsXfrlAtnx \
		--atn "dwld" \
		--stt $_rslt \
		\
		--src_pf "$src_pf__" \
		--src_ttl "$vbo_ttl" \
		\
		--dst_pf "$dst_pf__" \
		--dst_ttl "$vbo_ttl" \
	;


	# POST PROCESS : REPORT STATUS --------

	return $_rslt ;


} ;



# ======================================================================================
# GET DOWNLOAD METHOD
# ======================================================================================
s_gtDwldMtd() {


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


	# [ command ]
	local cmd__="${_pax[0]}" ;


	# MAIN PROCESS : DETERMINE COMMAND --------

	# A ) Use Default Method

	# - command is not given
	if [[ -z "$cmd__" ]] ;
	then

		# i ) Curl

		if [[ "` \
			type \
				-t \
				curl \
				2>/dev/null \
		`" ]] ;
		then

			echo "curl" ;


		# ii ) Wget

		elif [[ "` \
			type \
				-t \
				wget \
				2>/dev/null \
		`" ]] ;
		then

			echo "wget" ;


		else

			_rslt=$fls ;


		fi ;


	# B ) Use Custom Method

	# - given method is supported
	elif [[ $cmd__ =~ ^(curl|wget)$ ]] ;
	then

		echo $cmd__ ;



	# B ) Custom Method not Supported

	else

		_rslt=2 ;


	fi ;


	# POST PROCESS : DISPLAY MESSAGE --------

	if [[ $env_vbo == $tru ]] ;
	then

		# Status ) 2

		if [[ $_rslt == 2 ]] ;
		then

			s_ivkPptTpl_DfltRej \
				"Download method: %s is not supported yet." \
				"${ANSI_F_GN}${cmd__}${_ANSI}" \
			;


		# Status ) 1

		elif [[ $_rslt == 1 ]] ;
		then

			s_ivkPptTpl_DfltRej \
				"No download method is available." \
			&& s_ivkPptTpl_DfltBlkCnt \
				"please install either %s or %s." \
				"${ANSI_F_GN}curl${_ANSI}" \
				"${ANSI_F_GN}wget${_ANSI}" \
			;


		fi ;

	fi ;


	# POST PROCESS : REPORT STATUS --------

	[[ $_rslt == 2 ]] \
	&& return $fls \
	|| return $_rslt \
	;


} ;
