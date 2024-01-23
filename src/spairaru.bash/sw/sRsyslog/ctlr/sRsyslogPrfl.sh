#!/usr/bin/env bash
# ######################################################################################
# REMOTE SYSTEM LOG PROFILE MODEL UTILITY GROUP
# ######################################################################################
RmtSysLogPrflCtlr() {


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
	RmtSysLogPrflCtlr__co() {


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
	RmtSysLogPrflCtlr__uc() {


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
	RmtSysLogPrflCtlr__rmrk() {


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
# FILTER
# 
# Description:
# 	Add or Remove relocation rules in cofiguration file.
#
# ======================================================================================
	RmtSysLogPrflCtlr__fltr() {


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


		# [ filter_action ]
		local fltr_atn__="${_pax[0]}" ;


		# NAMED ARGUMENT --------

		# [ named_arguments ]
		local -A _nax=` \
			spairaru \
				cbl \
					nax \
						--fac "facility" \
						--fac-nov 1 \
						--prio "p" "priority" \
						--prio-nov 1 \
						--prio-dflt "*" \
						--fmt-nov 1 \
						--and "n" \
						--and-nov 3 \
						--and-xasgmt \
						--or "o" \
						--or-nov 3 \
						--or-xasgmt \
						--tpl "t" "template" \
						--tpl-nov 1 \
						--fmt "f" "format" \
						--mk_fl "make_file" \
						--sp "s" "stop" \
		` ;
				# --fmt-dflt "RSYSLOG_FileFormat" \


		# [ facility ]
		local fac="${_nax[fac]}" ;

		# [ priority ]
		local prio="${_nax[prio]}" ;


		# [ and ]
		local -a _nx="${_nax[and]}" ;

		# [ or ]
		local -a _ox="${_nax[or]}" ;


		# [ template ]
		local tpl="${_nax[tpl]}" ;

		# [ format ]
		local fmt="${_nax[fmt]}" ;


		# [ make_file ]
		local mk_fl="${_nax[mk_fl]}" ;

		# [ stop ]
		local sp="${_nax[sp]}" ;


		# PRECHECK : LOG PATH --------

		if [[ -z "$fltr_atn__" ]] ;
		then 


			[[ $env_vbo == $tru ]] \
			&& spairaru \
				ppt \
					ivk \
						CblMpa \
						"Filter Action" \
						--pos "1st" \
			;


			return $fls ;


		fi ;


		# MAIN PROCESS : BUILD ENTRY --------

		# [ lanes ]
		local -a _lnx ;

		# [ index ]
		local _idx=0 ;


		# A ) FACILITY BASED FILTER
		# 	<facility>.<priority> <action>;<format>

		# - facility is set
		if [[ "$fac" ]] ;
		then

			_lnx[$_idx]="${fac}.${prio} " ;


		# B ) PROPERTY BASED FILTER
		# traditional
		# 	:<property>, <comperator>, <condition> <action>;<format>
		#
		# expression-based
		# 	if $<property> <comperator> <condition> then <action>;<format>

		elif [[ ${#_nx[@]}+${#_ox[@]} -gt 1 ]] ;
		then

			# - number of condition is 1
			if [[ ${#_nx[@]}+${#_ox[@]} -eq 1 ]] ;
			then


				[[ ${#_nx[@]} -gt 1 ]] \
				&& local -a _xprsn="${_nx[0]}" \
				|| local -a _xprsn="${_ox[0]}" \
				;


				_lnx[$_idx]=":${_xprsn[0]}, `RmtSysLogPrflCtlr____gtCmprtr "${_xprsn[1]}"`, \"${_xprsn[2]}\" " ;


			# - number of condition is more than 1
			else


				# [ conditions ]
				local -a _cndx ;

				# [ and_count ]
				local _n_ct=0 ;

				# [ or_count ]
				local _o_ct=0 ;


				_lnx[$_idx]="if " ;


				# [ arguemnt ]
				for a in "${_ax[@]}" ;
				do

					# - not start with dash
					[[ ! "$a" =~ ^- ]] \
					&& continue \
					;


					if [[ " -n --and " =~ "$a" ]] ;
					then


						[[ $_n_ct+$_o_ct -gt 0 ]] \
						&& _lnx[$_idx]+="and " \
						;


						local -a _xprsn="${_nx[$_n_ct]}" ;

						(( _n_ct ++ )) ;


					elif [[ " -o --or " =~ "$a" ]] ;
					then


						[[ $_n_ct+$_o_ct -gt 0 ]] \
						&& _lnx[$_idx]+="or " \
						;


						local -a _xprsn="${_nx[$_o_ct]}" ;

						(( _o_ct ++ )) ;


					else 

						continue ;


					fi ;


					[[ "${_xprsn[@]}" ]] \
					&& _lnx[$_idx]+="\\(\\\$${_xprsn[0]} `RmtSysLogPrflCtlr____gtCmprtr "${_xprsn[1]}"` \"${_xprsn[2]}\"\\) " \
					;


				done ;


				_lnx[$_idx]+="\\\\" ;

				(( _idx ++ )) ;


				_lnx[$_idx]+="then " ;


			fi ;

		fi ;


		# - filter_action is path
		if ` \
			echo $fltr_atn__ \
			| grep \
				-Pq \
				'.*\/.*' \
		` ;
		then

			# - make_file option is enabled
			[[ $mk_fl == $tru ]] \
			&& _lnx[$_idx]+="-${fltr_atn__}" \
			|| _lnx[$_idx]+="${fltr_atn__}" \
			;


		# - otherwise
		else

			# filter_action is special charactor
			[[ " ~ stop " =~ " ${fltr_atn__} " ]] \
			&& _lnx[$_idx]+="${fltr_atn__}" \
			|| _lnx[$_idx]+="?${fltr_atn__}" \
			;


		fi ;


		[[ "$fmt" ]] \
		&& _lnx[$_idx]+=";${fmt}" \
		;


		if [[ $sp == $tru ]] ;
		then

			_lnx+=("& stop") ;

			(( _idx ++ )) ;

		fi ;


		# MAIN PROCESS : EDIT PROFILE --------

		s_aplyDocAtnx \
			"$prfl_fl_abs_pf" \
			$atn \
			"${_lnx[@]}" \
			"${_doc_optx[@]}" \
		;

		_rslt=$? ;


		# POST PROCESS : DISPLAY MESSAGE --------

		# - action is not query
		# - verbose is enabled
		[[ \
			$atn != "qry" \
			&& $env_vbo == $tru \
		]] \
		&& spairaru \
			ppt \
				ivk \
					DocMnpAtnx \
						--atn $atn \
						\
						--stt $_rslt \
						\
						--tgt_cat "relocation rule" \
						--tgt_ttl "$vbo_ttl" \
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
# FORMAT
# 
# Description:
# 	Add or Remove format sets in cofiguration file.
#
# ======================================================================================
	RmtSysLogPrflCtlr__fmt() {


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


		# [ label ]
		local lbl__="${_pax[0]}" ;

		# [ text ]
		local txt__="${_pax[1]}" ;


		# PRECHECK : LABEL --------

		if [[ -z "$lbl__" ]] ;
		then 


			[[ $env_vbo == $tru ]] \
			&& spairaru \
				ppt \
					ivk \
						CblMpa \
						"Format Label" \
						--pos "1st" \
			;


			return $fls ;


		fi ;


		# PRECHECK : FORMAT TEXT --------

		if [[ -z "$txt__" ]] ;
		then 


			[[ $env_vbo == $tru ]] \
			&& spairaru \
				ppt \
					ivk \
						CblMpa \
						"Format Text" \
						--pos "2nd" \
			;


			return $fls ;


		fi ;


		# MAIN PROCESS : BUILD ENTRY --------

		# [ entry ]
		local _nty="\\\$template ${lbl__}, ${txt__}" ;


		# MAIN PROCESS : EDIT PROFILE --------

		s_aplyDocAtnx \
			"$prfl_fl_abs_pf" \
			$atn \
			"$_nty" \
			"${_doc_optx[@]}" \
		;

		_rslt=$? ;


		# POST PROCESS : DISPLAY MESSAGE --------

		# - action is not query
		# - verbose is enabled
		[[ \
			$atn != "qry" \
			&& $env_vbo == $tru \
		]] \
		&& spairaru \
			ppt \
				ivk \
					DocMnpAtnx \
						--atn $atn \
						\
						--stt $_rslt \
						\
						--tgt_cat "format set" \
						--tgt_ttl "$lbl__" \
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
# TEMPLATE
# 
# Description:
# 	Add or Remove tempalte sets in cofiguration file.
#
# ======================================================================================
	RmtSysLogPrflCtlr__tpl() {


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


		# [ label ]
		local lbl__="${_pax[0]}" ;

		# [ log_path ]
		local log_pf__="${_pax[1]}" ;


		# PRECHECK : LABEL --------

		if [[ -z "$lbl__" ]] ;
		then 


			[[ $env_vbo == $tru ]] \
			&& spairaru \
				ppt \
					ivk \
						CblMpa \
						"Tempalte Label" \
						--pos "1st" \
			;


			return $fls ;


		fi ;


		# PRECHECK : LOG PATH --------

		if [[ -z "$log_pf__" ]] ;
		then 


			[[ $env_vbo == $tru ]] \
			&& spairaru \
				ppt \
					ivk \
						CblMpa \
						"Log Path" \
						--pos "2nd" \
			;


			return $fls ;


		fi ;


		# MAIN PROCESS : BUILD ENTRY --------

		# [ entry ]
		local _nty="\\\$template ${lbl__}, ${log_pf__}" ;


		# MAIN PROCESS : EDIT PROFILE --------

		s_aplyDocAtnx \
			"$prfl_fl_abs_pf" \
			$atn \
			"$_nty" \
			"${_doc_optx[@]}" \
		;

		_rslt=$? ;


		# POST PROCESS : DISPLAY MESSAGE --------

		# - action is not query
		# - verbose is enabled
		[[ \
			$atn != "qry" \
			&& $env_vbo == $tru \
		]] \
		&& spairaru \
			ppt \
				ivk \
					DocMnpAtnx \
						--atn $atn \
						\
						--stt $_rslt \
						\
						--tgt_cat "template set" \
						--tgt_ttl "$lbl__" \
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
# CORE PRIVATE FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# __GET COMPERATOR
# ======================================================================================
	RmtSysLogPrflCtlr____gtCmprtr() {


		if [[ " = == eq equal " =~ " $1 " ]] ;
		then

			echo "isequal" ;


		elif [[ " ^ sw startswith " =~ " $1 " ]] ;
		then

			echo "startswith" ;


		elif [[ " =~ rgx regex " =~ " $1 " ]] ;
		then

			echo "regex" ;


		else 

			echo "contains" ;


		fi ;


	} ;



# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# I/O STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# ERASE
# 
# Description:
# 	Remove lanes from cofiguration file.
#
# ======================================================================================
	RmtSysLogPrflCtlr__ers() {


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
	RmtSysLogPrflCtlr__wrt() {


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
					--prfl_fl_abs_pf "fl" "file" "pf" "path" \
					--prfl_fl_abs_pf-nov 1 \
					\
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
					\
					--vbo_ttl "vt" "verbose_title" \
					--vbo_ttl-nov 1 \
	` ;


	# [ profile_file_absolute_path ]
	local prfl_fl_abs_pf="${_nax[prfl_fl_abs_pf]}" ;

	# [ profile_scope ]
	local prfl_scp="${_nax[prfl_scp]}" ;

	# [ action ]
	local atn="${_nax[atn]}" ;


	# [ verbose_title ]
	local vbo_ttl="${_nax[vbo_ttl]}" ;


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


	# PRE PROCESS : PROFILE TITLE --------

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
				s_gtRsyslogRotPrflPf \
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


	# PRE PROCESS : DOCUMENT OPTIONS --------

	# [ document_options ]
	local -a _doc_optx=` \
		s_gtDocOptx \
			"$@" \
	` ;


	# PRE PROCESS : PROFILE --------

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


		# - file its 50-spairaru.conf
		[[ \
			"` \
			basename \
				"$prfl_fl_abs_pf" \
			`" \
			== "50-spairaru.conf" \
		]] \
		&& RmtSysLogPrflCtlr__rmrk \
			"$S_RMRK" \
			--hdr \
		;


	fi ;


	# MAIN PROCESS : METHOD --------

	# [ method ]
	local _mtd ;


	case "$mtd__" in


		# ALTERNATIVE

		co | commentout ) _mtd=RmtSysLogPrflCtlr__co ;;

		uc | uncomment ) _mtd=RmtSysLogPrflCtlr__uc ;;

		rmrk | remark ) _mtd=RmtSysLogPrflCtlr__rmrk ;;


		# CORE

		fltr | filter ) _mtd=RmtSysLogPrflCtlr__fltr ;;

		fmt | format ) _mtd=RmtSysLogPrflCtlr__fmt ;;

		tpl | template ) _mtd=RmtSysLogPrflCtlr__tpl ;;


		# I/O

		ers | erase ) _mtd=RmtSysLogPrflCtlr__ers ;;

		wrt | write ) _mtd=RmtSysLogPrflCtlr__wrt ;;


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

	return $fls ;


} ;
