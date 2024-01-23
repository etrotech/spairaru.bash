#!/usr/bin/env bash
# ######################################################################################
# CRON UTILITY
# ######################################################################################
# ======================================================================================
# GET CRON PROFILE PATH
# ======================================================================================
s_gtCronPrflPf() {


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
	# 	├─ 🖿 etc
	# 	│  ├─ 🖿 cron.d
	# 	│  │  ├─ 🖺 s
	# 	│  │  └─ 🖺 $USER
	# 	│  ├─ 🖿 cron.daily
	# 	│  ├─ 🖿 cron.hourly
	# 	│  ├─ 🖿 cron.monthly
	# 	│  ├─ 🖿 cron.weekly
	# 	│  └─ 🖺 crontab 👈
	# 	└─ 🖿 var
	# 	   └─ 🖿 spool
	# 	      ├─ 🖺 cron
	# 	      ├─ 🖺 atjobs
	# 	      ├─ 🖺 atspool
	# 	      └─ 🖿 crontabs
	# 	         └─ ...
#

	# - scope is global
	elif [[ $prfl_scp == "dflt" ]] ;
	then

		_prfl_fl_abs_pf="/etc/crontab" ;


	# C ) GLOBAL
	# 	🛠️
	# 	├─ 🖿 etc
	# 	│  ├─ 🖿 cron.d
	# 	│  │  ├─ 🖺 s 👈
	# 	│  │  └─ 🖺 $USER
	# 	│  ├─ 🖿 cron.daily
	# 	│  ├─ 🖿 cron.hourly
	# 	│  ├─ 🖿 cron.monthly
	# 	│  ├─ 🖿 cron.weekly
	# 	│  └─ 🖺 crontab
	# 	└─ 🖿 var
	# 	   └─ 🖿 spool
	# 	      ├─ 🖺 cron
	# 	      ├─ 🖺 atjobs
	# 	      ├─ 🖺 atspool
	# 	      └─ 🖿 crontabs
	# 	         └─ ~

	# - scope is global
	elif [[ $prfl_scp == "glo" ]] ;
	then

		_prfl_fl_abs_pf="/etc/cron.d/${S_S_CLI}" ;


	# D ) LOCAL
	# 	🛠️
	# 	├─ 🖿 etc
	# 	│  ├─ 🖿 cron.d
	# 	│  │  ├─ 🖺 s
	# 	│  │  └─ 🖺 $USER 👈
	# 	│  ├─ 🖿 cron.daily
	# 	│  ├─ 🖿 cron.hourly
	# 	│  ├─ 🖿 cron.monthly
	# 	│  ├─ 🖿 cron.weekly
	# 	│  └─ 🖺 crontab
	# 	└─ 🖿 var
	# 	   └─ 🖿 spool
	# 	      ├─ 🖺 cron
	# 	      ├─ 🖺 atjobs
	# 	      ├─ 🖺 atspool
	# 	      └─ 🖿 crontabs
	# 	         └─ ~

	# - otherwise
	else

		_prfl_fl_abs_pf="/etc/cron.d/${USER}" ;


	fi ;


	# POST PROCESS : OUTPUT RESULT --------

	echo $_prfl_fl_abs_pf ;


	# POST PROCESS : REPORT STATUS --------

	return $tru ;


} ;
