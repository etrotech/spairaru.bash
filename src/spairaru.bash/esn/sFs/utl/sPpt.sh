#!/usr/bin/env bash
# ######################################################################################
# PROMPT UTILITY
# ######################################################################################
# ======================================================================================
# INVOKER PROMPT TEMPLATE - INPUT OUTPUT ACTIONS
#
# Description:
# 	Template for filesystem action of Make and Remove.
#
# ======================================================================================
s_ivkPptTpl_FsIoAtnx() {


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
			--src_ttl "st" "source_title" \
			--src_ttl-nov 1 \
			--src_pf "sp" "source_path" \
			--src_pf-nov 1 \
	` ;


	# [ action ]
	local atn="${_nax[atn]}" ;

	# [ status ]
	local stt="${_nax[stt]}" ;


	# [ source_path ]
	local src_pf="${_nax[src_pf]}" ;


	# PRE PROCESS : SOURCE CATEGORY --------

	# [ source_category ]
	local _src_cat ;


	if [[ \
		-z "${_nax[src_cat]}" \
		&& -n "$src_pf" \
	]] ;
	then

		if [[ -d "$src_pf" ]] ;
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

		if [[ -d "$src_pf" ]] ;
		then

			_src_ico="`s_gtIco fldr`" ;


		elif [[ -f "$src_pf" ]] ;
		then

			_src_ico="`s_gtIco fl`" ;


		fi ;


	else

		_src_ico="`s_gtIco ${_nax[src_ico]}`" ;


	fi ;


	[[ $atn == rm ]] \
	&& _src_ico="`s_gtIco grv`" \
	;


	# PRE PROCESS : SOURCE TITLE --------

	# [ source_title ]
	local _src_ttl ;


	[[ -n "${_nax[src_ttl]}" ]] \
	&& _src_ttl="${ANSI_F_BL}${_nax[src_ttl]}${_ANSI} " \
	;


	# MAIN PROCESS : STATUS 0 --------

	if [[ $stt == $tru ]] ;
	then

		# a ) Make Action

		if [[ $atn == "mk" ]] ;
		then 
		
			s_ivkPptTpl_DfltAcpt \
				"%s%s is created." \
				"$_src_ttl" \
				"$_src_cat" \
			;


		# C ) REMOVE

		elif [[ $atn == "rm" ]] ;
		then

			s_ivkPptTpl_DfltAcpt \
				"%s%s is removed." \
				"$_src_ttl" \
				"$_src_cat" \
			;


		fi ;


	# MAIN PROCESS : STATUS 2 --------

	elif [[ $stt == 2 ]] ;
	then

		# a ) Make Action

		if [[ $atn == "mk" ]] ;
		then 

			s_ivkPptTpl_DfltAcpt \
				"%s%s is already created." \
				"$_src_ttl" \
				"$_src_cat" \
				--wc \
			;



		# C ) REMOVE

		elif [[ $atn == "rm" ]] ;
		then

			s_ivkPptTpl_DfltAcpt \
				"%s%s is already removed." \
				"$_src_ttl" \
				"$_src_cat" \
				--wc \
			;


		fi ;


	# MAIN PROCESS : STATUS 1 --------

	else

		# a ) Make Action

		if [[ $atn == "mk" ]] ;
		then 

			s_ivkPptTpl_DfltRej \
				"unable to create %s%s." \
				"$_src_ttl" \
				"$_src_cat" \
			;


		# C ) REMOVE

		elif [[ $atn == "rm" ]] ;
		then

			s_ivkPptTpl_DfltRej \
				"unable to remove %s%s." \
				"$_src_ttl" \
				"$_src_cat" \
			;


		fi ;


	fi ;


	[[ "$src_pf" ]] \
	&& s_ivkPptTpl_DfltBlkCnt \
		"${ANSI_F_LG}${_src_ico}${_ANSI}${ANSI_F_CN}%s${_ANSI}" \
		"` \
			s_prtFsPf \
				"$src_pf" \
		`" \
	;


} ;



# ======================================================================================
# INVOKER PROMPT TEMPLATE - TRANSFERAL ACTIONS
#
# Description:
# 	Template for filesystem action of Move and Link.
#
# ======================================================================================
s_ivkPptTpl_FsXfrlAtnx() {


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


	if [[ "$atn" =~ ^(lnk|link|sync|synchronize)$ ]] ;
	then

		_atn_ico="`s_gtIco lnk`" ;


	elif [[ "$atn" =~ ^(mv|move|dwld|download|cp|copy)$ ]] ;
	then

		_atn_ico="`s_gtIco xfr`" ;


	fi ;


	# MAIN PROCESS : STATUS 0 --------

	if [[ $stt == $tru ]] ;
	then


		# A ) COPY

		if [[ "$atn" =~ ^(cp|copy)$ ]] ;
		then

			s_ivkPptTpl_DfltAcpt \
				"%s%s is copied." \
				"$_dst_ttl" \
				"$_dst_cat" \
			;


		# B ) DOWNLAOD

		elif [[ "$atn" =~ ^(dwld|download)$ ]] ;
		then

			s_ivkPptTpl_DfltAcpt \
				"%s%s is download." \
				"$_src_ttl" \
				"$_src_cat" \
			;


		# C ) LINK

		elif [[ "$atn" =~ ^(lnk|link)$ ]] ;
		then

			s_ivkPptTpl_DfltAcpt \
				"%s%s is linked." \
				"$_dst_ttl" \
				"$_dst_cat" \
			;


		# D ) MOVE

		elif [[ "$atn" =~ ^(mv|move)$ ]] ;
		then

			s_ivkPptTpl_DfltAcpt \
				"%s%s is moved." \
				"$_src_ttl" \
				"$_src_cat" \
			;


		# E ) SYNC

		elif [[ "$atn" =~ ^(sync|synchronize)$ ]] ;
		then

			s_ivkPptTpl_DfltAcpt \
				"%s%s is synchronized." \
				"$_src_ttl" \
				"$_src_cat" \
			;

		fi ;


		[[ \
			"$src_pf" \
			&& "$dst_pf" \
		]] \
		&& s_ivkPptTpl_DfltBlkCnt \
			"${ANSI_F_LG}${_src_ico}${ANSI_F_CN}%s${_ANSI}" \
			"` \
				s_prtFsPf \
					"$src_pf" \
			`" \
		&& s_ivkPptTpl_DfltBlkCnt \
			"${ANSI_F_LG}${_atn_ico}${ANSI_F_LG}${_dst_ico}${ANSI_F_CN}%s${_ANSI}" \
			"` \
				s_prtFsPf \
					"$dst_pf" \
			`" \
		;


	# MAIN PROCESS : STATUS 2 --------

	elif [[ $stt == 2 ]] ;
	then

		s_ivkPptTpl_DfltRej \
			"%s%s%s dose not exists." \
			"$_src_ttl" \
			"${ANSI_F_PR}`__ "source"`${_ANSI} " \
			"$_src_cat" \
		;


		[[ "$src_pf" ]] \
		&& s_ivkPptTpl_DfltBlkCnt \
			"${ANSI_F_LG}${_src_ico}${ANSI_F_CN}%s${_ANSI}" \
			"` \
				s_prtFsPf \
					"$src_pf" \
			`" \
		;


	# MAIN PROCESS : STATUS 3 --------

	elif [[ $stt == 3 ]] ;
	then

		s_ivkPptTpl_DfltAcpt \
			"%s%s%s already exists." \
			"$_dst_ttl" \
			"${ANSI_F_PR}`__ "destination"`${_ANSI} " \
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

		# A ) COPY

		if [[ "$atn" =~ ^(cp|copy)$ ]] ;
		then

			s_ivkPptTpl_DfltRej \
				"unable to copy %s%s." \
				"$_dst_ttl" \
				"$_dst_cat" \
			;


		# B ) DOWNLAOD

		elif [[ "$atn" =~ ^(dwld|download)$ ]] ;
		then

			s_ivkPptTpl_DfltRej \
				"unable to download to %s%s." \
				"$_dst_ttl" \
				"$_dst_cat" \
			;


		# C ) LINK

		elif [[ "$atn" =~ ^(lnk|link)$ ]] ;
		then

			s_ivkPptTpl_DfltRej \
				"unable to link %s%s." \
				"$_dst_ttl" \
				"$_dst_cat" \
			;


		# B ) MOVE

		elif [[ "$atn" =~ ^(mv|move)$ ]] ;
		then

			s_ivkPptTpl_DfltRej \
				"unable to move to %s%s." \
				"$_dst_ttl" \
				"$_dst_cat" \
			;


		# E ) SYNC

		elif [[ "$atn" =~ ^(sync|synchronize)$ ]] ;
		then

			s_ivkPptTpl_DfltRej \
				"unable to synchronize to %s%s." \
				"$_dst_ttl" \
				"$_dst_cat" \
			;


		fi ;


		[[ \
			"$src_pf" \
			&& "$dst_pf" \
		]] \
		&& s_ivkPptTpl_DfltBlkCnt \
			"${ANSI_F_LG}${_src_ico}${ANSI_F_CN}%s${_ANSI}" \
			"` \
				s_prtFsPf \
					"$src_pf" \
			`" \
		&& s_ivkPptTpl_DfltBlkCnt \
			"${ANSI_F_LG}${_atn_ico}${ANSI_F_LG}${_dst_ico}${ANSI_F_CN}%s${_ANSI}" \
			"` \
				s_prtFsPf \
					"$dst_pf" \
			`" \
		;


	fi ;


} ;
