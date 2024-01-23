#!/usr/bin/env bash
# ######################################################################################
# LOGROTATE PROFILE MODEL UTILITY GROUP
# ######################################################################################
LogRotPrflCtlr() {


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
	LogRotPrflCtlr__co() {


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
	LogRotPrflCtlr__uc() {


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
	LogRotPrflCtlr__rmrk() {


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
# ROTATE
# 
# Description:
# 	TAdd or Remove rotation rules to cofiguration file.
#
# ======================================================================================
	LogRotPrflCtlr__rot() {


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

		# [ log_paths ]
		local -a log_pfx__=` \
			spairaru \
				cbl \
					pax \
		` ;


		# NAMED ARGUMENT --------

		# [ named_arguments ]
		local -A _nax=` \
			spairaru \
				cbl \
					nax \
						--cmprs "compress" \
						\
						--itrvl "interval" \
						--itrvl-nov 1 \
						--itrvl-dflt "daily" \
						\
						--mxsz "max_size" \
						--mxsz-nov 1 \
						--mxsz-dflt "30M" \
						\
						--rti "retain" \
						--rti-nov 1 \
						--rti-dflt 7 \
						\
						--aftRot "after_rotate" \
						--aftRot-nov 1 \
						--aftRot-xasgmt \
						--aftRot_rsyslog "rsyslog" \
		` ;


		# [ compress ]
		local cmprs="${_nax[cmprs]}" ;

		# [ interval ]
		local itrvl="${_nax[itrvl]}" ;

		# [ max_size ]
		local mxsz="${_nax[mxsz]}" ;

		# [ retain ]
		local rti="${_nax[rti]}" ;


		# [ after_rotates ]
		local -a aftRotx="${_nax[aftRot]}" ;

		# [ rsyslog ]
		[[ "${_nax[aftRot_rsyslog]}" ]] \
		&& aftRotx+=('/usr/lib/rsyslog/rsyslog-rotate &>/dev/null') \
		;


		# PRECHECK : LOG PATH --------

		if [[ -z "$log_pfx__" ]] ;
		then 


			[[ $env_vbo == $tru ]] \
			&& spairaru \
				ppt \
					ivk \
						CblMpa \
						"Log Paths" \
						--pos "1+" \
			;


			return $fls ;


		fi ;


		# MAIN PROCESS : BUILD CONTENTS --------

		# [ lanes ]
		local _lnx ;


		# PATHS

			for pf in "${log_pfx__[@]}" ;
			do 

				_lnx+=("$pf") ;

			done ;


		_lnx+=("\{") ;


		# ROTATION

			# rotation interval.
			_lnx+=("\t${itrvl}") ;

			# retain files.
			_lnx+=("\trotate ${rti}") ;


		# SIZE

			if [[ -n "$mxsz" ]] ;
			then
				
				# if the file not reaching the size, do not rotate.
				_lnx+=("\tmaxsize ${mxsz}") ;

			fi ;


		# COMPRESS

			if [[ $cmprs == $tru ]] ;
			then

				# compress rotated file.
				_lnx+=("\tcompress") ;
				_lnx+=("\tdelaycompress") ;

			fi ;


		# ALTERNATIVES

			# start a new file if file is missing.
			_lnx+=("\tmissingok") ;

			# not rotate the log if it is empty.
			_lnx+=("\tnotifempty") ;

			# this apply to when path is not single.
			[[ "${#log_pfx__[@]}" -gt 1 ]] \
			&& _lnx+=("\tsharedscripts") \
			;


		# AFTER ROTATE

			if [[ "${aftRotx[@]}" ]] ;
			then


				_lnx+=("\tpostrotate") ;


				for scr in "${aftRotx[@]}" ;
				do

					[[ "${scr}" ]] \
					&& _lnx+=("\t\t${scr}") \
					;

				done ;


				_lnx+=("\tendscript") ;


			fi ;


		_lnx+=('\}\^\|') ;


		# MAIN PROCESS : EDIT PROFILE --------

		s_aplyDocAtnx \
			"$prfl_fl_abs_pf" \
			$atn \
			"${_lnx[@]}" \
			"${_doc_optx[@]}" \
		;

		_rslt=$? ;


		# POST PROCESS : DISPLAY MESSAGE --------

		[[ $env_vbo == $tru ]] \
		&& spairaru \
			ppt \
				ivk \
					DocMnpAtnx \
						--atn $atn \
						\
						--stt $_rslt \
						\
						--tgt_cat "rotaion rule" \
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
	LogRotPrflCtlr__ers() {


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
	LogRotPrflCtlr__wrt() {


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
		s_gtLogRotPrflPf \
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
					s_gtLogRotPrflPf \
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


		# - file its spairaru
		[[ \
			"` \
			basename \
				"$prfl_fl_abs_pf" \
			`" \
			== "$S_S_CLI" \
		]] \
		&& LogRotPrflCtlr__rmrk \
			"$S_RMRK" \
			--hdr \
		;


	fi ;


	# MAIN PROCESS : METHOD --------

	# [ method ]
	local _mtd ;


	case "$mtd__" in


		# ALTERNATIVE

		co | commentout ) _mtd=LogRotPrflCtlr__co ;;

		uc | uncomment ) _mtd=LogRotPrflCtlr__uc ;;

		rmrk | remark ) _mtd=LogRotPrflCtlr__rmrk ;;


		# CORE

		rot | rotate ) _mtd=LogRotPrflCtlr__rot ;;


		# I/O

		ers | erase ) _mtd=LogRotPrflCtlr__ers ;;

		wrt | write ) _mtd=LogRotPrflCtlr__wrt ;;


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
