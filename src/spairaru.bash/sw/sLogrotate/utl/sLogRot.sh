#!/usr/bin/env bash
# ######################################################################################
# LOG ROTATE UTILITY
# ######################################################################################
# ======================================================================================
# GET LOG ROTATE PROFILE PATH
# ======================================================================================
s_gtLogRotPrflPf() {


	# [ arguments ]
	local -a _ax=("$@") ;


	# NAMED ARGUMENT --------

	# [ named_arguments ]
	local -A _nax=` \
		spairaru \
				cbl \
					nax \
						--prfl_fl_abs_pf "prfl" "profile" "pf" "path" \
						--prfl_fl_abs_pf-nov 1 \
						\
						--prfl_scp "scp" "scope" \
						--prfl_scp-nov 1 \
						--prfl_scp-dflt "lo" \
						--prfl_scp-opt-dflt "dflt" "defalt" \
						--prfl_scp-opt-lo "lo" "local" \
						--prfl_scp-opt-glo "glo" "global" \
	` ;


	# [ profile_file_absolute_path ]
	local prfl_fl_abs_pf="${_nax[prfl_fl_abs_pf]}" ;

	# [ profile_scope ]
	local prfl_scp="${_nax[prfl_scp]}" ;


	# MAIN PROCESS : DETERMINE PROFILE --------

	# [ profile_file_absolute_path ]
	local _prfl_fl_abs_pf ;


	# A ) CUSTOM

	# - profile_path is set
	if [[ -n "$prfl_fl_abs_pf" ]] ;
	then

		_prfl_fl_abs_pf="$prfl_fl_abs_pf" ;


	# B ) DEFAULT
	# 	🛠️
	# 	└─ 🖿 etc
	# 	   ├─ 🖿 logrotate.d
	# 	   │  ├─ 🖺 s
	# 	   │  └─ 🖺 $USER
	# 	   └─ 🖺 logrotate.conf 👈

	# - scope is default
	elif [[ $prfl_scp == "dflt" ]] ;
	then

		# /etc/logrotate.conf
		_prfl_fl_abs_pf="/etc/logrotate.conf" ;


	# C ) GLOBAL
	# 	🛠️
	# 	└─ 🖿 etc
	# 	   ├─ 🖿 logrotate.d
	# 	   │  ├─ 🖺 s 👈
	# 	   │  └─ 🖺 $USER
	# 	   └─ 🖺 logrotate.conf

	# - scope is global
	elif [[ $prfl_scp == "glo" ]] ;
	then

		# /etc/logrotate.d/rlog.prfl
		_prfl_fl_abs_pf="/etc/logrotate.d/${S_S_CLI}" ;


	# D ) LOCAL
	# 	🛠️
	# 	└─ 🖿 etc
	# 	   ├─ 🖿 logrotate.d
	# 	   │  ├─ 🖺 s
	# 	   │  └─ 🖺 $USER 👈
	# 	   └─ 🖺 logrotate.conf

	# - otherwise
	else

		# /etc/logrotate.d/xxx
		_prfl_fl_abs_pf="/etc/logrotate.d/${USER}" ;


	fi ;


	# MAIN PROCESS : OUTPUT RESULT --------

	echo "$_prfl_fl_abs_pf" ;


	# POST PROCESS : REPORT STATUS --------

	return $tru ;


} ;
