#!/usr/bin/env bash
# ######################################################################################
# PROMPT TEMPLATE UTILITY
# ######################################################################################
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# DEFAULT STATUS
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ======================================================================================
# INVOKER PROMPT TEMPLATE - ACCEPT
# ======================================================================================
s_ivkPptTpl_DfltAcpt () {


	# [ arguments ]
	local -a _ax=("$@") ;


	# POSITIONED ARGUMENT --------

	# [ positoined_arguments ]
	local -a _pax=` \
		s_gtCblPax \
	` ;


	# NAMED ARGUMENT --------

	# [ named_arguments ]
	local -A _nax=` \
		s_gtCblNax \
			--wc "with_condition"\
	` ;


	# [ with_condition ]
	local wc="${_nax[wc]}" ;


	# MAIN PROCESSES --------

	if [[ $wc == $tru ]] ;
	then

		printf \
			"${ANSI_F_YL}`s_gtIco "okbx"`${_ANSI}%s\n" \
			"`__ "${_pax[@]}"`" \
		;


	else

		printf \
			"${ANSI_F_GN}`s_gtIco "okbx"`${_ANSI}%s\n" \
			"`__ "${_pax[@]}"`" \
		;


	fi ;


	# POST PROCESS : REPORT STATUS --------

	return $tru ;


} ;



# ======================================================================================
# INVOKER PROMPT TEMPLATE - REJECT
# ======================================================================================
s_ivkPptTpl_DfltRej () {


	# MAIN PROCESSES --------

	printf \
		"${ANSI_F_RD}`s_gtIco "nobx"`${_ANSI}%s\n" \
		"`__ "$@"`" \
	;


	# POST PROCESS : REPORT STATUS --------

	return $tru ;


} ;



# ======================================================================================
# INVOKER PROMPT TEMPLATE - FAILURE
# ======================================================================================
s_ivkPptTpl_DfltFl () {


	# MAIN PROCESSES --------

	printf \
		"\n\n${ANSI_F_RD}`s_gtIco "flbx"`${_ANSI}${ANSI_F_RD}%s${_ANSI}\n\n" \
		"`__ "$@"`" \
	;


	# POST PROCESS : REPORT STATUS --------

	return $tru ;


} ;



# ======================================================================================
# INVOKER PROMPT TEMPLATE - SUCCESS
# ======================================================================================
s_ivkPptTpl_DfltSuc () {


	# MAIN PROCESSES --------

	printf \
		"\n\n${ANSI_F_GN}`s_gtIco "sucbx"`${_ANSI}${ANSI_F_GN}%s${_ANSI}\n\n\n" \
		"`__ "$@"`" \
	;


	# POST PROCESS : REPORT STATUS --------

	return $tru ;


} ;



# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# DEFAULT DECORATIVE
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ======================================================================================
# INVOKER PROMPT TEMPLATE - CODING CANVAS
# ======================================================================================
s_ivkPptTpl_DfltCdgCnvs () {


	# MAIN PROCESSES --------

	echo "" ;

	for ln in "$@" ;
	do 

		printf \
			"${S_PPT_ITND}%s${S_PPT_ITND}\n" \
			"`printf "$ln"`"\
		;

	done ;


	# POST PROCESS : REPORT STATUS --------

	return $tru ;


} ;



# ======================================================================================
# INVOKER PROMPT TEMPLATE - SECTION TITLE
# ======================================================================================
s_ivkPptTpl_DfltSecTtl () {


	# MAIN PROCESSES --------

	# [ title ]
	local _ttl="`__ "$@"`" ;


	printf \
		"\n\n`s_gtIco "hlbx"`${ANSI_F_GR}%s${_ANSI}\n" \
		"${_ttl^^}" \
	;


	# POST PROCESS : REPORT STATUS --------

	return $tru ;


} ;



# ======================================================================================
# INVOKER PROMPT TEMPLATE - BLOCK TITLE
# ======================================================================================
s_ivkPptTpl_DfltBlkTtl () {


	# MAIN PROCESSES --------

	printf \
		"${ANSI_F_W6_GR}--------------------------------\n" \
	;

	printf \
		"${ANSI_F_GR}`s_gtIco "secbx"`${_ANSI}%s\n" \
		"`__ "$@"`" \
	;


	# POST PROCESS : REPORT STATUS --------

	return $tru ;


} ;



