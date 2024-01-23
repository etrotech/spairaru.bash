#!/usr/bin/env bash
# ######################################################################################
# FILE SYSTEM CONTROLLER UTILITY GROUP
# ######################################################################################
FsCtlr() {


# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# CORE STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# GLOB
#
# Description :
#  Enpower regular glob pattern sytnax in one line.
#
# ======================================================================================
	FlCtlr__gl() {


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


		local ptn__="${_pax[0]}" ;


		# NAMED ARGUMENT --------

		# [ named_arguments ]
		local -A _nax=` \
			s_gtCblNax \
				--icl "i" "include" \
				--icl-dflt "@" \
				--icl-nov 1 \
				--icl-opt-fl "fl" "file" \
				--icl-opt-fldr "fldr" "folder" \
		` ;


		# [ include ]
		local icl="${_nax[icl]}" ;


		# PRECHECK : PATTERN --------

		if [[ -z "$ptn__" ]] ;
		then


			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_CblMpa \
				"pattern" \
				--pos "1st" \
			;


			return $fls ;


		fi ;


		# MAIN PROCESS : PATTERN --------

		# [ pattern ]
		local _ptn="$ptn__" ;

		
		[[ ! "$_ptn" =~ ^(.|/) ]] \
		&& _ptn="./${_ptn}" \
		;


		# MAIN PROCESS : PATH --------

		# [ path ]
		local _pf="$_ptn" ;


		# ./ -> path

		# ** -> *

		# {...,...} -> *

		_pf="` \
			echo "$_pf" \
			| sed \
				-rz \
				-e 's/\.\\//'"${PWD//\\//\\\/}"'\\//g' \
				\
				-e 's/\*\*.*/\*/g' \
				\
				-e 's/\{.*\}/\*/g' \
		`" ;


		# echo "$_pf"


		# MAIN PROCESS : BUILD REGEX --------

		# [ regex ]
		local _rgx="$_ptn" ;


		# ./ -> path

		# ** -> @_@
		# /* -> /[^/]+
		# * -> .*
		# @_@ -> .*

		# {...,...} -> {...|...}
		# {...|...} -> (...|...)

		_rgx="` \
			echo "$_rgx" \
			| sed \
				-rz \
				-e 's/\.\\//'"${PWD//\\//\\\/}"'\\//g' \
				\
				-e 's/\*\*/@_@/g' \
				-e 's/\\/\*/\\/\[\^\\/\]\+/g' \
				-e 's/\*/\.\*/g' \
				-e 's/@_@/\.\*/g' \
				\
				-e '/\{.*\}/ s/,/\|/g' \
				-e 's/\{(.*)\}/\(\1\)/g' \
		`" ;


		_rgx='^'"$_rgx"'$' ;


		# echo "$_rgx"


		# POST PROCESS : FIND ITEMS --------

		# [ fd_option ]
		local -a _fd_optnx ;


		[[ "$icl" =~ ^(fl|file)$ ]] \
		&& _fd_optnx+=(-type f) \
		;


		[[ "$icl" =~ ^(fldr|folder)$ ]] \
		&& _fd_optnx+=(-type d) \
		;


		# [ raw_paths ]
		local -a _rw_pfx=(` \
			find \
				"${_fd_optnx[@]}" \
				$_pf \
		`) ;


		# POST PROCESS : FILTER ITEMS --------

		# [ filtered_paths ]
		local -a _fltd_pfx ;


		for (( i=0 ; i<${#_rw_pfx[@]} ; i++ )) ;
		do


			# echo "${_rw_pfx[$i]}"
			# echo "$_rgx"


			[[ "${_rw_pfx[$i]}" =~ $_rgx ]] \
			&& _fltd_pfx+=("${_rw_pfx[$i]}") \
			;


		done ;


		# POST PROCESS : OUTPUT RESULT --------

		s_cnvArr2Str \
			"${_fltd_pfx[@]}" \
		;


		# POST PROCESS : REPORT STATUS --------

		return $_rslt ;


	} ;



# ======================================================================================
# PATH
#
# Description :
# 	Output escaped File-System path.
#
# ======================================================================================
	FlCtlr__pf() {


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


		local pf__="${_pax[0]}" ;


		# PRECHECK : PATH --------

		if [[ -z "$pf__" ]] ;
		then


			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_CblMpa \
				"Path" \
				--pos "1st" \
			;


			return $fls ;


		fi ;


		# MAIN PROCESS : ESCAPE PATH --------

		s_xcpFsPf \
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


	# MAIN PROCESS : METHOD --------

	# - method is set
	if [[ "$mtd__" ]] ;
	then


		# [ method ]
		local _mtd ;


		case "$mtd__" in


			gl | glob ) _mtd=FlCtlr__gl ;;

			pf | path ) _mtd=FlCtlr__pf ;;


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
