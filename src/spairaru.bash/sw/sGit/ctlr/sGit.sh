#!/usr/bin/env bash
# ######################################################################################
# GIT CONTROLLER UTILITY GROUP
#
# File System Map:
# 	🛠️
# 	├─ 🖿 etc
# 	│  └─ 🖺 gitconfig 👈
# 	├─ 🖿 $HOME
# 	?  └─ 🖺 .gitconfig
# 	└─ 🖿 $PWD
# 	   └─ 🖿 .git
# 	      └─ 🖺 config
# 	🏠
# 	└─ 🖿 $PWD
# 	   └─ 🖿 .git
# 	      └─ 🖺 config
#
# ######################################################################################
GitCtlr() {


# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# CORE PRIVATE PROPERTY
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	# [ identity ]
	local __id__="git" ;

	# [ command_line ]
	local __cli__="git" ;



# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# CONFIGURATIVE STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# CONFIGURE
# ======================================================================================
	GitCtlr__cfg() {


		# MAIN PROCESSES --------

		GitPrflCtlr \
			cfg \
				"$@" \
		;


		# POST PROCESS : REPORT STATUS --------

		return $? ;


	} ;



# ======================================================================================
# OPTIMIZE
# ======================================================================================
	GitCtlr__optmz() {


		# [ arguments ]
		local _ax=("$@") ;


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


		# NAMED ARGUMENT --------

		# [ named_arguments ]
		local -A _nax=` \
			spairaru \
				cbl \
					nax \
						--nm "name" \
						--nm-nov 1 \
						\
						--eml "email" \
						--eml-nov 1 \
		` ;


		# [ name ]
		local nm="${_nax[nm]}" ;

		# [ email ]
		local eml="${_nax[eml]}" ;


		# MAIN PROCESS : GLOBAL --------

		# USER

		# 1 ) Email

		[[ \
			"$eml" \
			&& ! "` \
				GitPrflCtlr \
					cfg \
						"user.email" \
					\
			`" \
		]] \
		&& GitPrflCtlr \
			cfg \
				"user.email" \
				"$eml" \
			\
			--glo \
		;
			# 		--dir $dir_abs_pf \
			# --dir $dir_abs_pf \


		# 2 ) Name

		[[ \
			"$nm" \
			&& ! "` \
				GitPrflCtlr \
					cfg \
						"user.name" \
					\
			`" \
		]] \
		&& GitPrflCtlr \
			cfg \
				"user.name" \
				"$nm" \
			\
			--glo \
		;


		# ENVIRONMENT

		# 1 ) Bypass Repository Check

		[[ ! "` \
			GitPrflCtlr \
				cfg \
					"safe.directory" \
		`" ]] \
		&& GitPrflCtlr \
			cfg \
				"safe.directory" \
				"*" \
			\
			--glo \
		;


		# 2 ) Enable Symbolic Link

		[[ ! "` \
			GitPrflCtlr \
				cfg \
					"user.symlinks" \
		`" ]] \
		&& GitPrflCtlr \
			cfg \
				"user.symlinks" \
				true \
			\
			--glo \
		;


		# MERGE SOLUTION

		# 1 ) merge.tool
		[[ ! "` \
			GitPrflCtlr \
				cfg \
					"merge.tool" \
		`" ]] \
		&& GitPrflCtlr \
			cfg \
				"merge.tool" \
				"vimdiff" \
			\
			--glo \
		;


		# 2 ) merge.conflictstyle
		[[ ! "` \
			GitPrflCtlr \
				cfg \
					"merge.conflictstyle" \
		`" ]] \
		&& GitPrflCtlr \
			cfg \
				"merge.conflictstyle" \
				"diff3" \
			\
			--glo \
		;


		# 3 ) mergetool.prompt
		[[ ! "` \
			GitPrflCtlr \
				cfg \
					"mergetool.prompt" \
		`" ]] \
		&& GitPrflCtlr \
			cfg \
				"mergetool.prompt" \
				"false" \
			\
			--glo \
		;


		# POST PROCESS : REPORT STATUS --------

		return $tru ;


	} ;



# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# PACKAGE CORE STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# INSTALL
# ======================================================================================
	GitCtlr__istl() {


		# POST PROCESSES --------

		spairaru \
			os \
				istl \
					$__id__ \
		;


		# POST PROCESS : REPORT STATUS --------

		return $? ;


	} ;



# ======================================================================================
# UNINSTALL
# ======================================================================================
	GitCtlr__uistl() {


		# POST PROCESSES --------

		spairaru \
			os \
				uistl \
					$__id__ \
		;


		# POST PROCESS : REPORT STATUS --------

		return $? ;


	} ;



# ======================================================================================
# UPGRADE
# ======================================================================================
	GitCtlr__upg() {


		# POST PROCESSES --------

		spairaru \
			os \
				upg \
					$__id__ \
		;


		# POST PROCESS : REPORT STATUS --------

		return $? ;


	} ;



# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# PACKAGE STATEFUL STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# IS INSTALLED
# ======================================================================================
	GitCtlr__isIstld() {


		# POST PROCESSES --------

		spairaru \
			os \
				isIstld \
					$__id__ \
					--cli $__cli__ \
		;


		# POST PROCESS : REPORT STATUS --------

		return $? ;


	} ;



# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# DEFAULT STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# CONSTRUCTOR
# ======================================================================================


	# [ arguments ]
	local _ax=("$@") ;


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
					--nfc "f" "enforce" \
	` ;


	# [ enforce ]
	local nfc="${_nax[nfc]}" ;


	# PRE PROCESS : DIRECTORY PATH --------

	# [ directory_absolute_path ]
	local dir_abs_pf="` \
		s_gtGitDirPf \
			"$@" \
	`" ;


	# PRE PROCESS : GIT OPTIONS --------

	# [ git_tier1_named_arguments ]
	local -a _git_t1_nax ;


	# - directory is set
	[[ -n "$dir_abs_pf" ]] \
	&& _git_t1_nax+=(-C "$dir_abs_pf") \
	;


	# MAIN PROCESS : METHOD --------

	# [ method ]
	local _mtd ;


	case "$mtd__" in


		# CONFIGURATIVE

		cfg | configure ) _mtd=GitCtlr__cfg ;;

		optmz | optimize ) _mtd=GitCtlr__optmz ;;


		# CORE

		prfl | profile ) _mtd=GitPrflCtlr ;;

		tr | tree ) _mtd=GitTrCtlr ;;


		# PAKAGE CORE

		istl | install ) _mtd=GitCtlr__istl ;;

		uistl | uninstall ) _mtd=GitCtlr__uistl ;;

		upg | upgrade ) _mtd=GitCtlr__upg ;;


		# PAKAGE STATEFUL

		isIstld | isIsntalled ) _mtd=GitCtlr__isIstld ;;


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


	if [[ "$dir_abs_pf" ]] ;
	then


		GitTrCtlr \
			"$@" \
		;


		return $? ;


	fi ;


	# POST PROCESS : REPORT STATUS --------

	return $fls ;


} ;