# ======================================================================================
# INVOKER PROMPT TEMPLATE - BLOCK CONTENT
# ======================================================================================
s_ivkPptTpl_DfltBlkCnt () {


	# MAIN PROCESSES --------


	printf \
		"${S_PPT_ITND}%s\n" \
		"`__ "$@"`" \
	;


	# POST PROCESS : REPORT STATUS --------

	return $tru ;


} ;



# ======================================================================================
# INVOKER PROMPT TEMPLATE - BLOCK STREAM
# ======================================================================================
s_ivkPptTpl_DfltBlkStrm () {


	# [ arguments ]
	local _ax=("$@") ;

	# [ result ]
	local _rslt ;

	# [ temporary_file_absolute_path ]
	local _tmp_fl_abs_pf="$S_TMP_FLDR"/ppt/DfltBlkStrm ;


	# TREAP ********

	__s_ivkPptTpl_DfltBlkStrm__T() {


		# POST PROCESS : TEMPORARY FILE --------

		# P 			: process id
		# 1 			: command

		[[ $_tail_pid ]] \
		&& pkill \
			-P $_tail_pid \
			tail \
		;


		_tail_pid=;


		# POST PROCESS : TEMPORARY FILE --------

		rm \
			-fr \
			"$_tmp_fl_abs_pf" \
		;


	} ;


	# ********


	# PRECHECK : COMMAND --------

	[[ -z "$@" ]] \
	&& return $fls \
	;


	# PRE PROCESS : TEMPORARY FILE --------

	[[ ! -d "$S_TMP_FLDR"/ppt ]] \
	&& mkdir \
		-p \
		"$S_TMP_FLDR"/ppt \
	;


	[[ ! -f "$_tmp_fl_abs_pf" ]] \
	&& touch\
		"$_tmp_fl_abs_pf" \
	;


	# MAIN PROCESS : MONITOR PROGROAM --------

	# [ tail_process_id ]
	local _tail_pid ;


	tail \
		-f \
		"$_tmp_fl_abs_pf" \
		2>/dev/null \
	| sed \
		's/^/'"${S_PPT_ITND}"'&/g' \
	& _tail_pid=$! \
	;


	trap \
		'__s_ivkPptTpl_DfltBlkStrm__T' \
		SIGINT \
		SIGTERM \
	;


	# MAIN PROCESS : RECORD PROGROAM --------

	# ↓ any outputs will write in to destination instantly.
	"$@" \
		> "$_tmp_fl_abs_pf" \
		2>&1 \
	;


	_rslt=$? ;


	# POST PROCESS : TEMPORARY FILE --------


	trap \
		'-' \
		SIGINT \
		SIGTERM \
	;


	__s_ivkPptTpl_DfltBlkStrm__T ;


	# POST PROCESS : REPORT STATUS --------

	return $_rslt ;


} ;



# ======================================================================================
# INVOKER PROMPT TEMPLATE - PROGRESS
# ======================================================================================
s_ivkPptTpl_DfltPgrc() {


	# MAIN PROCESSES --------

	printf \
		"${ANSI_F_YL}`s_gtIco "ldbx"`${_ANSI} %s\n" \
		"`__ "$@"`" \
	;


	# POST PROCESS : REPORT STATUS --------

	return $tru ;


} ;



# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# GENERAL
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ======================================================================================
# INVOKER PROMPT TEMPLATE - GENERAL INDIVITUAL ACTIONS
#
# Status :
# 	0 Accept
# 	1 Fail
# 	2 Already Done ( accept with condition ) 
# 	3 Require
# 
# Actions :
# 	01 Add
# 	02 Construct
# 	03 Enable
# 	04 Delete
# 	05 Disable
# 	06 Initiate
# 	07 Install
# 	08 Update
# 	09 Uninstall
# 	10 upgrade
# 
# Format:
# 	1 { action statement }
# 	2 { path }
#
# ======================================================================================
s_ivkPptTpl_GnlIdvAtnx() {


	# [ arguments ]
	local -a _ax=("$@") ;


	# NAMED ARGUMENT --------

	# [ named_arguments ]
	local -A _nax=` \
		s_gtCblNax \
			--atn "a" "action"\
			--atn-nov 1 \
			\
			--stt "s" "status" \
			--stt-nov 1 \
			\
			--cat "c" "category" \
			--cat-nov 1 \
			\
			--ico "i" "icon" \
			--ico-nov 1 \
			\
			--pf "p" "path" \
			--pf-nov 1 \
			\
			--ttl "t" "title" \
			--ttl-nov 1 \
	` ;


	# [ action ]
	local atn="${_nax[atn]}" ;

	# [ status ]
	local stt="${_nax[stt]}" ;

	# [ path ]
	local pf="${_nax[pf]}" ;


	# PRE PROCESS : CATEGORY --------

	# [ category ]
	local _cat ;


	if [[ "${_nax[cat]}" ]] ;
	then
	
		_cat="${_nax[cat]}" ;


	elif [[ "$pf" ]] ;
	then

		[[ -d "$pf" ]] \
		&& _cat="folder" \
		|| _cat="file" \
		;


	fi ;


	# PRE PROCESS : ICON --------

	# [ icon ]
	local _ico="${_nax[ico]}" ;


	if [[ \
		"$pf" \
		&& -z "$_ico" \
	]] ;
	then

		[[ -d "$pf" ]] \
		&& _ico="` \
			s_gtIco \
				fldr \
		`" \
		|| _ico="` \
			s_gtIco \
				fl \
		`" \
		;

	fi ;


	# PRE PROCESS : TITLE --------

	# [ title ]
	local _ttl ;


	[[ -n "${_nax[ttl]}" ]] \
	&& _ttl="${ANSI_F_BL}${_nax[ttl]}${_ANSI} " \
	;


	# MAIN PROCESS : STATUS 0 --------

	# [ message ]
	local _msg= ;


	if [[ $stt == $tru ]] ;
	then


		# ACTION ) ADD

		if [[ "$atn" =~ ^(ad|add)$ ]] ;
		then 

			_msg="%s%s is added." ;


		# ACTION ) CREATE

		elif [[ "$atn" =~ ^(cr|create)$ ]] ;
		then 

			[[ \
				"$_ttl" \
				|| "$_cat" \
			]] \
			&& _msg="%s%s is created." \
			|| _msg="creation completed." \
			;


		# ACTION ) CHANGE

		elif [[ "$atn" =~ ^(chg|change)$ ]] ;
		then 

			[[ \
				"$_ttl" \
				|| "$_cat" \
			]] \
			&& _msg="%s%s is changed." \
			|| _msg="change completed." \
			;


		# ACTION ) CONSTRUCT

		elif [[ "$atn" =~ ^(cstru|construction)$ ]] ;
		then 

			[[ \
				"$_ttl" \
				|| "$_cat" \
			]] \
			&& _msg="%s%s is constructed." \
			|| _msg="construction completed." \
			;


		# ACTION ) ENABLE

		elif [[ "$atn" =~ ^(nbl|enable)$ ]] ;
		then 

			_msg="%s%s is enabled." ;


		# ACTION ) DELETE

		elif [[ "$atn" =~ ^(dl|delete)$ ]] ;
		then 

			_msg="%s%s is deleted." ;


		# ACTION ) DISABLE

		elif [[ "$atn" =~ ^(dsbl|disable)$ ]] ;
		then 

			_msg="%s%s is disabled." ;


		# ACTION ) INITIATION

		elif [[ "$atn" =~ ^(init|initiate)$ ]] ;
		then

			[[ \
				"$_ttl" \
				|| "$_cat" \
			]] \
			&& _msg="%s%s is initiated." \
			|| _msg="initiation completed." \
			;


		# ACTION ) INSTALLATION

		elif [[ "$atn" =~ ^(istl|install)$ ]] ;
		then 

			[[ \
				"$_ttl" \
				|| "$_cat" \
			]] \
			&& _msg="%s%s is installed." \
			|| _msg="installation completed." \
			;


		# ACTION ) SYNCHRONIZE

		elif [[  "$atn" =~ ^(sync|synchronize)$ ]] ;
		then 

			[[ \
				"$_ttl" \
				|| "$_cat" \
			]] \
			&& _msg="%s%s is synchronized." \
			|| _msg="synchronization completed." \
			;


		# ACTION ) UNINSTALLATION

		elif [[ "$atn" =~ ^(uistl|uninstall)$ ]] ;
		then 

			[[ \
				"$_ttl" \
				|| "$_cat" \
			]] \
			&& _msg="%s%s is uninstalled." \
			|| _msg="uninstallation completed." \
			;


		# ACTION ) UPDATE

		elif [[  "$atn" =~ ^(upd|update)$ ]] ;
		then 

			_msg="%s%s is updated." ;


		# ACTION ) UPGRADE

		elif [[ "$atn" =~ ^(upg|upgrade)$ ]] ;
		then 

			[[ \
				"$_ttl" \
				|| "$_cat" \
			]] \
			&& _msg="%s%s is upgraded." \
			|| _msg="upgradation completed." \
			;


		fi ;


		s_ivkPptTpl_DfltAcpt \
			"$_msg" \
			"$_ttl" \
			"$_cat" \
		;


	# MAIN PROCESS : STATUS 2 --------

	elif [[ $stt == 2 ]] ;
	then

		# ACTION ) ADD

		if [[ "$atn" =~ ^(ad|add)$ ]] ;
		then 

			_msg="%s%s is already added." ;


		# ACTION ) CREATE

		elif [[ "$atn" =~ ^(cr|create)$ ]] ;
		then 

			[[ \
				"$_ttl" \
				|| "$_cat" \
			]] \
			&& _msg="%s%s is already created." \
			|| _msg="creation already completed." \
			;


		# ACTION ) CHANGE

		elif [[ "$atn" =~ ^(chg|change)$ ]] ;
		then 

			[[ \
				"$_ttl" \
				|| "$_cat" \
			]] \
			&& _msg="%s%s is already changed." \
			|| _msg="change already completed." \
			;


		# ACTION ) CONSTRUCTION

		elif [[ "$atn" =~ ^(cstru|construction)$ ]] ;
		then 

			[[ \
				"$_ttl" \
				|| "$_cat" \
			]] \
			&& _msg="%s%s is already constructed." \
			|| _msg="construction already completed." \
			;


		# ACTION ) ENABLE

		elif [[ "$atn" =~ ^(nbl|enable)$ ]] ;
		then 

			_msg="%s%s is already enabled." ;


		# ACTION ) DELETE

		elif [[ "$atn" =~ ^(dl|delete)$ ]] ;
		then 

			_msg="%s%s is already deleted." ;


		# ACTION ) DISABLE

		elif [[ "$atn" =~ ^(dsbl|disable)$ ]] ;
		then 

			_msg="%s%s is already disabled." ;


		# ACTION ) INITIATION

		elif [[ "$atn" =~ ^(init|initiate)$ ]] ;
		then

			[[ \
				"$_ttl" \
				|| "$_cat" \
			]] \
			&& _msg="%s%s is already initiated." \
			|| _msg="already initiated." \
			;


		# ACTION ) INSTALLATION

		elif [[ "$atn" =~ ^(istl|install)$ ]] ;
		then 

			[[ \
				"$_ttl" \
				|| "$_cat" \
			]] \
			&& _msg="%s%s is already installated." \
			|| _msg="installation already completed." \
			;


		# ACTION ) SYNCHRONIZE

		elif [[  "$atn" =~ ^(sync|synchronize)$ ]] ;
		then 

			[[ \
				"$_ttl" \
				|| "$_cat" \
			]] \
			&& _msg="%s%s is already synchronized." \
			|| _msg="synchronization already completed." \
			;


		# ACTION ) UNINSTALLATION

		elif [[ "$atn" =~ ^(uistl|uninstall)$ ]] ;
		then 

			[[ \
				"$_ttl" \
				|| "$_cat" \
			]] \
			&& _msg="%s%s is already uninstalled." \
			|| _msg="uninstallation already completed." \
			;


		# ACTION ) UPDATE

		elif [[  "$atn" =~ ^(upd|update)$ ]] ;
		then 

			_msg="%s%s is already updated." ;


		# ACTION ) UPGRADE

		elif [[  "$atn" =~ ^(upg|upgrade)$ ]] ;
		then 

			[[ \
				"$_ttl" \
				|| "$_cat" \
			]] \
			&& _msg="%s%s is already upgraded." \
			|| _msg="upgradation already completed." \
			;


		fi ;


		s_ivkPptTpl_DfltAcpt \
			"$_msg" \
			"$_ttl" \
			"$_cat" \
			--wc \
		;


	# MAIN PROCESS : STATUS 3 --------

	elif [[ $stt == 3 ]] ;
	then


		# ACTION ) CONSTRUCTION

		if [[ "$atn" =~ ^(cstru|construction)$ ]] ;
		then 

			[[ \
				"$_ttl" \
				|| "$_cat" \
			]] \
			&& _msg="%s%s requires to construct." \
			|| _msg="construction required." \
			;


		# ACTION ) INITIATION

		elif [[ "$atn" =~ ^(init|initiate)$ ]] ;
		then

			[[ \
				"$_ttl" \
				|| "$_cat" \
			]] \
			&& _msg="%s%s requires to initiate." \
			|| _msg="initiation required." \
			;


		# ACTION ) INSTALLATION

		elif [[ "$atn" =~ ^(istl|install)$ ]] ;
		then 

			[[ \
				"$_ttl" \
				|| "$_cat" \
			]] \
			&& _msg="%s%s requires to install." \
			|| _msg="installation required." \
			;


		# ACTION ) UNINSTALLATION

		elif [[ "$atn" =~ ^(uistl|uninstall)$ ]] ;
		then 

			[[ \
				"$_ttl" \
				|| "$_cat" \
			]] \
			&& _msg="%s%s requires to uninstall." \
			|| _msg="uninstallation required." \
			;


		# ACTION ) UPGRADE

		elif [[  "$atn" =~ ^(upg|upgrade)$ ]] ;
		then 

			[[ \
				"$_ttl" \
				|| "$_cat" \
			]] \
			&& _msg="%s%s requires to upgrade." \
			|| _msg="upgradation required." \
			;


		fi ;


		s_ivkPptTpl_DfltRej \
			"$_msg" \
			"$_ttl" \
			"$_cat" \
		;


	# MAIN PROCESS : STATUS 1 --------

	else

		# ACTION ) ADD

		if [[ "$atn" =~ ^(ad|add)$ ]] ;
		then 

			_msg="failed to add %s%s." ;


		# ACTION ) CREATE

		elif [[ "$atn" =~ ^(cr|create)$ ]] ;
		then 

			[[ \
				"$_ttl" \
				|| "$_cat" \
			]] \
			&& _msg="failed to create %s%s." \
			|| _msg="creation failed." \
			;


		# ACTION ) CHANGE

		elif [[ "$atn" =~ ^(chg|change)$ ]] ;
		then 

			[[ \
				"$_ttl" \
				|| "$_cat" \
			]] \
			&& _msg="failed to change %s%s." \
			|| _msg="change failed." \
			;


		# ACTION ) CONSTRUCTION

		elif [[ "$atn" =~ ^(cstru|construction)$ ]] ;
		then

			[[ \
				"$_ttl" \
				|| "$_cat" \
			]] \
			&& _msg="failed to construct %s%s." \
			|| _msg="construction failed." \
			;


		# ACTION ) ENABLE

		elif [[ "$atn" =~ ^(nbl|enable)$ ]] ;
		then

			_msg="failed to enable %s%s." ;


		# ACTION ) DELETE

		elif [[ "$atn" =~ ^(dl|delete)$ ]] ;
		then

			_msg="failed to delete %s%s." ;


		# ACTION ) DISABLE

		elif [[ "$atn" =~ ^(dsbl|disable)$ ]] ;
		then

			_msg="failed to disable %s%s." ;


		# ACTION ) INITIATION

		elif [[ "$atn" =~ ^(init|initiate)$ ]] ;
		then

			[[ \
				"$_ttl" \
				|| "$_cat" \
			]] \
			&& _msg="failed to initiate %s%s." \
			|| _msg="initiation failed." \
			;


		# ACTION ) INSTALLATION

		elif [[ "$atn" =~ ^(istl|install)$ ]] ;
		then

			[[ \
				"$_ttl" \
				|| "$_cat" \
			]] \
			&& _msg="failed to install %s%s." \
			|| _msg="installation failed." \
			;


		# ACTION ) SYNCHRONIZE

		elif [[  "$atn" =~ ^(sync|synchronize)$ ]] ;
		then 

			[[ \
				"$_ttl" \
				|| "$_cat" \
			]] \
			&& _msg="failed to sync %s%s." \
			|| _msg="synchronization failed." \
			;


		# ACTION ) UNINSTALLATION

		elif [[ "$atn" =~ ^(uistl|uninstall)$ ]] ;
		then

			[[ \
				"$_ttl" \
				|| "$_cat" \
			]] \
			&& _msg="failed to uninstall %s%s." \
			|| _msg="uninstallation failed." \
			;


		# ACTION ) UPDATE

		elif [[  "$atn" =~ ^(upd|update)$ ]] ;
		then 

			_msg="failed to update %s%s." ;


		# ACTION ) UPGRADE

		elif [[  "$atn" =~ ^(upg|upgrade)$ ]] ;
		then 

			[[ \
				"$_ttl" \
				|| "$_cat" \
			]] \
			&& _msg="failed to upgrade %s%s." \
			|| _msg="upgradation failed." \
			;


		fi ;

	
		s_ivkPptTpl_DfltRej \
			"$_msg" \
			"$_ttl" \
			"$_cat" \
		;


	fi ;


	[[ "$pf" ]] \
	&& s_ivkPptTpl_DfltBlkCnt \
		"${ANSI_F_LG}${_ico}${_ANSI}${ANSI_F_CN}%s${_ANSI}" \
		` s_prtFsPf "${pf}" ` \
	;


	# POST PROCESS : REPORT STATUS --------

	return $tru ;


} ;



