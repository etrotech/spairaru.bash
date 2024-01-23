#!/usr/bin/env bash
# ######################################################################################
# DOCUMENT CONTROLLER UTILITY GROUP
# ######################################################################################
DocCtlr() {


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
	DocCtlr__co() {


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

		# [ contents ]
		local -a _cntx=` \
			s_gtCblPax \
		` ;


		# NAMED ARGUMENT --------

		# [ named_arguments ]
		local -A _nax=` \
			s_gtCblNax \
				--ignr_itnd "ii" "ignore_intend" \
				\
				--mrk "mark" \
				--mrk-nov 1 \
				--mrk-dflt "#" \
				\
				--rpt "repeat" \
		` ;


		# [ ignore_intend ]
		local ignr_itnd="${_nax[ignr_itnd]}" ;

		# [ mark ]
		local mrk="${_nax[mrk]}" ;

		# [ repeat ]
		local rpt="${_nax[rpt]}" ;


		# PRECHECK : CONTENTS --------

		# - no giving contents
		# - document is empty
		if \
			[[ -z "${_cntx[@]}" ]] \
			|| DocCtlr__isMpty \
		;
		then

			return $tru ;

		fi ;


		# MAIN PROCESS : BUILD FLAGS --------

		# [ flags ]
		local _flgx="m" ;


		[[ $rpt == $tru ]] \
		&& _flgx="${_flgx}g" \
		;


		# MAIN PROCESS : BUILD CONDIFTIONS --------

		# [ options ]
		local -a _optx ;


		for cnt in "${_cntx[@]}" ;
		do

			# - ignore_intend is enabled
			if [[ $ignr_itnd == $tru ]] ;
			then

				# ▩ match
				# (^|\n) 					: capture start or new lane as 1st group
				# (\t+|[[:space:]]+|) 		: capture anything tab or space or none before mark as 2nd group
				# (.*) 						: capture anything after as 3rd group
				# ▨ replace
				# \1 						: 1st capture group
				# \2 						: 2nd capture group
				# \#[[:space:]] 			: mark and space
				# \3 						: 3rd capture group
				_optx+=(-e 's/(^|\n|\r\n)(\t+|[[:space:]]+|)('"$cnt"')/\1\2'"$mrk"' \3/'"$_flgx") ;

			else 

				# ▩ match
				# (^|\n) 					: capture start or new lane as 1st group
				# (.*) 						: capture anything after as 2nd group
				# ▨ replace
				# \1 						: 1st capture group
				# \#[[:space:]] 			: mark and space
				# \2 						: 2nd capture group
				_optx+=(-e 's/(^|\n|\r\n)('"$cnt"')/\1'"$mrk"' \2/'"$_flgx") ;

			fi ;

		done ;


		# MAIN PROCESS : COMMENT OUT --------

		# e 			: match condition
		# i 			: write into file
		# r 			: enable regex
		# z 			: as whole, default is by each lane
		sed \
			-i \
			-r \
			-z \
			"${_optx[@]}" \
			"$fl_abs_pf__" \
		;

		_rslt=$? ;


		# POST PROCESS : REPORT STATUS --------

		return $_rslt ;


	} ;



# ======================================================================================
# UNCOMMENT
# 
# Description:
# 	Remove comment remark from target lanes in cofiguration file.
#
# ======================================================================================
	DocCtlr__uc() {


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

		# [ contents ]
		local -a _cntx=` \
			s_gtCblPax \
		` ;


		# NAMED ARGUMENT --------

		# [ named_arguments ]
		local -A _nax=` \
			s_gtCblNax \
				--ignr_itnd "ii" "ignore_intend" \
				\
				--mrk "mark" \
				--mrk-nov 1 \
				--mrk-dflt "#" \
				\
				--rpt "repeat" \
		` ;


		# [ ignore_intend ]
		local ignr_itnd="${_nax[ignr_itnd]}" ;

		# [ mark ]
		local mrk="${_nax[mrk]}" ;

		# [ repeat ]
		local rpt="${_nax[rpt]}" ;


		# PRECHECK : CONTENTS --------

		# - no giving contents
		# - document is empty
		if \
			[[ -z "${_cntx[@]}" ]] \
			|| DocCtlr__isMpty \
		;
		then

			return $tru ;

		fi ;


		# MAIN PROCESS : BUILD FLAGS --------

		# [ flags ]
		local _flgx="m" ;


		[[ $rpt == $tru ]] \
		&& _flgx="${_flgx}g" \
		;


		# MAIN PROCESS : BUILD CONDIFTIONS --------

		# [ options ]
		local -a _optx ;


		for cnt in "${_cntx[@]}" ;
		do

			# - ignore_intend is enabled
			if [[ $ignr_itnd == $tru ]] ;
			then

				# ▩ match
				# (^|\n) 					: capture start or new lane as 1st group
				# (\t+|[[:space:]]+|) 		: capture anything tab or space or none before mark as 2nd group
				# \# 						: mark
				# ([[:space:]]+|) 			: with or without space as 3rd group
				# (.*) 						: capture anything after as 4th group
				# ▨ replace
				# \1 						: 1st capture group
				# \2 						: 2nd capture group
				# \3 						: 3rd capture group
				_optx+=(-e 's/(^|\n|\r\n)(\t+|[[:space:]]+|)'"$mrk"'([[:space:]]+|)('"$cnt"')/\1\2\4/'"$_flgx") ;

			else

				# ▩ match
				# (^|\n) 					: capture start or new lane as 1st group
				# \# 						: mark
				# ([[:space:]]+|) 			: with or without space as 2nd group
				# (.*) 						: capture anything after as 3rd group
				# ▨ replace
				# \1 						: 1st capture group
				# \3 						: 3rd capture group
				_optx+=(-e 's/(^|\n|\r\n)'"$mrk"'([[:space:]]+|)('"$cnt"')/\1\3/'"$_flgx") ;

			fi ;

		done ;


		# MAIN PROCESS : COMMENT OUT --------

		# e 			: match condition
		# i 			: write into file
		# r 			: enable regex
		# z 			: as whole, default is by each lane
		sed \
			-i \
			-r \
			-z \
			"${_optx[@]}" \
			"$fl_abs_pf__" \
		;

		_rslt=$? ;


		# POST PROCESS : REPORT STATUS --------

		return $_rslt ;


	} ;



# ======================================================================================
# REMARK
# 
# Description:
# 	Add or Remove remarks in cofiguration file.
#
# ======================================================================================
	DocCtlr__rmrk() {


		# [ arguments ]
		local -a _ax=("$@") ;

		# [ result ]
		local _rslt ;


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

		# [ positioned_arguments ]
		local -a _pax=` \
			s_gtCblPax \
		` ;


		# NAMED ARGUMENT --------

		# [ named_arguments ]
		local -A _nax=` \
			s_gtCblNax \
				--atn "action" \
				--atn-nov 1 \
				--atn-dflt "ad" \
				--atn-opt-ad "ad" "add" \
				--atn-opt-rm "rm" "remove" \
				--atn-opt-qry "qry" "query" \
				\
				--hdr "header" \
		` ;


		# [ action ]
		local atn="${_nax[atn]}" ;

		# [ header ]
		local hdr="${_nax[hdr]}" ;


		# PRECHECK : CONTENTS --------

		if [[ ! "${_pax[@]}" ]] ;
		then


			# 1 			: action
			# 2 			: argument title
			# pos 			: position
			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_CblMpa \
				"Contents" \
				--pos "2+" \


			return $fls ;


		fi ;


		# MAIN PROCESS : BUILD CONTENTS --------

		# [ contents ]
		local -a _cntx=` \
			s_coDocLnx \
				"${_pax[@]}"
		` ;


		# PRE PROCESS : BUILD OPTIONS --------

		# [ document_options ]
		local -a _doc_optx=` \
			s_gtDocOptx \
				"$@" \
		` ;


		# MAIN PROCESS : EDIT FILE --------

		# A ) Add Action

		if [[ $atn == "ad" ]] ;
		then

			[[ $hdr == $tru ]] \
			&& DocCtlr__wrt \
				"${_cntx[@]}" \
				"${_doc_optx[@]}" \
				--bfr "^" \
			|| DocCtlr__wrt \
				"$_lnbrk" \
				"${_cntx[@]}" \
				"${_doc_optx[@]}" \
			;


		# B ) Remove Action

		elif [[ $atn == "rm" ]] ;
		then

			[[ $hdr == $tru ]] \
			&& DocCtlr__ers \
				"${_cntx[@]}" \
				"${_doc_optx[@]}" \
			|| DocCtlr__ers \
				"$_lnbrk" \
				"${_cntx[@]}" \
				"${_doc_optx[@]}" \
			;


		# C ) Query Action

		else


			[[ $hdr != $tru ]] \
			&& echo "$lnbrk" \
			;


			# [ index ]
			for (( i=0 ; i < ${#_cntx[@]} ; i ++ )) ;
			do

				echo "${_cntx[$i]}" ;

			done ;


			[[ $hdr == $tru ]] \
			&& echo "$lnbrk" \
			;


		fi ;


		_rslt=$? ;


		# POST PROCESS : REPORT STATUS --------

		return $_rslt ;


	} ;


# ======================================================================================
# LINEBREAK
# 
# Description:
# 	Add or Remove remarks in cofiguration file.
#
# ======================================================================================
	DocCtlr__lnbrk() {


		# MAIN PROCESSES --------

		s_gtDocLnBrkChr \
			"$fl_abs_pf__" \
		;


		# POST PROCESS : REPORT STATUS --------

		return $? ;


	} ;



# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# I/O STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# WRITE
# ======================================================================================
	DocCtlr__wrt() {


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

		# [ positioned_arguments ]
		local -a _pax=` \
			s_gtCblPax \
		` ;


		# NAMED ARGUMENT --------

		# [ named_arguments ]
		local -A _nax=` \
			s_gtCblNax \
				--aft "after" \
				--aft-nov 1 \
				--bfr "before" \
				--bfr-nov 1 \
				--rplc "replace" \
				--rplc-nov 1 \
				\
				--rpt "repeat" \
		` ;


		# [ after ]
		local aft="${_nax[aft]}" ;

		# [ before ]
		local bfr="${_nax[bfr]}" ;

		# [ replace ]
		local rplc="${_nax[rplc]}" ;

		# [ repeat ]
		local rpt="${_nax[rpt]}" ;


		# PRE PROCESS : BUILD CONTENTS --------

		# [ contents ]
		local _cntx="` \
			s_cnvDocLnx2Ln \
				"${_pax[@]}" \
		`" ;


		if [[ ! "${_cntx[@]}" ]] ;
		then


			# 1 			: action
			# 2 			: argument title
			# pos 			: position
			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_CblMpa \
				"Contents" \
				--pos "2nd+" \


			return $fls ;


		fi ;


		# PRECHECK : CONTENTS --------

		DocCtlr__hs \
			"$@" \
		&& [[ $nfc != $tru ]] \
		&& return $tru \
		;


		# MAIN PROCESS : DETERMINE FINDER --------

		# [ finder ]
		local _fd ;

		
		# i ) Before

		if [[ "$bfr" ]] ;
		then

			_fd="$bfr" ;

		# ii ) After

		elif [[ "$aft" ]] ;
		then

			_fd="$aft" ;


		# iii ) Replace

		elif [[ "$rplc" ]] ;
		then

			_fd="$rplc" ;


		fi ;


		# MAIN PROCESS : BUILD FLAGS --------

		# [ flags ]
		local _flgx="g" ;


		# # [ flags ]
		# local _flgx="m" ;


		# [[ $rpt == $tru ]] \
		# && _flgx="${_flgx}g" \
		# ;


		# MAIN PROCESS : ENTER POINT --------

		# - document is empty
		if DocCtlr__isMpty ;
		then

			echo \
				"" \
				> "$fl_abs_pf__" \
			;


		# - document is not empty

		else

			# ▩ match
			# \n\n 					: ends with double linebreak
			# $ 					: very end
			# ! 					: if above not
			# ▧ find
			# $ 					: very end
			# ▨ replace
			# \n 					: append new double linebreak
			sed \
				-i \
				-r \
				-z \
				-e '/'"${_lnbrk}${_lnbrk}"'$/! s/$/&'"${_lnbrk}"'/g' \
				"$fl_abs_pf__" \
			;


		fi ;


		# MAIN PROCESS : ESCAPE FINDER --------

		# [ escaped_finder ]
		local _xcpd_fd ;
		

		[[ "$_fd" ]] \
		&& _xcpd_fd="` \
			DocCtlr____cnvLn \
				"$_fd" \
		`" \
		&& _xcpd_fd="` \
			DocCtlr____xcpLn \
				"$_xcpd_fd" \
		`" \
		;


		# MAIN PROCESS : MATCH CONDITION --------

		# [ escaped_content ]
		local _xcpd_cntx ;


		_xcpd_cntx="` \
			DocCtlr____cnvLn \
				"$_cntx" \
		`" \
		&& _xcpd_cntx="` \
			DocCtlr____xcpLn \
				"$_xcpd_cntx" \
		`" \
		;


		# A ) Location Target Exists

		if [[ \
			"$_fd" \
			&& "` \
				sed \
					-n \
					-r \
					-z \
					-e 's/('"$_xcpd_fd"')/\1/p' \
					"$fl_abs_pf__" \
			`" \
		]] ; 
		then


			# i ) Before

			if [[ "$bfr" ]] ;
			then

				# ▧ find
				# (\n|\r\n|^) 			: previous linebreak or start
				# __condition__ 		: condition
				# ▨ replace
				# __contents__ 			: append new contents
				# \n 					: append new linebreak
				# & 					: include the whole matches
				sed \
					-i \
					-r \
					-z \
					-e 's/(\n|\r\n|^)'"$_xcpd_fd"'/'"${_xcpd_cntx}${_lnbrk}"'&/'"$_flgx" \
					"$fl_abs_pf__" \
				;


			# ii ) After

			elif [[ "$aft" ]] ;
			then

				# ▧ find
				# __condition__ 		: condition
				# (\n|\r\n|$) 			: next linebreak or end
				# ▨ replace
				# & 					: include the whole matches
				# __contents__ 			: append new contents
				# \n 					: append new linebreak
				sed \
					-i \
					-r \
					-z \
					-e 's/'"$_xcpd_fd"'(\n|\r\n|$)/&'"${_xcpd_cntx}${_lnbrk}"'/'"$_flgx" \
					"$fl_abs_pf__" \
				;


			# iii ) Replace

			elif [[ "$rplc" ]] ;
			then

				# ▧ find
				# (\n|\r\n|^) 			: capture star or linebreak to group 1
				# __condition__ 		: condition
				# ▨ replace
				# \1 					: group 1
				# __contents__ 			: replacement
				sed \
					-i \
					-r \
					-z \
					-e 's/(\n|\r\n|^)'"$_xcpd_fd"'/\1'"$_xcpd_cntx"'/'"$_flgx" \
					"$fl_abs_pf__" \
				;


			fi ;


		# B ) Location Target not Exists
		# otherwise append to the end of file.
		
		else

			# ▧ find
			# (\n|\r\n|) 			: capture the last linebreak to group 1
			# $ 					: very end
			# ▨ replace
			# \1 					: group 1
			# __contents__ 			: append new contents
			# \n\n 					: start new lane
			sed \
				-i \
				-r \
				-z \
				-e \
				's/(\n|\r\n|)$/'"${_xcpd_cntx}${_lnbrk}${_lnbrk}"'/'"$_flgx" \
				"$fl_abs_pf__" \
			;


		fi ;


		_rslt=$? ;


		# POST PROCESS : REPORT STATUS --------

		return $_rslt ;


	} ;



# ======================================================================================
# ERASE
# ======================================================================================
	DocCtlr__ers() {


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

		# [ positioned_arguments ]
		local -a _pax=` \
			s_gtCblPax \
		` ;


		# NAMED ARGUMENT --------

		# [ named_arguments ]
		local -A _nax=` \
			s_gtCblNax \
				--aft "after" \
				--aft-nov 1 \
				--bfr "before" \
				--bfr-nov 1 \
				\
				--rpt "repeat" \
		` ;


		# [ after ]
		local aft="${_nax[aft]}" ;

		# [ before ]
		local bfr="${_nax[bfr]}" ;

		# [ repeat ]
		local rpt="${_nax[rpt]}" ;


		# PRE PROCESS : BUILD CONTENTS --------

		# [ contents ]
		local _cntx="` \
			s_cnvDocLnx2Ln \
				"${_pax[@]}" \
		`" ;


		if [[ ! "$_cntx" ]] ;
		then

			# 1 			: action
			# 2 			: argument title
			# pos 			: position
			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_CblMpa \
				"Contents" \
				--pos "2nd+" \


			return $fls ;


		fi ;


		# PRECHECK : CONTENTS --------

		! DocCtlr__hs \
			"$@" \
		&& return $tru \
		;


		# MAIN PROCESS : BUILD FLAGS --------

		# [ flags ]
		local _flgx="g" ;
		
		# # [ flags ]
		# local _flgx="m" ;


		# [[ $rpt == $tru ]] \
		# && _flgx="${_flgx}g" \
		# ;


		# MAIN PROCESS : DETERMINE FINDER --------

		# [ find ]
		local _fd ;

		
		# i ) Before

		if [[ "$bfr" ]] ;
		then

			_fd="$bfr" ;

		# ii ) After

		elif [[ "$aft" ]] ;
		then

			_fd="$aft" ;

		fi ;


		# MAIN PROCESS : ESCAPE FINDER --------

		# [ escaped_finder ]
		local _xcpd_fd ;
		

		[[ "$_fd" ]] \
		&& _xcpd_fd="` \
			DocCtlr____cnvLn \
				"$_fd" \
		`" \
		&& _xcpd_fd="` \
			DocCtlr____xcpLn \
				"$_xcpd_fd" \
		`" \
		;


		# MAIN PROCESS : ESCAPE CONTENT --------

		# [ escaped_content ]
		local _xcpd_cntx ;


		_xcpd_cntx="` \
			DocCtlr____cnvLn \
				"$_cntx" \
		`" \
		&& _xcpd_cntx="` \
			DocCtlr____xcpLn \
				"$_xcpd_cntx" \
		`" \
		;


		# MAIN PROCESS : MATCH CONDITIONS --------

		# A ) FINDER NOT PRESENT
 
		if [[ ! "$_fd" ]] ;
		then

			# i 			: change source
			# r 			: regext
			# z 			: search entire article instead of each line
			# e+ 			: conditions

			# ▧ find
			# (\n|\r\n|^)		: capture previous linebreak to 1st group (* this to enable lane match)
			# (__content__) 	: capture content to 2nd group
			# ▨ replace
			# 					: none
			sed \
				-i \
				-r \
				-z \
				-e \
				's/(\n|\r\n|^)('"$_xcpd_cntx"')//'"${_flgx}" \
				"$fl_abs_pf__" \
			;


		# B ) FINDER PRESENT

		else

			if [[ "$bfr" ]] ;
			then

				# !!! future release
				# * sed does not support lookhead...
				...


			elif [[ "$aft" ]] ;
			then

				# i 			: change source
				# r 			: regext
				# z 			: search entire article instead of each line
				# e+ 			: conditions

				# ▧ find
				# (__after__.*) 		: capture condition and anything after to group 1
				# (\n|\r\n)				: capture previous linebreak to group 2 (* this to enable lane match)
				# (__content__) 		: capture content to group 3
				# ▨ replace
				# \1 					: only keep group 1 (* remove group 2 and 3 )
				sed \
					-i \
					-r \
					-z \
					-e 's/('"$_xcpd_fd"'.*)(\n|\r\n)('"$_xcpd_cntx"')/\1/'"${_flgx}" \
					"$fl_abs_pf__" \
				;


			fi ;

		fi ;


		_rslt=$? ;


		# POST PROCESS : REPORT STATUS --------

		return $_rslt ;


	} ;



# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# STATEFUL STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# IS EMPTY
# ======================================================================================
	DocCtlr__isMpty() {


		[[ ! "` \
			cat \
				"$fl_abs_pf__" \
		`" ]] \
		&& return $tru \
		|| return $fls \
		;


	} ;



# ======================================================================================
# HAS
#
# !!! has to implement `before` and `after`
# 
# ======================================================================================
	DocCtlr__hs() {


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

		# [ positioned_arguments ]
		local -a _pax=` \
			s_gtCblPax \
		` ;


		# PRE PROCESS: BUILD CONTENTS --------

		# [ contents ]
		local _cntx="` \
			s_cnvDocLnx2Ln \
				"${_pax[@]}" \
		`" ;


		# PRECHECK : CONTENTS --------

		[[ ! "$_cntx" ]] \
		&& return $fls \
		;


		# MAIN PROCESS : SEARCH CONTENTS --------

		# [ escaped_content ]
		local _xcpd_cntx ;


		_xcpd_cntx="` \
			DocCtlr____cnvLn \
				"$_cntx" \
		`" \
		&& _xcpd_cntx="` \
			DocCtlr____xcpLn \
				"$_xcpd_cntx" \
		`" \
		;


		# ▧ find

		# - does not include content
		[[ ! "` \
			sed \
				-n \
				-r \
				-z \
				-e 's/((\n|\r\n|^)'"$_xcpd_cntx"'(\n|\r\n|$))/\1/p' \
				"$fl_abs_pf__" \
			`" \
		]] \
		&& _rslt=$fls \
		;
			# 2>/dev/null


		# POST PROCESS : REPORT STATUS --------

		return $_rslt ;


	} ;



# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# I/O PRIVATE FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# __ESCAPE LINE
# ======================================================================================
	DocCtlr____xcpLn() {


		# POSITIONED ARGUMENT --------

		# [ text ]
		local txt__=$1 ;


		# PRECHECK : STRING --------

		[[ -z "$txt__" ]] \
		&& return $fls \
		;


		# MAIN PROCESS : ESCAPE --------

		# / -> \/
		txt__="${txt__//\//\\/}"


		# POST PROCESS : OUTPUT RESULT --------

		echo "$txt__" ;


		# POST PROCESS : REPORT STATUS --------

		return $tru ;


	} ;



# ======================================================================================
# __CONVERT LINE
# ======================================================================================
	DocCtlr____cnvLn() {


		# POSITIONED ARGUMENT --------

		# [ text ]
		local txt__=$1 ;


		# PRECHECK : STRING --------

		[[ -z "$txt__" ]] \
		&& return $fls \
		;


		# MAIN PROCESS : CONVERSION --------

		# \^\| -> linebreak
		txt__="${txt__//\\\^\\\|/$_lnbrk}" ;


		# POST PROCESS : OUTPUT RESULT --------

		echo "$txt__" ;


		# POST PROCESS : REPORT STATUS --------

		return $tru ;


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

	# [ file_absolute_path ]
	local fl_abs_pf__="${_pax[1]}" ;


	# NAMED ARGUMENT --------

	# [ named_arguments ]
	local -A _nax=` \
		s_gtCblNax \
			--nfc "f" "enforce" \
	` ;


	# [ enforce ]
	local nfc="${_nax[nfc]}" ;


	# PRECHECK : FILE ARGUMENT --------

	# - file_absolute_path is not set
	if [[ -z "$fl_abs_pf__" ]] ;
	then


		# 1 			: action
		# 2 			: argument title
		# pos 			: position
		[[ $env_vbo == $tru ]] \
		&& s_ivkPptTpl_CblMpa \
			"File Path" \
			--pos "1st" \
		;


		return $fls ;


	fi ;


	# PRECHECK : FILE EXISTENCE --------

	[[ \
		! -f "$fl_abs_pf__" \
		&& $nfc == $tru \
	]] \
	&& s \
		fl \
			mk \
				"$fl_abs_pf__" \
		--nfc $tru \
	;


	if [[ ! -f "$fl_abs_pf__" ]] ;
	then


		[[ $env_vbo == $tru ]] \
		&& s_ivkPptTpl_DfltRej \
			"%s not exists" \
			"file" \
		&& s_ivkPptTpl_DfltBlkCnt \
			"${ANSI_F_LG}`s_gtIco fl`${_ANSI}${ANSI_F_CN}%s${_ANSI}" \
			"${fl_abs_pf__/$PWD\//\./}" \
		;


		return $fls ;
	
	
	fi ;


	# MAIN PROCESS : LANEBEAK CHARACTOR --------

	# [ linebreak ]
	local _lnbrk="` \
		s_gtDocLnBrkChr \
			"$fl_abs_pf__" \
	`" ;


	# MAIN PROCESS : METHOD --------

	# - method is set
	if [[ "$mtd__" ]] ;
	then


		# [ method ]
		local _mtd ;


		case "$mtd__" in


			# ALTERNATIVE

			co | comment ) _mtd=DocCtlr__co ;;

			uc | uncomment ) _mtd=DocCtlr__uc ;;

			rmrk | remark ) _mtd=DocCtlr__rmrk ;;

			lnbrk | linebreak ) _mtd=DocCtlr__lnbrk ;;


			# I/O

			ers | erase ) _mtd=DocCtlr__ers ;;

			wrt | write ) _mtd=DocCtlr__wrt ;;


			# STATEFUL

			isMpty | isEmpty ) _mtd=DocCtlr__isMpty ;;

			hs | has ) _mtd=DocCtlr__hs ;;


		esac ;


		# - method is not empty
		if [[ "$_mtd" ]] ;
		then


			shift 2 \
			&& "$_mtd" \
				"$@" \
			;


			return $? ;


		fi ;


	fi ;


	# POST PROCESS : REPORT STATUS --------

	return $fls ;


} ;
