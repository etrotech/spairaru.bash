#!/usr/bin/env bash
# ######################################################################################
# PROMPT CONTROLLER UTILITY GROUP
# ######################################################################################
PptCtlr() {


# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# CORE STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# POP
# ======================================================================================
	PptCtlr__pop() {


		# MAIN PROCESSES --------

		printf \
			"$@" \
		;


		# POST PROCESS : REPORT STATUS --------

		return $tru ;



	} ;



# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# PREFORMAT STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# INVOKE
# ======================================================================================
	PptCtlr__ivk() {


		# [ result ]
		local _rslt=$tru ;


		# HELP --------

		s_isHlp \
			"$@" \
		&& echo "" \
		&& return $_rslt \
		;


		# VERSION --------

		s_isVer \
			"$@" \
		&& echo "" \
		&& return $_rslt \
		;


		# MAIN PROCESSES --------

		# [ tempalte ]
		local _tpl="` \
			PptCtlr__tpl \
				"$@" \
				--atn qry \
		`" ;


		# - template exists
		# - template is callable
		if [[ \
			"$_tpl" \
			&& "` \
				type \
					-t \
					"$_tpl" \
			`" \
		]] ;
		then


			shift \
			&& $_tpl \
				"$@" \
			;


			_rslt=$? ;


		else

			_rslt=$fls ;


		fi ;


		# POST PROCESS : REPORT STATUS --------

		return $_rslt ;


	} ;



# ======================================================================================
# TEMPLATE
# ======================================================================================
	PptCtlr__tpl() {


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

		# [ positoined_arguments ]
		local -a _pax=` \
			s_gtCblPax
		` ;


		# [ key ]
		local ky__="${_pax[0]}" ;

		# [ template ]
		local tpl__="${_pax[1]}" ;


		# NAMED ARGUMENT --------

		# [ named_arguments ]
		local -A _nax=` \
			s_gtCblNax \
				--atn "action" \
				--atn-nov 1 \
				--atn-dflt "ivk" \
				--atn-opt-ad "ad" "add" \
				--atn-opt-dl "dl" "delete" \
				--atn-opt-qry "qry" "query" \
		` ;


		# [ action ]
		local atn="${_nax[atn]}" ;


		# PRECHECK : KEY --------

		if [[ -z "$ky__" ]] ;
		then 


			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_CblMpa \
				"Template Key" \
				--pos "1st" \
			;


			return $fls ;


		fi ;


		# PRECHECK : TEMPLATE --------

		if [[ \
			$atn == "ad" \
			&& -z "$tpl__" \
		]] ;
		then 


			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_CblMpa \
				"Template" \
				--pos "2nd" \
			;


			return $fls ;


		fi ;


		# MAIN PROCESS : ADD TEMPLATE --------

		if [[ $atn == "ad" ]] ;
		then

			# - template exists
			# - enforce is not enabled
			[[ \
				"${S_PPT_TPLX[$ky__]}" \
				&& $env_nfc != $tru \
			]] \
			&& _rslt=2 \
			|| S_PPT_TPLX[$ky__]="$tpl__" \
			;


		# MAIN PROCESS : DELETE TEMPLATE --------

		elif [[ $atn == "dl" ]] ;
		then

			# - template exists
			[[ "${S_PPT_TPLX[$ky__]}" ]] \
			&& unset S_PPT_TPLX[$ky__] \
			|| _rslt=2 \
			;


		# MAIN PROCESS : INVOKE TEMPLATE --------

		else

			[[ "${S_PPT_TPLX[$ky__]}" ]] \
			&& echo "${S_PPT_TPLX[$ky__]}" \
			|| _rslt=$fls \
			;


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
			--src_ttl "$ky__" \
			\
			--dst_ttl "templates" \
		;


		# POST PROCESS : REPORT STATUS --------

		[[ $_rslt == 2 ]] \
		&& return $tru \
		|| return $_rslt \
		;


	} ;



# ======================================================================================
# TEMPLATES
# ======================================================================================
	PptCtlr__tplx() {


		s_cnvDic2Str \
			"${!S_PPT_TPLX[@]}" \
			"${S_PPT_TPLX[$@]}" \
		;


	} ;



# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# QUESTIONARY STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# ASK
# ======================================================================================
	PptCtlr__ask() {


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


		# [ quesiton ]
		local qn__="${_pax[0]}" ;


		# NAMED ARGUMENT --------

		# [ named_arguments ]
		local -A _nax=` \
			s_gtCblNax \
				--alw_mpt "allow_empty" \
				\
				--ans "a" "answer" \
				--ans-nov 1 \
				\
				--dsc "d" "dsc" "description" \
				--dsc-nov 1 \
				--dsc-xasgmt \
				\
				--mhr "m" "macther" \
				--mhr-nov 1 \
				\
				--opt "o" "option" \
				--opt-nov 2 \
				--opt-xasgmt \
				\
				--qn "q" "quesiton" \
				--qn-nov 1 \
				\
				--typ "t" "type" \
				--typ-nov 1 \
				\
				--dflt "default" \
				--dflt-nov 1 \
				--dflt-xasgmt \
		` ;


		# [ allow_empty ]
		local alw_mpt="${_nax[alw_mpt]}" ;

		# [ answer ]
		[[ "${_nax[ans]}" ]] \
		&& local -n ans="${_nax[ans]}" \
		|| local ans \
		;

		# [ matcher ]
		local mhr="${_nax[mhr]}" ;

		# [ type ]
		local typ="${_nax[typ]}" ;


		# [ descriptions ]
		local -a dscx="${_nax[dsc]}" ;

		# [ defaults ]
		local -a dfltx="${_nax[dflt]}" ;

		# [ options ]
		local -a optx="${_nax[opt]}" ;

		# [ option_keys ]
		local -a _opt_kyx ;

		# [ option_values ]
		local -a _opt_vlux ;


		for (( i=0 ; i<"${#optx[@]}" ; i++ )) ;
		do


			local -a _dic="${optx[$i]}" ;


			_opt_kyx+=(${_dic[0]}) ;

			_opt_vlux+=("${_dic[1]}") ;


		done ;


		# [ need_to_ask ]
		local _nd2asl=$fls ;


		while : ;
		do


			echo "" ;


			# MAIN PROCESS : GENERAL --------

				# - Ask Question 👈
				# - Display Descriptions
				# - ...

				echo \
					-e \
					"${ANSI_F_W6_BL}Q:${_ANSI} `__ "$qn__"`" \
				;


				# - Ask Question
				# - Display Descriptions 👈
				# - ...

				if [[ -n "${dscx[@]}" ]] ;
				then

					for i in "${!dscx[@]}" ;
					do 


						# [ description ]
						local _dsc="`__ "${dscx[$i]}"`" ;


						# ▧ find
						# (\n|\r\n) 			: catach any linebreak to group 1
						# [^$] 					: expect the last linebreak
						# ▨ replace
						# \1 					: group 1
						# [[:space:]] 			: spaces

						echo \
							-e \
							"   ${ANSI_F_GR}*${_ANSI} ${_dsc}" \
						| sed \
							-r \
							-z \
							-e \
							's/(\n|\r\n)[^$]/\1     /g' \
						;


					done ;

				fi ;


			# MAIN PROCESS : INPUT TYPE --------

			if [[ $typ =~ ^(ipu|input)$ ]] ;
			then


				if \
					[[ -n "${dfltx[@]}" ]] \
					&& PptCtlr____askWthrUseDflt \
						"` \
							s_cnvArr2Str \
								"${dfltx[@]}" \
						`" \
				;
				then


					_nd2asl=$fls ;


					ans="${dfltx[0]}" ;

					break ;


				else

					_nd2asl=$tru ;


				fi ;


				if [[ $_nd2asl == $tru ]] ;
				then

					# - Ask Question
					# - Display Descriptions
					# - Get Answer 👈
					# - Match Answer

					echo "" ;

					echo \
						-e \
						"   ${ANSI_F_GR}`__ "* input reply followed by ${ANSI_F_W6_OR}↵${ANSI_F_GR} ."`" \
					;


					# - Ask Question
					# - Display Descriptions
					# - Get Answer
					# - Match Answer 👈

					while : ;
					do


						PptCtlr____awtAns \
							ans \
						;


						if [[ -n "$ans" ]] ;
						then 

							if [[ -n $mhr ]] ;
							then

								if [[ "$ans" =~ $mhr ]] ;
								then

									break 2 ;


								else

									echo "" ;

									echo \
										-e \
										"   ${ANSI_F_W6_RD}[ERR]${ANSI_F_PK} `__ "incorrect input. please retry in format: ${mhr}."`" \
									;


								fi ;


							else

								break 2 ;


							fi ;


						elif [[ $alw_mpt == $tru ]] ;
						then

								break 2 ;


						else :

							echo "" ;

							echo \
								-e \
								"   ${ANSI_F_W6_RD}[ERR]${ANSI_F_PK} `__ "empty input. please retry."`" \
							;


						fi ;


					done ;


				fi ;


			# MAIN PROCESS : MUTIPLE INPUT TYPE --------

			elif [[ $typ =~ ^(mxipu|mutiple_input)$ ]] ;
			then


				if \
					[[ -n "${dfltx[@]}" ]] \
					&& PptCtlr____askWthrUseDflt \
						"` \
							s_cnvArr2Str \
								"${dfltx[@]}" \
						`" \
				;
				then


					_nd2asl=$fls ;


					ans+=("${dfltx[@]}") ;

					break ;


				else

					_nd2asl=$tru ;


				fi ;


				if [[ $_nd2asl == $tru ]] ;
				then


					# [ count ]
					local _c=0 ;


					# - Ask Question
					# - Display Descriptions
					# - Get Answer 👈
					# - Match Answer

					echo "" ;

					echo \
						-e \
						"   ${ANSI_F_GR}`__ "* input each followed by ${ANSI_F_W6_OR}↵${ANSI_F_GR} , ends with ${ANSI_F_W6_OR}^ + D${_ANSI}${ANSI_F_GR} ."`" \
					;


					# - Ask Question
					# - Display Descriptions
					# - Get Answer
					# - Match Answer 👈

					printf "\n${ANSI_F_W6_BL}A:${_ANSI} " ;


					while read _ans ;
					do


						[[ $_c ]] \
						&& printf "   " \
						;


						ans+=("${_ans}") ;


						(( _c++ )) ;


					done ;


					# 4 ) Match Input
					if [[ "${ans[@]}" ]] ;
					then 

						break ;


					elif [[ $alw_mpt == $tru ]] ;
					then

						break ;


					else

						echo "" ;

						echo \
							-e \
							"   ${ANSI_F_W6_RD}[ERR]${ANSI_F_PK} `__ "empty input. please retry."`${_ANSI}\n" \
						;


					fi ;


				fi ;


			# MAIN PROCESS : SELECTION TYPE --------

			else


				if \
					[[ -n "${dfltx[@]}" ]] \
					&& PptCtlr____askWthrUseDflt \
						"` \
							s_cnvArr2Str \
								"${dfltx[@]}" \
						`" \
				;
				then


					_nd2asl=$fls ;


					ans="${dfltx[0]}" ;

					break ;


				else

					_nd2asl=$tru ;


				fi ;


				if [[ $_nd2asl == $tru ]] ;
				then


					# - Ask Question
					# - Display Descriptions
					# - Build Default Selection 👈
					# - Get Answer
					# - Match Answer

					if [[ -z "${_opt_kyx[@]}" ]] ; 
					then


						_opt_kyx+=(y)
						
						_opt_vlux+=("Yes") ;


						_opt_kyx+=(n)

						_opt_vlux+=("No") ;


					fi ;


					# - Ask Question
					# - Display Descriptions
					# - Build Default Selection
					# - Get Answer 👈
					# - Match Answer

					echo "" ;

					echo \
						-e \
						"   ${ANSI_F_GR}`__ "* choose one, or press ${ANSI_F_W6_OR}↵${ANSI_F_GR} for the 1st option."`" \
					;


					PptCtlr____bldAnsSel \
						"` \
							s_cnvArr2Str \
								"${_opt_kyx[@]}" \
						`" \
						"` \
							s_cnvArr2Str \
								"${_opt_vlux[@]}" \
						`" \
					;


					# - Ask Question
					# - Display Descriptions
					# - Build Default Selection
					# - Get Answer
					# - Match Answer 👈

					while : ;
					do


						PptCtlr____awtAns \
							ans \
						;


						# - answer is empty
						if [[ -z "$ans" ]] ;
						then


							ans="${_opt_kyx[0]}" ;

							break 2 ;


						# - answer matchs keys
						elif [[ \
							" ${_opt_kyx[@]} " =~ " ${ans} " \
							|| " ${_opt_vlux[@]} " =~ " ${ans} " \
						]] ; 
						then

							break 2 ;


						# - fallback
						else

							echo "" ;

							echo \
								-e \
								"   ${ANSI_F_W6_RD}[ERR]${ANSI_F_PK} `__ "incorrect reply. please input reply from selection."`" \
							;


						fi ;


					done ;


				fi ;


			fi ;

		done ;


		# POST PROCESS : REPORT STATUS --------

		return $tru ;


	} ;



# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# QUESTIONARY STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# __ASK WHETHER USE DFAULT
# ======================================================================================
	PptCtlr____askWthrUseDflt() {


		# [ answer ]
		local _ans ;


		# POSITIONED ARGUMENT --------

		# [ defaults ]
		local -a dfltx__="$@" ;


		# MAIN PROCESS : OUTPUT DEFAULTS --------
	
		if [[  -n "${dfltx__[@]}" ]] ;
		then


			echo "" ;


			echo \
				-e \
				"   ${ANSI_F_GR}`__ "answer is set to below"`" \
			;


			for i in "${!dfltx__[@]}" ;
			do 

				echo \
					-e \
					"   ${ANSI_F_LM}\055${_ANSI} `__ "${dfltx__[$i]}"`" \
				;

			done ;


		fi ;


		# MAIN PROCESS : OUTPUT DESCRIPTION --------

		echo "" ;

		echo \
			-e \
			"   ${ANSI_F_GR}`__ "Yes to continue, No to reset, or press ${ANSI_F_W6_OR}↵${ANSI_F_GR} for Yes."`" \
		;



		# MAIN PROCESS : OUTPUT SELECTION --------

		PptCtlr____bldAnsSel \
			'(y n)' \
			'(Yes No)' \
		;


		# POST PROCESS : DETERMINE ANSWER --------

		PptCtlr____awtAns \
			_ans \
		;


		if [[ \
			-z $_ans \
			|| $_ans =~ ^(y|`__ "Yes"`)$ \
		]] ;
		then

			return $tru


		else

			return $fls


		fi ;


	} ;



# ======================================================================================
# __BUILD ANSWER SELECTION
# ======================================================================================
	PptCtlr____bldAnsSel() {


		# POSITIONED ARGUMENT --------

		# [ keys ]
		local -a kyx__="$1" ;

		# [ values ]
		local -a vlux__="$2" ;


		# MAIN PROCESS : BUILD SELECTION --------

		# [ result ]
		local _rslt ;


		for (( i=0 ; i<${#kyx__[@]} ; i++ )) ;
		do


			[[ -n $_rslt ]] \
			&& _rslt+=" , " \
			;


			_rslt+="${ANSI_F_GR}[${ANSI_F_OR}${kyx__[$i]}${ANSI_F_GR}]${_ANSI} `__ "${vlux__[$i]}"`" ;


		done ;


		# POST PROCESS : OUTPUT SELECTION --------

		echo \
			-e \
			"   ${_rslt}" \
		;


	} ;



# ======================================================================================
# __AWAIT ANSWER
# ======================================================================================
	PptCtlr____awtAns() {


		# [ answer ]
		local -n ans__=$1 ;


		# MAIN PROCESS : OUTPUT HOLDER --------

		printf "\n${ANSI_F_W6_BL}A:${_ANSI} " ;


		# MAIN PROCESS : FIRE USER EVENT --------

		read \
			-r \
			ans__ \
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


	# MAIN PROCESS : METHOD --------

	# - method is set
	if [[ "$mtd__" ]] ;
	then


		# [ method ]
		local _mtd ;


		case "$mtd__" in


			# CORE

			pop ) _mtd=PptCtlr__pop ;;


			# PREFORMAT

			ivk | invoke ) _mtd=PptCtlr__ivk ;;


			tpl | template ) _mtd=PptCtlr__tpl ;;


			tplx | templates ) _mtd=PptCtlr__tplx ;;


			# PROGRESS BAR

			pb | ProgressBar ) _mtd=PptPbCtlr ;;


			# QUESTIONARY

			ask ) _mtd=PptCtlr__ask ;;


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