# ======================================================================================
# INVOKER PROMPT TEMPLATE - GENERAL ASSOCIATIVE ACTIONS
#
# Format:
# 	 1 { action statement }
# 	 2 { path }
# 	 3 { action_icon } { path }
#
# ======================================================================================
s_ivkPptTpl_GnlAssoctvAtnx() {


	# [ arguments ]
	local -a _ax=("$@") ;


	# NAMED ARGUMENT --------

	# [ named_arguments ]
	local -A _nax=` \
		s_gtCblNax \
			--atn "a" "action"\
			--atn-nov 1 \
			\
			--stt "s" "status" \
			--stt-nov 1 \
			\
			--src_cat "sc" "source_category" \
			--src_cat-nov 1 \
			--src_ico "si" "source_icon" \
			--src_ico-nov 1 \
			--src_pf "sp" "source_path" \
			--src_pf-nov 1 \
			--src_ttl "st" "source_title" \
			--src_ttl-nov 1 \
			\
			--dst_cat "dc" "destination_category" \
			--dst_cat-nov 1 \
			--dst_ico "dst" "destination_icon" \
			--dst_ico-nov 1 \
			--dst_pf "dp" "destination_path" \
			--dst_pf-nov 1 \
			--dst_ttl "dt" "destination_title" \
			--dst_ttl-nov 1 \
	` ;


	# [ action ]
	local atn="${_nax[atn]}" ;

	# [ status ]
	local stt="${_nax[stt]}" ;


	# [ source_path ]
	local src_pf="${_nax[src_pf]}" ;

	# [ destination_path ]
	local dst_pf="${_nax[dst_pf]}" ;


	# PRE PROCESS : SOURCE CATEGORY --------

	# [ source_category ]
	local _src_cat ;


	if [[ \
		-z "${_nax[src_cat]}" \
		&& -n "$src_pf" \
	]] ;
	then

		if [[ "$atn" =~ ^(dwld|download)$ ]] ;
		then 

			_src_cat="remote" ;


		elif [[ -d "$src_pf" ]] ;
		then

			_src_cat="folder" ;


		elif [[ -f "$src_pf" ]] ;
		then

			_src_cat="file" ;


		fi ;


	else

		_src_cat="${_nax[src_cat]}" ;


	fi ;


	# PRE PROCESS : SOURCE ICON --------

	# [ source_icon ]
	local _src_ico ;


	if [[ \
		-z "${_nax[src_ico]}" \
		&& -n "$src_pf" \
	]] ;
	then

		if [[ "$atn" =~ ^(dwld|download)$ ]] ;
		then 

			_src_ico="`s_gtIco inet`" ;


		elif [[ -d "$src_pf" ]] ;
		then

			_src_ico="`s_gtIco fldr`" ;


		elif [[ -f "$src_pf" ]] ;
		then

			_src_ico="`s_gtIco fl`" ;


		fi ;


	else

		_src_ico="`s_gtIco ${_nax[src_ico]}`" ;


	fi ;


	# PRE PROCESS : SOURCE TITLE --------

	# [ source_title ]
	local _src_ttl ;


	[[ -n "${_nax[src_ttl]}" ]] \
	&& _src_ttl="${ANSI_F_BL}${_nax[src_ttl]}${_ANSI} " \
	;


	# PRE PROCESS : DESTINATION CATEGORY --------

	# [ destination_category ]
	local _dst_cat ;


	if [[ \
		-z "${_nax[dst_cat]}" \
		&& -n "$dst_pf" \
	]] ;
	then

		if [[ -d "$dst_pf" ]] ;
		then

			_dst_cat="folder" ;


		elif [[ -f "$dst_pf" ]] ;
		then

			_dst_cat="file" ;


		fi ;


	else

		_dst_cat="${_nax[dst_cat]}" ;


	fi ;


	# PRE PROCESS : DESTINATION ICON --------

	# [ destination_icon ]
	local _dst_ico ;


	if [[ \
		-z "${_nax[dst_ico]}" \
		&& -n "$dst_pf" \
	]] ;
	then

		if [[ -d "$dst_pf" ]] ;
		then

			_dst_ico="`s_gtIco fldr`" ;


		elif [[ -f "$dst_pf" ]] ;
		then

			_dst_ico="`s_gtIco fl`" ;


		fi ;


	else

		_dst_ico="`s_gtIco ${_nax[dst_ico]}`" ;


	fi ;


	# PRE PROCESS : DESTINATION TITLE --------

	# [ destination_title ]
	local _dst_ttl ;


	[[ -n "${_nax[dst_ttl]}" ]] \
	&& _dst_ttl="${ANSI_F_BL}${_nax[dst_ttl]}${_ANSI} " \
	;


	# PRE PROCESS : DESTINATION ACTION ICON --------

	# [ action_icon ]
	local _atn_ico ;


	if [[ "$atn" =~ ^(chg|change|lnk|link|mg|merge|sync|synchronize)$ ]] ;
	then

		_atn_ico="` s_gtIco lnk `" ;


	elif [[ "$atn" =~ ^(mv|move|dwld|download|cp|copy)$ ]] ;
	then

		_atn_ico="` s_gtIco xfr `" ;


	fi ;


	# MAIN PROCESS : STATUS ) 0 --------

	# [ message ]
	_msg=;


	if [[ $stt == $tru ]] ;
	then


		# ACTION ) CHANGE

		if [[ "$atn" =~ ^(chg|change)$ ]] ;
		then

			[[ \
				"$_dst_ttl" \
				|| "$_dst_cat" \
			]] \
			&& _msg="%s%s is changed to %s%s." \
			|| _msg="%s%s is changed." \
			;


		# ACTION ) COPY

		elif [[ "$atn" =~ ^(cp|copy)$ ]] ;
		then

			[[ \
				"$_dst_ttl" \
				|| "$_dst_cat" \
			]] \
			&& _msg="%s%s is copied to %s%s." \
			|| _msg="%s%s is copied." \
			;


		# ACTION ) DOWNLAOD

		elif [[ "$atn" =~ ^(dwld|download)$ ]] ;
		then

			[[ \
				"$_dst_ttl" \
				|| "$_dst_cat" \
			]] \
			&& _msg="%s%s is downloaded to %s%s." \
			|| _msg="%s%s is downloaded." \
			;


		# ACTION ) LINK

		elif [[ "$atn" =~ ^(lnk|link)$ ]] ;
		then

			[[ \
				"$_dst_ttl" \
				|| "$_dst_cat" \
			]] \
			&& _msg="%s%s is linked to %s%s." \
			|| _msg="%s%s is linked." \
			;


		# ACTION ) MOVE

		elif [[ "$atn" =~ ^(mv|move)$ ]] ;
		then

			[[ \
				"$_dst_ttl" \
				|| "$_dst_cat" \
			]] \
			&& _msg="%s%s is moved to %s%s." \
			|| _msg="%s%s is moved." \
			;


		# ACTION ) MERGE

		elif [[ "$atn" =~ ^(mg|merge)$ ]] ;
		then

			[[ \
				"$_dst_ttl" \
				|| "$_dst_cat" \
			]] \
			&& _msg="%s%s is merged to %s%s." \
			|| _msg="%s%s is merged." \
			;


		# ACTION ) SYNC

		elif [[ "$atn" =~ ^(sync|synchronize)$ ]] ;
		then

			[[ \
				"$_dst_ttl" \
				|| "$_dst_cat" \
			]] \
			&& _msg="%s%s is synchronized to %s%s." \
			|| _msg="%s%s is synchronized." \
			;


		fi ;


		[[ \
			"$_dst_ttl" \
			|| "$_dst_cat" \
		]] \
		&& s_ivkPptTpl_DfltAcpt \
			"$_msg" \
			"$_src_ttl" \
			"$_src_cat" \
			"$_dst_ttl" \
			"$_dst_cat" \
		|| s_ivkPptTpl_DfltAcpt \
			"$_msg" \
			"$_dst_ttl" \
			"$_dst_cat" \
		;


		[[ \
			"$src_pf" \
			&& "$dst_pf" \
		]] \
		&& s_ivkPptTpl_DfltBlkCnt \
			"${ANSI_F_LG}${_src_ico}${ANSI_F_CN}%s${_ANSI}" \
			` s_prtFsPf "${src_pf}" ` \
		&& s_ivkPptTpl_DfltBlkCnt \
			"${ANSI_F_LG}${_atn_ico}${ANSI_F_LG}${_dst_ico}${ANSI_F_CN}%s${_ANSI}" \
			` s_prtFsPf "${dst_pf}" ` \
		;


	# MAIN PROCESS : STATUS ) 2 --------

	elif [[ $stt == 2 ]] ;
	then

		s_ivkPptTpl_DfltRej \
			"%s%s dose not exists." \
			"$_src_ttl" \
			"$_src_cat" \
		;


		[[ "$src_pf" ]] \
		&& s_ivkPptTpl_DfltBlkCnt \
			"${ANSI_F_LG}${_src_ico}${ANSI_F_CN}%s${_ANSI}" \
			` s_prtFsPf "${src_pf}" ` \
		;


	# MAIN PROCESS : STATUS ) 3 --------

	elif [[ $stt == 3 ]] ;
	then

		s_ivkPptTpl_DfltAcpt \
			"%s%s already exists." \
			"$_dst_ttl" \
			"$_dst_cat" \
			--wc \
		;


		[[ "$dst_pf" ]] \
		&& s_ivkPptTpl_DfltBlkCnt \
			"${ANSI_F_LG}${_dst_ico}${ANSI_F_CN}%s${_ANSI}" \
			"${dst_pf/$PWD\//\./}" \
		;


	# MAIN PROCESS : STATUS 1 --------

	else

		# ACTION ) CHANGE

		if [[ "$atn" =~ ^(chg|change)$ ]] ;
		then

			[[ \
				"$_src_ttl" \
				|| "$_src_cat" \
			]] \
			&& _msg="%s%s is unable to change to %s%s." \
			|| _msg="unable to change to %s%s." \
			;


		# ACTION ) COPY

		elif [[ "$atn" =~ ^(cp|copy)$ ]] ;
		then

			[[ \
				"$_src_ttl" \
				|| "$_src_cat" \
			]] \
			&& _msg="%s%s is unable to copy to %s%s." \
			|| _msg="unable to copy to %s%s." \
			;


		# ACTION ) DOWNLAOD

		elif [[ "$atn" =~ ^(dwld|download)$ ]] ;
		then

			[[ \
				"$_src_ttl" \
				|| "$_src_cat" \
			]] \
			&& _msg="%s%s is unable to download to %s%s." \
			|| _msg="unable to download to %s%s." \
			;


		# ACTION ) LINK

		elif [[ "$atn" =~ ^(lnk|link)$ ]] ;
		then

			[[ \
				"$_src_ttl" \
				|| "$_src_cat" \
			]] \
			&& _msg="%s%s is unable to link to %s%s." \
			|| _msg="unable to link to %s%s." \
			;


		# ACTION ) MOVE

		elif [[ "$atn" =~ ^(mv|move)$ ]] ;
		then

			[[ \
				"$_src_ttl" \
				|| "$_src_cat" \
			]] \
			&& _msg="%s%s is unable to move to %s%s." \
			|| _msg="unable to move to %s%s." \
			;


		# ACTION ) MERGE

		elif [[ "$atn" =~ ^(mg|merge)$ ]] ;
		then

			[[ \
				"$_src_ttl" \
				|| "$_src_cat" \
			]] \
			&& _msg="%s%s is unable to merge to %s%s." \
			|| _msg="unable to merge to %s%s." \
			;


		# ACTION ) SYNC

		elif [[ "$atn" =~ ^(sync|synchronize)$ ]] ;
		then

			[[ \
				"$_src_ttl" \
				|| "$_src_cat" \
			]] \
			&& _msg="%s%s is unable to synchronize to %s%s." \
			|| _msg="unable to synchronize to %s%s." \
			;


		fi ;


		[[ \
			"$_src_ttl" \
			|| "$_src_cat" \
		]] \
		&& s_ivkPptTpl_DfltRej \
			"$_msg" \
			"$_src_ttl" \
			"$_src_cat" \
			"$_dst_ttl" \
			"$_dst_cat" \
		|| s_ivkPptTpl_DfltRej \
			"$_msg" \
			"$_dst_ttl" \
			"$_dst_cat" \
		;


		[[ \
			"$src_pf" \
			&& "$dst_pf" \
		]] \
		&& s_ivkPptTpl_DfltBlkCnt \
			"${ANSI_F_LG}${_src_ico}${ANSI_F_CN}%s${_ANSI}" \
			` s_prtFsPf "${src_pf}" ` \
		&& s_ivkPptTpl_DfltBlkCnt \
			"${ANSI_F_LG}${_atn_ico}${ANSI_F_LG}${_dst_ico}${ANSI_F_CN}%s${_ANSI}" \
			` s_prtFsPf "${dst_pf}" ` \
		;


	fi ;


	# POST PROCESS : REPORT STATUS --------

	return $tru ;


} ;
