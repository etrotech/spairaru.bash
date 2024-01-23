#!/usr/bin/env bash
# ######################################################################################
# SHELL PROFILE CONTROLLER UTILITY GROUP
# ######################################################################################
ShPrflCtlr() {


# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# CORE STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# ALIAS
# 
# Description:
# 	Add or Remove alias key in cofiguration file.
#
# ======================================================================================
	ShPrflCtlr__aka() {


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


		# [ key ]
		local ky__="${_pax[0]}" ;

		# [ command ]
		local cmd__="${_pax[1]}" ;


		# PRE PROCESS : ACTION --------

		if [[ -z "$atn" ]] ;
		then

			[[ "$cmd__" ]] \
			&& atn="ad" \
			|| atn="qry" \
			;

		fi ;


		# [ action ]
		local _atn="$atn" ;

		[[ "$_atn" == "dl" ]] \
		&& _atn="rm" \
		;


		# PRECHECK : KEY --------

		if [[ -z "$ky__" ]] ;
		then 


			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_CblMpa \
				"Key" \
				--pos "1st" \
			;


			return $fls ;


		fi ;


		# PRECHECK : COMMAND --------

		# - its add action
		# - command is not set
		if [[ \
			$atn == "ad" \
			&& -z "$cmd__" \
		]] ;
		then 


			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_CblMpa \
				"Command" \
				--pos "2nd" \
			;


			return $fls ;


		fi ;


		# MAIN PROCESS : BUILD ENTRY --------

		# [ entry ]
		local _nty ;


		# - its add action
		if [[ $atn == "ad" ]] ;
		then
		
			_nty='alias '"$ky__"'="'"$cmd__"'" ;' ;


		# - its delete action
		elif [[ $atn == "dl" ]] ;
		then
		
			_nty='alias '"$ky__"'=".*" ;' ;


		# - otherwise
		else

			[[ "$cmd__" ]] \
			&& _nty='alias '"$ky__"'="'"$cmd__"'" ;' \
			|| _nty="`
				cat \
					"$prfl_fl_abs_pf" \
				| grep \
					-Poz \
					'alias '"$ky__"'=".*(?=" ;)' \
				| tr \
					-d \
					'\0' \
			`" \
			;


		fi ;


		# MAIN PROCESS : EDIT PROFILE --------

		s_aplyDocAtnx \
			"$prfl_fl_abs_pf" \
			"$_atn" \
			"$_nty" \
			"${_doc_optx[@]}" \
		;

		_rslt=$? ;


		# POST PROCESS : DISPLAY MESSAGE --------

		# - action is not query
		# - verbose is enabled
		[[ \
			$_atn != "qry" \
			&& $env_vbo == $tru \
		]] \
		&& s_ivkPptTpl_DocMnpAtnx \
			--atn $_atn \
			--stt $_rslt \
			\
			--tgt_cat "${ANSI_F_OR}${__sh_lng__}${_ANSI} `__ "alias key"`" \
			--tgt_ttl "${ANSI_F_GN}${ky__}${_ANSI}" \
			\
			--doc_cat "profile" \
			--doc_ttl "$_prfl_ttl" \
			--doc_pf "$prfl_fl_abs_pf" \
		;


		# POST PROCESS : REPORT STATUS --------

		[[ $_rslt == 2 ]] \
		&& return $tru \
		|| return $_rslt \
		;


	} ;



# ======================================================================================
# ENVIRONMENT
# 
# Description:
# 	Add or Remove environment key in cofiguration files.
#
# ======================================================================================
	ShPrflCtlr__env() {


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


		# [ key ]
		local ky__="${_pax[0]}" ;

		# [ value ]
		local vlu__="${_pax[1]}" ;


		# PRE PROCESS : ACTION --------

		# [ action ]
		local _atn="$atn" ;


		if [[ -z "$_atn" ]] ;
		then

			if [[ ${#_pax[@]} -ge 2 ]] ;
			then

				[[ "$vlu__" ]] \
				&& _atn="ad" \
				|| _atn="rm" \
				;


			else

				_atn="qry" ;


			fi ;

		fi ;


		[[ "$_atn" == "dl" ]] \
		&& _atn="rm" \
		;


		# PRECHECK : KEY --------

		if [[ -z "$ky__" ]] ;
		then 


			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_CblMpa \
				"Key" \
				--pos "1st" \
			;


			return $fls ;


		fi ;


		# PRECHECK : VALUE --------

		# - its add action
		# - value is not set
		if [[ \
			$atn == "ad" \
			&& -z "$vlu__" \
		]] ;
		then 


			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_CblMpa \
				"Value" \
				--pos "2nd" \
			;


			return $fls ;


		fi ;


		# MAIN PROCESS : BUILD ENTRY --------

		# [ entry ]
		local _nty ;


		# - its add action
		if [[ $atn == "ad" ]] ;
		then
		
			_nty='export '"$ky__"'="'"$vlu__"'" ;' ;


		# - its delete action
		elif [[ $atn == "dl" ]] ;
		then
		
			_nty='export '"$ky__"'=".*" ;' ;


		# - otherwise
		else

			[[ "$vlu__" ]] \
			&& _nty='export '"$ky__"'="'"$vlu__"'" ;' \
			|| _nty="`
				cat \
					"$prfl_fl_abs_pf" \
				| grep \
					-Poz \
					'export '"$ky__"'=".*(?=" ;)' \
				| tr \
					-d \
					'\0' \
			`" \
			;


		fi ;


		# MAIN PROCESS : EDIT PROFILE --------

		s_aplyDocAtnx \
			"$prfl_fl_abs_pf" \
			"$_atn" \
			"$_nty" \
			"${_doc_optx[@]}" \
		;

		_rslt=$? ;


		# POST PROCESS : DISPLAY MESSAGE --------

		# - action is not query
		# - verbose is enabled
		[[ \
			$_atn != "qry" \
			&& $env_vbo == $tru \
		]] \
		&& s_ivkPptTpl_DocMnpAtnx \
			--atn $_atn \
			--stt $_rslt \
			\
			--tgt_cat "${ANSI_F_OR}${__sh_lng__}${_ANSI} `__ "environment key"`" \
			--tgt_ttl "$ky__" \
			\
			--doc_cat "profile" \
			--doc_ttl "$_prfl_ttl" \
			--doc_pf "$prfl_fl_abs_pf" \
		;


		# POST PROCESS : REPORT STATUS --------

		[[ $_rslt == 2 ]] \
		&& return $tru \
		|| return $_rslt \
		;


	} ;



# ======================================================================================
# FEATURE
# 
# Description:
# 	Add or Remove feature in cofiguration files.
#
# ======================================================================================
	ShPrflCtlr__ftr() {


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


		# [ key ]
		local ky__="${_pax[0]}" ;

		# [ action ]
		local atn__="${_pax[1]}" ;


		# PRE PROCESS : ACTION --------

		# [ action ]
		local _atn="$atn" ;


		if [[ -z "$_atn" ]] ;
		then

			if [[ ${#_pax[@]} -ge 2 ]] ;
			then

				[[ \
					-z "$atn__" \
					|| "$atn__" =~ ^(dsbl|disable|off)$ \
				]] \
				&& _atn="rm" \
				|| _atn="ad" \
				;


			else

				_atn="qry" ;


			fi ;

		fi ;


		# PRECHECK : KEY --------

		if [[ -z "$ky__" ]] ;
		then 


			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_CblMpa \
				"Key" \
				--pos "1st" \
			;


			return $fls ;


		fi ;


		if [[ ! "` \
			shopt \
				-p \
			| grep \
				-Poz \
				'shopt.*'"$ky__" \
			| tr \
				-d \
				'\0' \
		`" ]] ;
		then


			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_DfltRej \
				"feature %s is not supported." \
				"${ANSI_F_BL}${atn__}${_ANSI}" \
			;


			return $fls ;


		fi ;


		# PRECHECK : ACTION --------

		if [[ \
			"$atn__" \
			&& ! "$atn__" =~ ^(nbl|enable|dsbl|disable|on|off)$ \
		]] ;
		then 


			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_DfltRej \
				"%s %s is not supported." \
				"action" \
				"${ANSI_F_BL}${atn__}${_ANSI}" \
			;


			return $fls ;


		fi ;


		# MAIN PROCESS : BUILD ENTRY --------

		# [ entry ]
		local _nty ;


		# - its add action
		if [[ $_atn == "ad" ]] ;
		then
		
			_nty='shopt -s '"$ky__"' ;' ;


		# - its delete action
		elif [[ $_atn == "dl" ]] ;
		then
		
			_nty='shopt.*'"$ky__"'.*(?=;)' ;


		# - otherwise
		else


			[[ "$atn__" ]] \
			&& _nty='shopt -s '"$ky__"' ;' \
			|| _nty="`
				cat \
					"$prfl_fl_abs_pf" \
				| grep \
					-Poz \
					'shopt.*'"$ky__"'.*(?=;)' \
				| tr \
					-d \
					'\0' \
			`" \
			;


		fi ;


		# MAIN PROCESS : EDIT PROFILE --------

		s_aplyDocAtnx \
			"$prfl_fl_abs_pf" \
			"$_atn" \
			"$_nty" \
			"${_doc_optx[@]}" \
		;

		_rslt=$? ;


		# POST PROCESS : DISPLAY MESSAGE --------

		# - action is not query
		# - verbose is enabled
		[[ \
			$_atn != "qry" \
			&& $env_vbo == $tru \
		]] \
		&& s_ivkPptTpl_DocMnpAtnx \
			--atn $_atn \
			--stt $_rslt \
			\
			--tgt_cat "${ANSI_F_OR}${__sh_lng__}${_ANSI} `__ "feature"`" \
			--tgt_ttl "$ky__" \
			\
			--doc_cat "profile" \
			--doc_pf "$prfl_fl_abs_pf" \
			--doc_ttl "$_prfl_ttl" \
		;


		# POST PROCESS : REPORT STATUS --------

		[[ $_rslt == 2 ]] \
		&& return $tru \
		|| return $_rslt \
		;


	} ;



# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# DOCUMENT STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# COMMENT
# 
# Description:
# 	Add comment remark to target lanes in cofiguration file.
#
# ======================================================================================
	ShPrflCtlr__co() {


		# MAIN PROCESSES --------

		s \
			doc \
				co \
					"$prfl_fl_abs_pf" \
					"$@" \
		;


		# POST PROCESS : REPORT STATUS --------

		return $? ;


	} ;



# ======================================================================================
# ERASE
# 
# Description:
# 	Remove lanes from cofiguration file.
#
# ======================================================================================
	ShPrflCtlr__ers() {


		# MAIN PROCESSES --------

		s \
			doc \
				ers \
					"$prfl_fl_abs_pf" \
					"$@" \
		;


		# POST PROCESS : REPORT STATUS --------

		return $?


	} ;



# ======================================================================================
# RELAOD
# 
# Description:
# 	Import in cofiguration file in shell.
#
# ======================================================================================
	ShPrflCtlr__rld() {


		# MAIN PROCESSES --------

		. "$prfl_fl_abs_pf" ;


		# POST PROCESS : REPORT STATUS --------

		return $tru ;


	} ;



# ======================================================================================
# HAS
# ======================================================================================
	ShPrflCtlr__hs() {


		# MAIN PROCESSES --------

		s \
			doc \
				hs \
					"$prfl_fl_abs_pf" \
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
	ShPrflCtlr__rmrk() {


		# MAIN PROCESSES --------

		s \
			doc \
				rmrk \
					"$prfl_fl_abs_pf" \
					"$@" \
		;


		# POST PROCESS : REPORT STATUS --------

		return $? ;


	} ;



# ======================================================================================
# WRITE
# 
# Description:
# 	Add lanes to cofiguration file.
#
# ======================================================================================
	ShPrflCtlr__wrt() {


		# MAIN PROCESSES --------

		s \
			doc \
				wrt \
					"$prfl_fl_abs_pf" \
					"$@" \
		;


		# POST PROCESS : REPORT STATUS --------

		return $?


	} ;



# ======================================================================================
# UNCOMMENT
# 
# Description:
# 	Remove comment remark from target lanes in cofiguration file.
#
# ======================================================================================
	ShPrflCtlr__uc() {


		# MAIN PROCESSES --------

		s \
			doc \
				uc \
					"$prfl_fl_abs_pf" \
					"$@" \
		;


		# POST PROCESS : REPORT STATUS --------

		return $? ;


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
			--prfl_fl_abs_pf "pf" "path" "prfl" "profile" \
			--prfl_fl_abs_pf-nov 1 \
			\
			--prfl_scp "scp" "scope" \
			--prfl_scp-dflt "lo" \
			--prfl_scp-nov 1 \
			--prfl_scp-opt-dflt "dflt" "defalt" \
			--prfl_scp-opt-lo "lo" "local" \
			--prfl_scp-opt-glo "glo" "global" \
			\
			--atn "action" \
			--atn-nov 1 \
			--atn-opt-ad "ad" "add" \
			--atn-opt-dl "dl" "delete" \
			--atn-opt-qry "qry" "query" \
	` ;


	# [ profile_file_absolute_path ]
	local prfl_fl_abs_pf="${_nax[prfl_fl_abs_pf]}" ;

	# [ profile_scope ]
	local prfl_scp="${_nax[prfl_scp]}" ;

	# [ action ]
	local atn="${_nax[atn]}" ;


	# PRECHECK : SHELL LANGUAGE --------

	if [[ -z "$__sh_lng__" ]] ;
	then

		return $fls ;

	fi ;


	# MAIN PROCESS : PROFILE PATH --------

	if [[ \
		-z "$prfl_fl_abs_pf" \
		&& "$prfl_scp" \
	]] ;
	then

		prfl_fl_abs_pf="` \
			"s_gt${__sh_lng__^}PrflPf" \
				"$@" \
		`" ;


	fi ;


	if [[ -z "$prfl_fl_abs_pf" ]] ;
	then


		[[ $env_vbo == $tru ]] \
		&& s_ivkPptTpl_DfltRej \
			"%s%s has not found." \
			"${ANSI_F_OR}${__sh_lng__}${_ANSI} " \
			"profile" \
		;


		return $fls ;


	fi ;


	# MAGIC PROCESS : PATH --------

	# - action is path
	[[ $mtd__ =~ ^(pf|path)$ ]] \
	&& echo "$prfl_fl_abs_pf" \
	&& return $tru \
	;


	# MAIN PROCESS : PROFILE TITLE --------

	if [[ \
		-n "$prfl_fl_abs_pf" \
		&& -z "$prfl_scp" \
	]] ;
	then

		for scp in "dflt" "glo" "lo" ;
		do

			[[
				"` \
				"s_gt${__sh_lng__^}PrflPf" \
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


	# [ profile_title ]
	local _prfl_ttl="` \
		s_gtPrflTtl \
			"$prfl_scp" \
	`" ;


	# MAIN PROCESS : DOCUMENT OPTIONS --------

	# [ document_options ]
	local -a _doc_optx=` \
		s_gtDocOptx \
			"$@" \
	` ;


	# MAIN PROCESS : PROFILE EXISTENCE --------

	if [[ $atn != "qry" ]] ;
	then


		# - file does not exists
		! s \
			fl \
				ex \
					"$prfl_fl_abs_pf" \
		&& s \
			fl \
				mk \
					"$prfl_fl_abs_pf" \
			\
			--vbo $fls \
		;


		# - file its global profile
		[[ \
			"` \
				basename \
					"$prfl_fl_abs_pf" \
			`" \
			== "$__sh_lng__" \
		]] \
		&& ShPrflCtlr__rmrk \
			"$S_RMRK" \
			--hdr \
		;


	fi ;


	# MAIN PROCESS : METHOD --------

	# - method is set
	if [[ "$mtd__" ]] ;
	then


		# [ method ]
		local _mtd ;


		case "$mtd__" in


			# CORE

			aka | alias ) _mtd=ShPrflCtlr__aka ;;

			env | environment ) _mtd=ShPrflCtlr__env ;;

			ftr | feature ) _mtd=ShPrflCtlr__ftr ;;


			# DOCUMENT

			co | comment ) _mtd=ShPrflCtlr__co ;;

			ers | erase ) _mtd=ShPrflCtlr__ers ;;

			hs | has ) _mtd=ShPrflCtlr__hs ;;

			rmrk | remark ) _mtd=ShPrflCtlr__rmrk ;;

			rld | reload ) _mtd=ShPrflCtlr__rld ;;

			wrt | write ) _mtd=ShPrflCtlr__wrt ;;

			uc | uncomment ) _mtd=ShPrflCtlr__uc ;;


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
