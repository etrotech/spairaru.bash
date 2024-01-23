#!/usr/bin/env bash
# ######################################################################################
# SPAIRARU CONTROLLER UTILITY GROUP
# % PACKAGE
# ######################################################################################
SpairaruCtlr_Cfgtv() {


# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# CONFIGURATIVE STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# CONFIGURE
# 
# Description:
# 	This method will manipulate defines in application cofiguration files.
#
# ======================================================================================
	SpairaruCtlr_Cfgtv__cfg() {


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


		# ARGUMENT : POSITIONED --------

		# [ positoined_arguments ]
		local -a _pax=` \
			s_gtCblPax \
		` ;


		# [ key ]
		local ky__="${_pax[0]}" ;

		# [ value ]
		local vlu__="${_pax[1]}" ;


		# ARGUMENT : NAMED --------

		# [ named_arguments ]
		local -A _nax=` \
			s_gtCblNax \
				--prfl_scp "scp" "scope" \
				--prfl_scp-nov 1 \
				--prfl_scp-dflt "glo" \
				--prfl_scp-opt-dflt "dflt" "default" \
				--prfl_scp-opt-glo "glo" "global" \
				--prfl_scp-opt-lo "lo" "local" \
				\
				--atn "action" \
				--atn-nov 1 \
				--atn-opt-ad "ad" "add" \
				--atn-opt-dl "dl" "delete" \
				--atn-opt-qry "qry" "query" \
				\
				--mx "mutiple" \
				--mx-dflt $fls \
				\
				\
				--nfc "f" "enforce" \
		` ;


		# [ profile_scope ]
		local prfl_scp="${_nax[prfl_scp]}" ;

		# [ action ]
		local atn="${_nax[atn]}" ;

		# [ mutiple ]
		local mx="${_nax[mx]}" ;


		# [ enforce ]
		local nfc="${_nax[nfc]}" ;


		# PRE PROCESS : DETERMINE ACTION --------

		# - action has not set
		if [[ -z "$atn" ]] ;
		then

			# - value has set
			[[ -n "$vlu__" ]] \
			&& atn="ad" \
			|| atn="qry" \
			;

		fi ;


		# PRECHECK : KEY --------

		if [[ -z "$ky__" ]] ;
		then 

			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_CblMpa \
				"Key" \
				--pos "1st" \
			;

			return $fls ;


		fi ;


		# PRECHECK : VALUE --------

		if [[ \
			$atn == "ad" \
			&& -z "$vlu__" \
		]] ;
		then 

			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_CblMpa \
				"Value" \
				--pos "2nd" \
			;

			return $fls ;


		fi ;


		# MAIN PROCESS : DETERMINE PROFILE --------

		# [ profile_path ]
		local _prfl_pf ;


		# - profile_scope is default
		if [[ $prfl_scp == "dflt" ]] ;
		then

			# 	🛠️
			# 	├─ 🖿 etc
			# 	│  └─ 🖿 EtroTech spairaru.bash
			# 	│     ├─ 🖺 *.env
			# 	│     ├─ 🖺 s.cnf 👈
			# 	│     └─ 🖺 *.ini
			# 	├─ 🖿 $HOME
			# 	│  └─ 🖿 .s.bash
			# 	│     ├─ 🖺 *.env
			# 	│     ├─ 🖺 s.cnf
			# 	?     └─ 🖺 *.ini
			# 	└─ 🖿 $PWD
			# 	   └─ 🖿 .s.bash
			# 	      ├─ 🖺 *.env
			# 	      ├─ 🖺 s.cnf
			# 	      └─ 🖺 *.ini

			_prfl_pf=$S_D_CNF_FL ;


		# - profile_scope is global
		elif [[ $prfl_scp == "glo" ]] ;
		then

			# 	🛠️
			# 	├─ 🖿 etc
			# 	│  └─ 🖿 EtroTech spairaru.bash
			# 	│     ├─ 🖺 *.env
			# 	│     ├─ 🖺 s.cnf
			# 	│     └─ 🖺 *.ini
			# 	├─ 🖿 $HOME
			# 	│  └─ 🖿 .s.bash
			# 	│     ├─ 🖺 *.env
			# 	│     ├─ 🖺 s.cnf 👈
			# 	?     └─ 🖺 *.ini
			# 	└─ 🖿 $PWD
			# 	   └─ 🖿 .s.bash
			# 	      ├─ 🖺 *.env
			# 	      ├─ 🖺 s.cnf
			# 	      └─ 🖺 *.ini

			 _prfl_pf=$S_G_CNF_FL ;


		# - otherwise
		else

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
			# 	      ├─ 🖺 s.cnf 👈
			# 	      └─ 🖺 *.ini

			 _prfl_pf="${PWD}/.${S_NM}/${S_S_CLI}.cnf" ;


		fi ;


		! s \
			fl \
				ex \
					"$_prfl_pf" \
		&& s \
			fl \
				mk \
					"$_prfl_pf" \
					--nfc $env_nfc \
		;


		# MAIN PROCESS : DETERMINE PROFILE TITLE --------

		# [ profile_title ]
		local _prfl_ttl="` \
			s_gtPrflTtl \
				"$prfl_scp" \
		`" ;


		# MAIN PROCESS : EDIT PROFILE --------

		# A ) ADD

		if [[ $atn == "ad" ]] ;
		then


			s \
				cfgrtr \
					ad \
						"$_prfl_pf" \
						"$ky__" \
						"$vlu__" \
						--nfc $nfc \
						--mx $mx \
			;


			_rslt=$? ;


			eval "$ky__"="$vlu__" ;


		# B ) DELETE

		elif [[ $atn == "dl" ]] ;
		then


			s \
				cfgrtr \
					dl \
						"$_prfl_pf" \
						"$ky__" \
						--nfc $nfc \
						--mx $mx \
			;


			_rslt=$? ;


			eval "$ky__"=;


		# C ) INQUIRE

		else


			s \
				cfgrtr \
					gt \
						"$S_D_CNF_FL" \
						"$S_G_CNF_FL" \
						"${PWD}/.${S_NM}/${S_S_CLI}.cnf" \
						"$ky__" \
						--nfc $nfc \
						--mx $mx \
			;


			_rslt=$? ;


		fi ;


		# POST PROCESS : DISPLAY MESSAGE --------

		[[ \
			$atn != "qry" \
			&& $env_vbo == $tru \
		]] \
		&& s_ivkPptTpl_DocMnpAtnx \
			--atn $atn \
			\
			--stt $_rslt \
			\
			--tgt_cat "configuration" \
			--tgt_ttl "$ky__" \
			\
			--doc_cat "profile" \
			--doc_ttl "$_prfl_ttl" \
			--doc_pf "$_prfl_pf" \
		;


		# POST PROCESS : REPORT STATUS --------

		[[ $_rslt == 2 ]] \
		&& return $tru \
		|| return $_rslt \
		;


	} ;



# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# DEFAULT STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# CONSTRUCTOR
# ======================================================================================

	# [ arguments ]
	local -a _ax=("$@") ;


	# ARGUMENT : POSITIONED --------

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


		# [ method ]
		local _mtd ;


		case "$mtd__" in

			cfg | configure ) _mtd=SpairaruCtlr_Cfgtv__cfg ;;

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
