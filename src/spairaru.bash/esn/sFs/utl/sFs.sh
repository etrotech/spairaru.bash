#!/usr/bin/env bash
# ######################################################################################
# TERMINAL CORE UTILITY
# ######################################################################################
# ======================================================================================
# ESCAPE FILE SYSTEM PATH
# ======================================================================================
s_xcpFsPf() {


	# [ arguments ]
	local -a _ax=("$@") ;


	# POSITIONED ARGUMENT --------

	# [ positoined_arguments ]
	local -a _pax=` \
		s_gtCblPax \
	` ;


	# [ path ]
	local pf__="${_pax[0]}" ;


	# PRECHECK : PATH --------

	[[ -z "$pf__" ]] \
	&& return $fls \
	;


	# NAMED ARGUMENT --------

	# [ named_arguments ]
	local -A _nax=` \
		s_gtCblNax \
			--fmt "format" \
			--fmt-dflt "dflt" \
			--fmt-nov 1 \
			--fmt-opt-dflt "default" \
			--fmt-opt-rgx "regex" \
	` ;


	# [ format ]
	local fmt="${_nax[fmt]}" ;


	# MAIN PROCESS : ESCAPE PATH --------

	# FORMAT ) REGEX

	if [[ "$fmt" == "rgx" ]] ;
	then


		echo \
			"$pf__" \
		| sed \
			-r \
			-z \
			\
			-e 's/\\\ /\\\\s/g' \
			-e 's/ /\\\\\ /g' \
			-e 's/\\\\s/\\\\\ /g' \
		;


	# FORMAT ) DEFAULT

	else

		echo \
			"$pf__" \
		| sed \
			-r \
			-z \
			\
			-e 's/\\\ /\\\\s/g' \
			-e 's/ /\\\ /g' \
			-e 's/\\\\s/\\\ /g' \
		;


	fi ;


	# POST PROCESS : REPORT STATUS --------

	return $tru ;


} ;



# ======================================================================================
# PRINT FILE SYSTEM PATH
# ======================================================================================
s_prtFsPf() {


	# [path ]
	local _pf="` \
		s_xcpFsPf \
			"$@" \
	`" ;


	[[ -z "$_pf" ]] \
	&& return $fls \
	;


	echo \
		"$_pf" \
	| sed \
		-r \
		-z \
		\
		-e 's/'"${PWD//\//\\\/}"'/\./g' \
	;


	return $tru ;


} ;
