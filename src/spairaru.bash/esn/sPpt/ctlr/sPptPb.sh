#!/usr/bin/env bash
# ######################################################################################
# PROMPT PROGREE BAR CONTROLLER UTILITY GROUP
# ######################################################################################
PptPbCtlr() {


# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# CORE STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# OFF
# ======================================================================================
	PptPbCtlr__off() {


		# [ prompt_max_rows ]
		local _ppt_max_rowx=` s_gtTmlRowx ` ;


		# MAIN PROCESS : PROGRESS BAR --------

		# ↓ Remove progress bar.
		s_clrPptProcBr ;


		# MAIN PROCESS : SCROLLABLE AREA --------
		# Reset scroll height to maxinum height.

		s_stupPptSclBr \
			$_ppt_max_rowx \
		;


		# ↓ Scroll down a bit to avoid visual glitch.
		# e 			: enable interpretation of backslash escapes
		# n 			: do not output a newline
		echo \
			-en \
			'\n' \
		;


		s_clrPptSclBr ;


		# POST PROCESS : REPORT STATUS --------

		return $tru ;


	} ;



# ======================================================================================
# ON
# ======================================================================================
	PptPbCtlr__on() {


		# [ arguments ]
		local -a _ax=("$@") ;


		# POSITIONED ARGUMENT --------

		# [ positoined_arguments ]
		local -a _pax=` \
			s_gtCblPax \
		` ;


		# [ percentage ]
		local pct__="${_pax[0]}" ;


		# PRECHECK : PERCENTAGE --------

		if [[ \
			$pct__ \
			&& ! $pct__ =~ ^[0-9]+$ \
		]] ;
		then


			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_DfltRej \
				"Percentage is not numberic." \
			;


			return $fls ;


		fi ;


		# PRE PROCESS : PERCENTAGE --------

		[[ -z $pct__ ]] \
		&& pct__=0 \
		;


		# MAIN PROCESS : SCROLLABLE AREA --------
		# * when termial is resized, this will fire as well.

		s_chkPptSclBr ;


		# MAIN PROCESS : PROGRESS BAR --------

		s_renPptProcBr \
			$pct__ \
			\
			"$@" \
		;


		# POST PROCESS : REPORT STATUS --------

		return $? ;


	} ;



# ======================================================================================
# UPDATE
# ======================================================================================
	PptPbCtlr__upd() {


		# [ arguments ]
		local -a _ax=("$@") ;


		# POSITIONED ARGUMENT --------

		# [ positoined_arguments ]
		local -a _pax=` \
			s_gtCblPax \
		` ;


		# [ percentage ]
		local pct__="${_pax[0]}" ;


		# PRECHECK : PERCENTAGE --------

		if [[ -z "$pct__" ]] ;
		then 


			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_CblMpa \
				"Percentage" \
				--pos "1st" \
			;


			return $fls ;


		elif [[ ! $pct__ =~ ^[0-9]+$ ]] ;
		then


			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_DfltRej \
				"Percentage is not numberic." \
			;


			return $fls ;


		fi ;


		# MAIN PROCESS : SCROLLABLE AREA --------
		# * when termial is resized, this will fire as well.

		s_chkPptSclBr ;


		# MAIN PROCESS : PROGRESS BAR --------

		s_renPptProcBr \
			$pct__ \
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


		# [ controller ]
		local _Ctlr ;

		# [ method ]
		local _mtd ;


		case "$mtd__" in


			# CORE

			on ) _mtd=PptPbCtlr__on ;;

			off | off ) _mtd=PptPbCtlr__off ;;

			upd | updage ) _mtd=PptPbCtlr__upd ;;


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
