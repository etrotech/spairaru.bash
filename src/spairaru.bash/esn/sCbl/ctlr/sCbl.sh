#!/usr/bin/env bash
# ######################################################################################
# CALLABLE CONTROLLER UTILITY GROUP
# ######################################################################################
CblCtlr() (


# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# CORE STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# POSITIONED ARGUMENTS
# ======================================================================================
	CblCtlr__pax() {


		# MAIN PROCESSES --------

		s_gtCblPax \
			"$@" \
		;


		# POST PROCESS : REPORT STATUS --------

		return $? ;


	} ;



# ======================================================================================
# NAMED ARGUMENTS
# ======================================================================================
	CblCtlr__nax() {


		# MAIN PROCESSES --------

		s_gtCblNax \
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
	local -a ___ax___=("$@") ;


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
	local -a __pax__=` \
		s_gtCblPax \
			-- "___ax___"
	` ;


	# [ method ]
	local mtd__="${__pax__[0]}" ;


	# MAIN PROCESS : METHOD --------

	# - method is set
	if [[ "$mtd__" ]] ;
	then


		# [ method ]
		local _mtd ;


		case "$mtd__" in


			# CORE

			pax | gtPositionedArguments ) _mtd=CblCtlr__pax ;;

			nax | gtNamedArguments ) _mtd=CblCtlr__nax ;;


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


 ) ;
