#!/usr/bin/env bash
# ######################################################################################
# GIT CORE UTILITY
# ######################################################################################
# ======================================================================================
# GET GIT DIRECTORY PATH
# ======================================================================================
s_gtGitDirPf() {


	# [ arguments ]
	local _ax=("$@") ;


	# NAMED ARGUMENT --------

	# [ named_arguments ]
	local -A _nax=` \
		spairaru \
			cbl \
				nax \
					--dir_abs_pf "d" "dir" "directory" \
					--dir_abs_pf-nov 1 \
	` ;


	# MAIN PROCESS : GET REAL PATH --------

	# [ git_directory_absolute_path ]
	local dir_abs_pf="${_nax[dir_abs_pf]}" ;


	# - path is gving
	if [[ "$dir_abs_pf" ]] ;
	then

		realpath \
			"$dir_abs_pf" \
		&& return $tru \
		;


	# MAIN PROCESS : GET WOrKING DIRECTORY --------

	# - path is not gving
	else


		# [ current_working_directory ]
		local _cwd="` \
			git \
				rev-parse \
				--show-toplevel \
				2>/dev/null \
		`" ;


		# - result is not empty
		# - result is not error
		[[ \
			"$_cwd" \
			&& ! "$_cwd" =~ "fatal" \
		]] \
		&& echo "$_cwd" \
		&& return $tru \
		;


	fi ;


	return $fls ;


} ;



# ======================================================================================
# GET GIT PROFILE PATH
# ======================================================================================
s_gtGitPrflPf() {


	# [ arguments ]
	local -a _ax=("$@") ;


	# NAMED ARGUMENT --------

	# [ named_arguments ]
	local -A _nax=` \
		spairaru \
			cbl \
				nax \
					--prfl_scp "scp" "scope" \
					--prfl_scp-nov 1 \
					--prfl_scp-opt-dflt "dflt" "defalt" \
					--prfl_scp-opt-glo "glo" "global" \
					\
					--dir_abs_pf "d" "dir" "directory" \
					--dir_abs_pf-nov 1 \
	` ;


	# [ profile_scope ]
	local prfl_scp="${_nax[prfl_scp]}" ;


	# MAIN PROCESS : DETERMINE PROFILE --------

	# [ profile_file_absolute_path ]
	local _prfl_fl_abs_pf ;


	# A ) DEFAULT
	# 	🛠️
	# 	├─ 🖿 etc
	# 	│  └─ 🖺 gitconfig 👈
	# 	├─ 🖿 $HOME
	# 	?  └─ 🖺 .gitconfig
	# 	└─ 🖿 $PWD
	# 	   └─ 🖿 .git
	# 	      └─ 🖺 config

	# - scope is default
	if [[ $prfl_scp == "dflt" ]] ;
	then

		# /etc/gitconfig
		_prfl_fl_abs_pf="/etc/gitconfig" ;


	# C ) GLOBAL
	# 	🛠️
	# 	├─ 🖿 etc
	# 	│  └─ 🖺 gitconfig
	# 	├─ 🖿 $HOME
	# 	?  └─ 🖺 .gitconfig 👈
	# 	└─ 🖿 $PWD
	# 	   └─ 🖿 .git
	# 	      └─ 🖺 config

	# - scope is global
	elif [[ $prfl_scp == "glo" ]] ;
	then

		# ~/.gitconfig
		_prfl_fl_abs_pf="${HOME}/.gitconfig" ;


	# D ) LOCAL
	# 	🛠️
	# 	├─ 🖿 etc
	# 	│  └─ 🖺 gitconfig
	# 	├─ 🖿 $HOME
	# 	?  └─ 🖺 .gitconfig 👈
	# 	└─ 🖿 $PWD
	# 	   └─ 🖿 .git
	# 	      └─ 🖺 config 👈

	# - otherwise
	else


		# ?/.git/config
		if [[ "$dir_abs_pf" ]] ;
		then 
		
			_prfl_fl_abs_pf="${dir_abs_pf}/.git/config" ;
		

		else 


			# [ directory_absolute_path ]
			local _dir_abs_pf="` \
				s_gtGitDirPf \
					"$@" \
			`" ;


			_prfl_fl_abs_pf="${dir_abs_pf}/.git/config" ;


		fi ;


	fi ;


	# MAIN PROCESS : OUTPUT RESULT --------

	[[ -f "$_prfl_fl_abs_pf" ]] \
	&& echo "$_prfl_fl_abs_pf" \
	;


	# POST PROCESS : REPORT STATUS --------

	return $tru ;


} ;
