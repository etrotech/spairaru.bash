#!/usr/bin/env bash
# ######################################################################################
# SPAIRARU
# 
# Description:
# 	This applicaiton provides various unitilities for fast application development.
#
# File System Map:
# 	📦
# 	└─ 🖿 opt
# 	   └─ 🖿 EtroTech spairaru.bash
# 	      └─ 🖺 spairaru.sh
# 	🛠️
# 	├─ 🖿 etc
# 	│  └─ 🖿 EtroTech spairaru.bash
# 	│     ├─ 🖺 *.env
# 	│     ├─ 🖺 s.cnf
# 	│     └─ 🖺 *.ini
# 	├─ 🖿 $HOME
# 	│  └─ 🖿 .s.bash
# 	│     ├─ 🖺 *.env
# 	│     ├─ 🖺 s.cnf
# 	?     └─ 🖺 *.ini
# 	└─ 🖿 $PWD
# 	   └─ 🖿 .s.bash
# 	      ├─ 🖺 *.env
# 	      └─ 🖺 s.cnf
# 	      └─ 🖺 *.ini
# 	📄
# 	└─ 🖿 var
# 	   └─ 🖿 log
# 	      └─ 🖿 EtroTech spairaru.bash
# 	🗑️
# 	└─ 🖿 tmp
# 	   └─ 🖿 EtroTech spairaru.bash
#
# ######################################################################################

