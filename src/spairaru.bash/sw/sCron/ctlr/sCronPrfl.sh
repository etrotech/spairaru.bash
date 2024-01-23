#!/usr/bin/env bash
# ######################################################################################
# CORN PROFILE CONTROLLER UTILITY GROUP
# ######################################################################################
CronPrflCtlr() {


# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ALTERNATIVE STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# COMMENT OUT
# 
# Description:
# 	Add comment remark to target lanes in cofiguration file.
#
# ======================================================================================
	CronPrflCtlr__co() {


		# MAIN PROCESSES --------

		spairaru \
			doc \
				co \
					$prfl_fl_abs_pf \
					"$@" \
		;


		# POST PROCESS : REPORT STATUS --------

		return $? ;


	} ;



# ======================================================================================
# UNCOMMENT
# 
# Description:
# 	Remove comment remark from target lanes in cofiguration file.
#
# ======================================================================================
	CronPrflCtlr__uc() {


		# MAIN PROCESSES --------

		spairaru \
			doc \
				uc \
					$prfl_fl_abs_pf \
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
	CronPrflCtlr__rmrk() {


		# MAIN PROCESSES --------

		spairaru \
			doc \
				rmrk \
					$prfl_fl_abs_pf \
					"$@" \
		;


		# POST PROCESS : REPORT STATUS --------

		return $? ;


	} ;



# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# CORE STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# TASK
# 
# Description:
# 	Add or Remove task in cron cofiguration files.
#
# ======================================================================================
	CronPrflCtlr__tsk() {


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
			spairaru \
				cbl \
					pax \
		` ;


		# [ command ]
		local cmd__="${_pax[0]}" ;


		# NAMED ARGUMENT --------

		# [ named_arguments ]
		local -A _nax=` \
			spairaru \
				cbl \
					nax \
						--mo "M" "mon" "month" \
						--mo-nov 1 \
						--mo-dflt "\*" \
						--day "D" \
						--day-nov 1 \
						--day-dflt "\*" \
						--hr "h" "hour" \
						--hr-nov 1 \
						--hr-dflt "\*" \
						--min "m" "minute" \
						--min-nov 1 \
						--min-dflt "\*" \
						--wk "w" "week" "dow" \
						--wk-nov 1 \
						--wk-dflt "\*" \
						--usr "u" "user" \
						--usr-nov 1 \
		` ;


		# [ month ]
		local mo="${_nax[mo]}" ;

		# [ day ]
		local day="${_nax[day]}" ;

		# [ hour ]
		local hr="${_nax[hr]}" ;

		# [ minute ]
		local min="${_nax[min]}" ;

		# [ week ]
		local wk="${_nax[wk]}" ;

		# [ user ]
		local usr="${_nax[usr]}" ;


		# PRECHECK : COMMAND --------

		# - its add action
		# - command is not set
		if [[ \
			$atn == "ad" \
			&& -z "$cmd__" \
		]] ;
		then 


			[[ $env_vbo == $tru ]] \
			&& spairaru \
				ppt \
					ivk \
						CblMpa \
						"Command" \
						--pos "1st" \
			;


			return $fls ;


		fi ;


		# PRECHECK : USER --------

		# - profile scope is not local
		if [[ $prfl_scp != "lo" ]] ;
		then

			# A ) User is Set

			if [[ "$usr" ]] ;
			then

				# - user is not in system
				if [[
					! " `\
						cut \
							-d: \
							-f1 \
							/etc/passwd\
					` " \
					=~ " $usr "
				]] ;
				then


					[[ $env_vbo == $tru ]] \
					&& spairaru \
						ppt \
							ivk \
								DfltRej \
								"user: %s does not exists." \
								"${ANSI_F_BL}${usr}${_ANSI}" \
					;


					return $fls ;

				fi ;


			# B ) User is no Set

			else

				usr=$USER ;


			fi ;

		fi ;


		# MAIN PROCESS : BUILD CONTENTS --------

		# [ entry ]
		local _nty ;


		# - profile scope is not local
		[[ $prfl_scp != "lo"  ]] \
		&& _nty="${min} ${hr} ${day} ${mo} ${wk} ${usr} ${cmd__}" \
		|| _nty="${min} ${hr} ${day} ${mo} ${wk} ${cmd__}" \
		;


		# MAIN PROCESS : EDIT PROFILE --------

		s_aplyDocAtnx \
			"$prfl_fl_abs_pf" \
			$atn \
			"$_nty" \
			"${_doc_optx[@]}" \
		;

		_rslt=$? ;


		# POST PROCESS : REPORT STATUS --------

		[[ $env_vbo == $tru ]] \
		&& spairaru \
			ppt \
				ivk \
					DocMnpAtnx \
						--atn $atn \
						\
						--stt $_rslt \
						\
						--tgt_cat "task" \
						--tgt_ttl "$env_vbo_ttl" \
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



# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# I/O STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# ERASE
# 
# Description:
# 	Add or Remove tempalte format to cofiguration file.
#
# ======================================================================================
	CronPrflCtlr__ers() {


		# MAIN PROCESSES --------

		spairaru \
			doc \
				ers \
					"$prfl_fl_abs_pf" \
					"$@" \
		;


		# POST PROCESS : REPORT STATUS --------

		return $?


	} ;



# ======================================================================================
# WRITE
# 
# Description:
# 	Add lanes to cofiguration file.
#
# ======================================================================================
	CronPrflCtlr__wrt() {


		# MAIN PROCESSES --------

		spairaru \
			doc \
				wrt \
					"$prfl_fl_abs_pf" \
					"$@" \
		;


		# POST PROCESS : REPORT STATUS --------

		return $?


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
		spairaru \
			cbl \
				pax \
	` ;


	# [ method ]
	local mtd__="${_pax[0]}" ;


	# NAMED ARGUMENT --------

	# [ named_arguments ]
	local -A _nax=` \
		spairaru \
			cbl \
				nax \
					--prfl_scp "scp" "scope" \
					--prfl_scp-nov 1 \
					--prfl_scp-opt-dflt "dflt" "defalt" \
					--prfl_scp-opt-lo "lo" "local" \
					--prfl_scp-opt-glo "glo" "global" \
					\
					--atn "action" \
					--atn-nov 1 \
					--atn-dflt "ad" \
					--atn-opt-ad "ad" "add" \
					--atn-opt-rm "rm" "remove" \
					--atn-opt-qry "qry" "query" \
					\
					--vbo_ttl "vt" "verbose_title" \
					--vbo_ttl-nov 1 \
	` ;


	# [ profile_scope ]
	local prfl_scp="${_nax[prfl_scp]}" ;

	# [ action ]
	local atn="${_nax[atn]}" ;

	# [ verbose_title ]
	local vbo_ttl="${_nax[vbo_ttl]}" ;


	# PRE PROCESS : DETERMINE PROFILE --------

	# [ profile_file_absolute_path ]
	local prfl_fl_abs_pf="` \
		s_gtCronPrflPf \
			"$@" \
	`" ;


	# PRECHECK : PROFILE EXISTENCE --------

	if [[ ! -f "$prfl_fl_abs_pf" ]] ;
	then


		[[ $env_vbo == $tru ]] \
		&& spairau \
			ppt \
				ivk \
					DfltRej \
					"%s%s has not found." \
					"$_env_vbo_ttl" \
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

	# - profile_path is giving
	# - profile_scope is not giving
	if [[ \
		-n "$prfl_fl_abs_pf" \
		&& -z "$prfl_scp" \
	]] ;
	then

		for scp in "dflt" "glo" "lo" ;
		do

			[[
				"` \
				s_gtCronPrflPf \
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


	# MAIN PROCESS : PROFILE --------

	if [[ $atn != "qry" ]] ;
	then


		# - file does not exists
		! spairaru \
			fl \
				ex \
					"$prfl_fl_abs_pf" \
		&& spairaru \
			fl \
				mk \
					"$prfl_fl_abs_pf" \
		;


		# - file its spairaru
		[[ \
			"` \
			basename \
				"$prfl_fl_abs_pf" \
			`" \
			== "$S_S_CLI" \
		]] \
		&& CronPrflCtlr__rmrk \
			"$S_RMRK" \
			--hdr \
		;


	fi ;


	# MAIN PROCESS : METHOD --------

	# [ method ]
	local _mtd ;


	case "$mtd__" in


		# ALTERNATIVE

		co | commentout ) _mtd=CronPrflCtlr__co ;;

		uc | uncomment ) _mtd=CronPrflCtlr__uc ;;

		rmrk | remark ) _mtd=CronPrflCtlr__rmrk ;;


		# CORE

		tsk | task ) _mtd=CronPrflCtlr__tsk ;;


		# I/O

		ers | erase ) _mtd=CronPrflCtlr__ers ;;

		wrt | write ) _mtd=CronPrflCtlr__wrt ;;


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


	# POST PROCESS : REPORT STATUS --------

	return $tru ;


} ;
