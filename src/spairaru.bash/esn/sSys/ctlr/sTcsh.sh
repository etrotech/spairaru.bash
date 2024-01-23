#!/usr/bin/env bash
# ######################################################################################
# TCSH CONTROLLER UTILITY GROUP
#
# File System Map:
# 	🛠️
# 	└─ 🖿 $HOME
# 	   └─ 🖺 .tcshrc
#
# ######################################################################################
TcshCtlr() {


# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# CORE STATIC PUBLIC RPOPERTY
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	# shell_langurage
	local __sh_lng__=tcsh ;



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


		# [ controller ]
		local _Ctlr ;

		# [ method ]
		local _mtd ;


		case "$mtd__" in


			# ALTERNATIVE

			optmz | optimize ) _Ctlr=ShCtlr ;;

			ver | version ) _Ctlr=ShCtlr ;;


			# CONFIGURATIVE

			prfl | profile ) _Ctlr=ShCtlr ;;


			# CORE

			aka | alias ) _Ctlr=ShCtlr ;;

			akax | aliass ) _Ctlr=ShCtlr ;;

			cli ) _Ctlr=ShCtlr ;;

			env | environment ) _Ctlr=ShCtlr ;;

			ftr | feature ) _Ctlr=ShCtlr ;;

			ftrx | features ) _Ctlr=ShCtlr ;;


			# STATEFUL

			isIstld | isInstalled ) _Ctlr=ShCtlr ;;


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
