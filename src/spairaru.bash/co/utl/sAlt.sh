#!/usr/bin/env bash
# ######################################################################################
# ALTERNATIVE UTILITY
# ######################################################################################
# ======================================================================================
# IS HELP
# ======================================================================================
s_isHlp() {


	[[ $1 =~ ^(-h|--hlp|--help)$ ]] \
	&& return $tru \
	|| return $fls \
	;


} ;



# ======================================================================================
# IS VERSION
# ======================================================================================
s_isVer() {


	[[ $1 =~ ^(-v|--ver|--version)$ ]] \
	&& return $tru \
	|| return $fls \
	;


} ;



# ======================================================================================
# GET PROFILE TITLE
# ======================================================================================
s_gtPrflTtl() {



	# [ arguments ]
	local -a _ax=("$@") ;

	# [ result ]
	local _rslt=$tru ;


	# HELP --------

	[[ $1 =~ ^(-h|--hlp|--help)$ ]] \
	&& return $tru \
	;


	# VERSION --------

	[[ $1 =~ ^(-v|--ver|--version)$ ]] \
	&& return $tru \
	;


	# POSITIONED ARGUMENT --------

	# [ profile ]
	local prfl__ ;

	# [ index ]
	for i in "${!_ax[@]}" ;
	do


		# - start with dash
		[[ "${_ax[$i]}" =~ ^- ]] \
		&& break \
		;


		# profile
		[[ $i == 0 ]] \
		&& prfl__="${_ax[$i]}" \
		&& continue \
		;


	done ;


	# PRE PROCESS : ICON --------

	[[ -z "$prfl__" ]] \
	&& return $fls \
	;


	# MAIN PROCESS : ICON --------

	case "$prfl__" in


		# default 
		dflt | default ) printf "default" ;;

		# global
		glo | global ) printf "global" ;;

		# local
		lo | local ) printf "local" ;;

		# custom
		cstm | custom ) printf "custom" ;;


		# otherwise
		* ) printf "local" ;;


	esac ;


	# POST PROCESS : REPORT STATUS --------

	return $_rslt ;


} ;



# ======================================================================================
# GET ICON
# ======================================================================================
s_gtIco() {


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


	# [ icon ]
	local ico__="${_pax[0]}" ;


	# PRE PROCESS : ICON --------

	[[ -z "$ico__" ]] \
	&& return $fls \
	;


	# MAIN PROCESS : ICON --------

	case "$ico__" in


		# 🟄
		# headline_box
		hlbx | headline_box ) printf "🟄" ;;

		# ☐
		# section_box
		secbx | section_box ) printf "☐ " ;;

		# 😀
		# sccuess_box
		sucbx | sccuess_box ) printf "😀 " ;;

		# 😵
		# failure_box
		flbx | failure_box ) printf "😵 " ;;

		# 🗹 ☑
		# ok_box
		okbx | ok_box ) printf "☑ " ;;

		# ⮽ ☒
		# no_box
		nobx | no_box ) printf "☒ " ;;

		# ⦼
		# loading_box
		ldbx | loading_box ) printf "" ;;


		# 📄🖺🖹🗎
		# file
		fl | file ) printf "🖹" ;;

		# 📁🖿
		# folder
		fldr | folder ) printf "🖿" ;;


		# †
		# grave
		grv | grave ) printf "† " ;;


		# 🌏🌐▩▦
		# internet
		inet | internet ) printf "🌐 " ;;


		# ⬌⇄⟷⥂⭤ ⇔↳🡦⬊⤡🡖129110⭦🡔
		# link
		lnk | link ) printf " 🡔🡖" ;;

		# ⤷→➔➨➥➞➝↳\055>⬊⬌🡖
		# transfer
		xfr | transfer ) printf " 🡖" ;;

		# 🡒
		# increase
		icr | increase ) printf "◆ 🡒" ;;

		# 🡐 129104
		# decrease
		dcr | decrease ) printf "◇ 🡐" ;;


		# 🐱
		# git
		git ) printf "" ;;


		# otherwise
		* ) _rslt=2 ;;


	esac ;


	# POST PROCESS : REPORT STATUS --------

	[[ $_rslt == 2 ]] \
	&& return $fls \
	|| return $_rslt \
	;


} ;



# ======================================================================================
# COMPARE VERSION
# ======================================================================================
s_compVer() {


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
		s_gtCblPax
	` ;


	# [left_version ]
	local l_ver__="${_pax[0]}" ;

	# [right_version ]
	local r_ver__="${_pax[1]}" ;


	# MAIN PROCESS : COMPARE --------

	if [[ "$l_ver__" == "$r_ver__" ]] ;
	then

		_rslt=$tru ;


	else

		# if left is greater, the result will be 1.
		# if equal or right is greater, the result will be 0.

		printf \
			'%s\n' \
				"$l_ver__" \
				"$r_ver__" \
		| sort \
			-C \
			-V \
		;

		_rslt=$? ;


		[[ $_rslt == $fls ]] \
		&& _rslt=$tru \
		|| _rslt=$fls \
		;


	fi ;


	# POST PROCESS : REPORT STATUS --------

	return $_rslt ;


} ;