Spairaru() {


# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# HIERARCHIC STATIC PRIVATE FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# GET CONPONENT LOADERS
# ======================================================================================
	__gtCpntLdrx() {


		# POSITIONED ARGUMENT --------

		# [ requirements ]
		local -a rqrmtx__=("$@") ;


		# PRECHECK : ALIASES --------

		[[ -z "${__s_cpnt_akax__[@]}" ]] \
		&& return $fls \
		;


		# MAIN PROCESSES --------

		# [ loaders ]
		local -n __ldrx=_ldrx ;


		for (( i=0 ; i<${#rqrmtx__[@]} ; i++ )) ;
		do


			# [ key ]
			local _ky ;


			# [ key ]
			for ky in "${!__s_cpnt_akax__[@]}" ;
			do


				# If utility group name is matches Controller or one of its aliases,
				# then set _Ctlr as Controller .

				[[ ! "${rqrmtx__[$i]}" =~ ^(${__s_cpnt_akax__[$ky]})$ ]] \
				&& continue \
				|| _ky=$ky \
				;


				# [ loader ]
				local _ldr="${__s_cpnt_ldr__[$_ky]}" ;


				# Avoid below conditions.

				# - loader( path ) is not giving
				# - loader( path ) is already loaded
				[[ \
					-z "$_ldr" \
					|| ${__s_cpnt_ldd__[$_ldr]} == $tru \
				]] \
				&& break \
				;


				[[ "${__ldrx[@]}" =~ "$_ldr" ]] \
				&& continue \
				;


				__ldrx+=($_ldr) ;


				# Load requirements.

				[[ -z "${__s_cpnt_rqrmtx__[$_ky]}" ]] \
				&& continue \
				;


				__gtCpntLdrx \
					${__s_cpnt_rqrmtx__[$_ky]} \
				;


			done ;


		done ;


		# POST PROCESS : REPORT STATUS --------

		return $tru ;


	} ;



# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# DEFAULT STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# CONSTRUCTOR
# ======================================================================================


	# HELP --------

	s_isHlp \
		"$@" \
	&& . \
		"${BASH_SOURCE[0]%/*}"/co/mm/sHlp.sh \
	&& return $tru \
	;


	# VERSION --------

	s_isVer \
		"$@" \
	&& . \
		"${BASH_SOURCE[0]%/*}"/co/mm/sVer.sh \
	&& return $tru \
	;


	# ARGUMENTS --------

	# [ arguments ]
	local -a __ax__=("$@") ;


	# POSITIONED ARGUMENT --------

	# [ positoined_arguments ]
	local -a _pax=` \
		s_gtCblPax \
			-- __ax__ \
	` ;


	# [ method ]
	local mtd__="${_pax[0]}" ;

	# [ controller ]
	local UtlGrp__="${_pax[0]}" ;


	# PROCESS MAGIC : METHOD --------

	# - method is set
	if [[ "$mtd__" ]] ;
	then


		# [ method ]
		local _mtd ;


		case "$mtd__" in


			# HIERARCHIC

			cpnt | conponent )

				_mtd="${BASH_SOURCE[0]%/*}/co/mm/sCpnt.sh" ;;


			# BASIC

			pf | path )

				echo "${BASH_SOURCE[0]}" ;

				return $tru ;;


		esac ;


		# - controller is not empty
		if [[ "$_mtd" ]] ;
		then


			shift 1 \
			&& . \
				"$_mtd" \
				"$@" \
			;


			return $? ;


		fi ;


	fi ;


	# NAMED ARGUMENT --------

	# [ named_arguments ]
	local -A _nax=` \
		s_gtCblNax \
			--nfc "F" "enforce" \
			--nfc-dflt "$env_nfc" \
			\
			--vbo "V" "verbose" \
			--vbo-dflt "$env_vbo" \
			\
			--vbo_ttl "Vt" "verbose_title" \
			--vbo_ttl-nov 1 \
			--vbo_ttl-dflt "$env_vbo_ttl" \
			\
			\
			-- __ax__ \
	` ;


	# [ environment_enforce ]
	local env_nfc="${_nax[nfc]}" ;

	# [ environment_verbose ]
	local env_vbo="${_nax[vbo]}" ;

	# [ environment_verbose_title ]
	local env_vbo_ttl="${_nax[vbo_ttl]}" ;


	# PRE PROCESS : VERBOSE --------

	# [ environment_verbose_title ]
	local _env_vbo_ttl ;

	[[ -n "$env_vbo_ttl" ]] \
	&& _env_vbo_ttl="${ANSI_F_BL}${env_vbo_ttl}${_ANSI} " \
	;


	# MAIN PROCESS : METHOD --------

	# - method is set
	if [[ "$mtd__" ]] ;
	then


		# [ controller ]
		local _Ctlr ;


		case "$mtd__" in


			# CONFIGURATIVE

			cfg | configure ) _Ctlr=SpairaruCtlr_Cfgtv ;;


			# PAKAGE

			istl | install ) _Ctlr=SpairaruCtlr_Pkg ;;

			uistl | uninstall ) _Ctlr=SpairaruCtlr_Pkg ;;

			upg | upgrade ) _Ctlr=SpairaruCtlr_Pkg ;;


		esac ;


		# - controller is not empty
		if [[ "$_Ctlr" ]] ;
		then


			$_Ctlr \
				"$@" \
			;


			return $? ;


		fi ;


	fi ;


	# MAIN PROCESS : CONPONENT --------

	# - controller is set
	if [[ $UtlGrp__ ]] ;
	then


		# [ controller ]
		local _Ctlr ;


		if [[ "${__s_cpnt_akax__[@]}" ]] ;
		then

			# [ key ]
			for ky in "${!__s_cpnt_akax__[@]}" ;
			do


				# If utility group name is matches Controller or one of its aliases,
				# then set _Ctlr as Controller .

				[[ ! $UtlGrp__ =~ ^(${__s_cpnt_akax__[$ky]})$ ]] \
				&& continue \
				|| _Ctlr=$ky \
				;


				# [ loader ]
				local _ldr="${__s_cpnt_ldr__[$ky]}" ;


				# Avoid below conditions.

				# - loader( path ) is not giving
				# - loader( path ) is already loaded
				[[ \
					-z "$_ldr" \
					|| ${__s_cpnt_ldd__[$_ldr]} == $tru \
				]] \
				&& break \
				;


				# Execute loader.

				. "$_ldr" ;


				# Update loading information.

				__s_cpnt_ldd__[$_ldr]=$tru ;


				# Load requirements.

				[[ -z "${__s_cpnt_rqrmtx__[$ky]}" ]] \
				&& break \
				;


				# [ loader ]
				local -a _ldrx=() ;


				__gtCpntLdrx \
					"${__s_cpnt_rqrmtx__[$ky]}" \
				;


				for (( i=0 ; i<${#_ldrx[@]} ; i++ )) ;
				do


					_ldr="${_ldrx[$i]}" ;


					. "$_ldr" ;


					__s_cpnt_ldd__[$_ldr]=$tru ;


				done ;


			done ;

		fi ;


		# - controller is not empty
		if [[ "$_Ctlr" ]] ;
		then


			shift 1 \
			&& "$_Ctlr" \
				"$@" \
			;


			return $? ;


		fi ;


	fi ;


	# POST PROCESS : REPORT STATUS --------

	return $fls ;


} ;




# ######################################################################################
# ALIAS : SPAIRARU
# ######################################################################################
unalias \
	spairaru \
	&>/dev/null \
;

spairaru() {


	# MAIN PROCESSES --------

	Spairaru \
		"$@" \
	;


	# POST PROCESS : REPORT STATUS --------

	return $? ;


} ;




# ######################################################################################
# ALIAS : S
# ######################################################################################
unalias \
	s \
	&>/dev/null \
;

s() {


	# MAIN PROCESSES --------

	Spairaru \
		"$@" \
	;


	# POST PROCESS : REPORT STATUS --------

	return $? ;


} ;




# ######################################################################################
# MAGIC METHODS
# ######################################################################################

case "$1" in


	# A ) PATH 

	pf | path )

		echo "${BASH_SOURCE[0]}" ;;


	# B ) OVERRIDE

	ovr | override )

		. "${BASH_SOURCE[0]%/*}/co/sOvr.sh" ;;


	# C ) PRELOAD

	prld | preload )

		. \
			"${BASH_SOURCE[0]%/*}/co/sPrld.sh" \
			"$@" \
		;;

	
	# ? ) FALLBACK

	* )


		. "${BASH_SOURCE[0]%/*}"/co/sPrld.sh ;


		s \
			"$@" \
		;;


esac ;
