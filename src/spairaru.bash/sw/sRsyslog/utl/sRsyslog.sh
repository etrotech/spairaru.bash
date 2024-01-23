#!/usr/bin/env bash
# ######################################################################################
# RSYSLOG UTILITY
# ######################################################################################
# ======================================================================================
# GET RSYSLOG ROTATE PROFILE PATH
# ======================================================================================
s_gtRsyslogRotPrflPf() {


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
	# 🛠️
	# └─ etc
	#    ├─ rsyslog.d
	#    |  ├─ 50-spairaru.conf
	#    |  └─ 100-~.conf
	#    └─ rsyslog.conf 👈

	# - scope is default
	elif [[ $prfl_scp == "dflt" ]] ;
	then

		# /etc/rsyslog.conf
		_prfl_fl_abs_pf="/etc/rsyslog.conf" ;


	# C ) GLOBAL
	# 	🛠️
	# 	└─ 🖿 etc
	# 	   ├─ 🖿 rsyslog.d
	# 	   │  ├─ 🖺 50-spairaru.conf 👈
	# 	   │  └─ 🖺 100-~.conf
	# 	   └─ 🖺 rsyslog.conf

	# - scope is global
	elif [[ $prfl_scp == "glo" ]] ;
	then

		# /etc/rsyslog.d/rsyslog.prfl
		_prfl_fl_abs_pf="/etc/rsyslog.d/50-spairaru.conf" ;


	# D ) LOCAL
	# 	🛠️
	# 	└─ 🖿 etc
	# 	   ├─ 🖿 rsyslog.d
	# 	   │  ├─ 🖺 50-spairaru.conf
	# 	   │  └─ 🖺 100-~.conf 👈
	# 	   └─ 🖺 rsyslog.conf

	# - otherwise
	else

		# /etc/rsyslog.d/xxx
		_prfl_fl_abs_pf="/etc/rsyslog.d/100-${USER}.conf" ;


	fi ;


	# MAIN PROCESS : OUTPUT RESULT --------

	echo "$_prfl_fl_abs_pf" ;


	# POST PROCESS : REPORT STATUS --------

	return $tru ;


} ;
