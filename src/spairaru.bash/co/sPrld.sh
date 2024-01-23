#!/usr/bin/env bash
# ######################################################################################
# PRELOAD
# ######################################################################################
# --------------------------------------------------------------------------------------
# OVERRIDE
# --------------------------------------------------------------------------------------

# [ is_spairaru_override_loaded ]
[[ -z $_is_s_ovr_ldd  ]] \
&& declare _is_s_ovr_ldd=1 \
;

# ↑ is use to watch if scope is nested.
# In nested scope, inherit outter scope environmental definings,
# and avoid loading duplication.


if [[ $_is_s_ovr_ldd == 1 ]] ;
then


	. "${BASH_SOURCE[0]%/*}"/sOvr.sh ;


	_is_s_ovr_ldd=$tru ;


fi ;



# --------------------------------------------------------------------------------------
# FUNDATION
# --------------------------------------------------------------------------------------

# [ is_spairaru_fundation_loaded ]
[[ -z $_is_s_fdn_ldd ]] \
&& declare _is_s_fdn_ldd=$fls \
;

# ↑ is use to watch if scope is nested.
# In nested scope, inherit outter scope environmental definings,
# and avoid loading duplication.


if [[ $_is_s_fdn_ldd == $fls ]] ;
then


	. "${BASH_SOURCE[0]%/*}"/def/sSpairaru.sh
	. "${BASH_SOURCE[0]%/*}"/utl/sDat.sh
	. "${BASH_SOURCE[0]%/*}"/utl/sCbl.sh
	. "${BASH_SOURCE[0]%/*}"/utl/sCfgtv.sh


	# A ) PREFERENCES

	# [ preference_file_absolute_paths ]
	declare -a _prf_fl_abs_pfx ;


		# i ) DEFAULT
		# 	🛠️
		# 	├─ 🖿 etc
		# 	│  └─ 🖿 EtroTech spairaru.bash
		# 	│     ├─ 🖺 *.env 👈
		# 	│     ├─ 🖺 s.cnf 👈
		# 	│     └─ 🖺 *.ini 👈
		# 	├─ 🖿 $HOME
		# 	│  └─ 🖿 .s.bash
		# 	│     ├─ 🖺 *.env
		# 	│     ├─ 🖺 s.cnf
		# 	?     └─ 🖺 *.ini
		# 	└─ 🖿 $PWD
		# 	   └─ 🖿 .s.bash
		# 	      ├─ 🖺 *.env
		# 	      └─ 🖺 s.cnf
		# 	      └─ 🖺 *.ini

		if [[ -d "$S_D_CNF_FLDR" ]] ;
		then


			_prf_fl_abs_pfx+=(` \
				ls \
					"$S_D_CNF_FLDR"/*.env \
					2>/dev/null \
			`) \
			;


			_prf_fl_abs_pfx+=(` \
				ls \
					"$S_D_CNF_FLDR"/*.ini \
					2>/dev/null \
			`) \
			;


		fi ;


		# ii ) GLOBAL
		# 	🛠️
		# 	├─ 🖿 etc
		# 	│  └─ 🖿 EtroTech spairaru.bash
		# 	│     ├─ 🖺 *.env
		# 	│     ├─ 🖺 s.cnf
		# 	│     └─ 🖺 *.ini
		# 	├─ 🖿 $HOME
		# 	│  └─ 🖿 .s.bash
		# 	│     ├─ 🖺 *.env 👈
		# 	│     ├─ 🖺 s.cnf 👈
		# 	?     └─ 🖺 *.ini 👈
		# 	└─ 🖿 $PWD
		# 	   └─ 🖿 .s.bash
		# 	      ├─ 🖺 *.env
		# 	      └─ 🖺 s.cnf
		# 	      └─ 🖺 *.ini

		if [[ -d "$S_G_CNF_FLDR" ]] ;
		then


			_prf_fl_abs_pfx+=(` \
				ls \
					"$S_G_CNF_FLDR"/*.env \
					2>/dev/null \
			`) \
			;


			_prf_fl_abs_pfx+=(` \
				ls \
					"$S_G_CNF_FLDR"/*.ini \
					2>/dev/null \
			`) \
			;


		fi ;


		# iii ) LOCAL
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
		# 	      ├─ 🖺 *.env 👈
		# 	      └─ 🖺 s.cnf 👈
		# 	      └─ 🖺 *.ini 👈


		if [[ -d "${PWD}/.${S_NM}" ]] ;
		then


			_prf_fl_abs_pfx+=(` \
				ls \
					"${PWD}/.${S_NM}"/*.env \
					2>/dev/null \
			`) \
			;


			_prf_fl_abs_pfx+=(` \
				ls \
					"${PWD}/.${S_NM}"/*.ini \
					2>/dev/null \
			`) \
			;


		fi ;


	# [ preferences ]
	declare -A _prfx=` \
		s_ldCnfFl \
			"${_prf_fl_abs_pfx[@]}" \
	` ;


	# B ) CONFIGURATIONS

		IFS=$'\n' ;


		# i ) CORE

		# [ file_absolute_path ]
		for fl_abs_pf in "${BASH_SOURCE[0]%/*}"/def/*.sh ;
		do

			[[ ! "$fl_abs_pf" =~ \* ]] \
			&& . "$fl_abs_pf" \
			;

		done ;


		# ii ) ESSENTIAL CONPONENT

		# [ file_absolute_path ]
		for fl_abs_pf in "${BASH_SOURCE[0]%/*/*}"/esn/*/def/*.sh ;
		do

			[[ ! "$fl_abs_pf" =~ \* ]] \
			&& . "$fl_abs_pf" \
			;

		done ;


		# iii ) SOFTWARE CONPONENT

		# [ file_absolute_path ]
		for fl_abs_pf in "${BASH_SOURCE[0]%/*/*}"/sw/*/def/*.sh ;
		do

			[[ ! "$fl_abs_pf" =~ \* ]] \
			&& . "$fl_abs_pf" \
			;

		done ;


	_is_s_fdn_ldd=$tru ;


fi ;



# --------------------------------------------------------------------------------------
# CORE CONPONENT
# --------------------------------------------------------------------------------------

# [ is_spairaru_core_conponent_loaded ]
[[ -z $_is_s_co_cpnt_ldd ]] \
&& declare _is_s_co_cpnt_ldd=$fls \
;

# ↑ is use to watch if scope is nested.
# In nested scope, inherit outter scope environmental definings,
# and avoid loading duplication.


if [[ $_is_s_co_cpnt_ldd == $fls ]] ;
then


	# [ file_absolute_path ]
	for fl_abs_pf in "${BASH_SOURCE[0]%/*}"/utl/*.sh ;
	do

		[[ \
			! "$fl_abs_pf" =~ \* \
			&& ! "`basename "$fl_abs_pf"`" =~ ^_
		]] \
		&& . "$fl_abs_pf" \
		;

	done ;


	# [ file_absolute_path ]
	for fl_abs_pf in "${BASH_SOURCE[0]%/*}"/ctlr/*.sh ;
	do

		[[ ! "$fl_abs_pf" =~ \* ]] \
		&& . "$fl_abs_pf" \
		;

	done ;


	_is_s_co_cpnt_ldd=$tru ;


fi ;



# --------------------------------------------------------------------------------------
# REPOSITORY
# --------------------------------------------------------------------------------------

# [ is_spairaru_conponent_repository_defined ]
[[ -z $_is_s_cpnt_rpo_defd ]] \
&& declare _is_s_cpnt_rpo_defd=$fls \
;

# ↑ are use to watch if scope is nested.
# In nested scope, inherit outter scope environmental definings,
# and avoid loading duplication.


if [[ $_is_s_cpnt_rpo_defd == $fls ]] ;
then


	# [ spairaru_component_aliases ]
	declare -A __s_cpnt_akax__ ;

	# ↑ each element contains aliases in format :
	# 	[controller_name]=controller_name|alias_name...

	# [ spairaru_component_loader ]
	declare -A __s_cpnt_ldr__ ;

	# ↑ each element contains in format :
	# 	[controller_name]=script_path

	# [ spairaru_component_loaded ]
	declare -A __s_cpnt_ldd__ ;

	# ↑ each element contains in format :
	# 	[script_path]=(0|1)

	# [ spairaru_component_requirements ]
	declare -A __s_cpnt_rqrmtx__ ;

	# ↑ each element contains requirements in format :
	# 	[controller_name]=(controller_name|alias_name)...


	_is_s_cpnt_rpo_defd=$tru ;


fi ;



# --------------------------------------------------------------------------------------
# ESSENSIAL CONPONENT
# --------------------------------------------------------------------------------------

# [ is_spairaru_essensial_conponent_loaded ]
[[ -z $_is_s_esn_cpnt_ldd ]] \
&& declare _is_s_esn_cpnt_ldd=$fls \
;

# ↑ are use to watch if scope is nested.
# In nested scope, inherit outter scope environmental definings,
# and avoid loading duplication.


if [[ $_is_s_esn_cpnt_ldd == $fls ]] ;
then


	# [ file_absolute_path ]
	for fl_abs_pf in "${BASH_SOURCE[0]%/*/*}"/esn/*/utl/*.sh ;
	do

		[[ \
			! "$fl_abs_pf" =~ \* \
			&& ! "`basename "$fl_abs_pf"`" =~ ^_
		]] \
		&& . "$fl_abs_pf" \
		;

	done ;


	# [ file_absolute_path ]
	for fl_abs_pf in "${BASH_SOURCE[0]%/*/*}"/esn/*/__cpnt__.sh ;
	do

		[[ ! "$fl_abs_pf" =~ \* ]] \
		&& . "$fl_abs_pf" \
		;

	done ;


	_is_s_esn_cpnt_ldd=$tru ;


fi ;



# --------------------------------------------------------------------------------------
# SOFTWARE CONPONENT
# --------------------------------------------------------------------------------------

# [ is_spairaru_software_conponent_loaded ]
[[ -z $_is_s_sw_cpnt_ldd ]] \
&& declare _is_s_sw_cpnt_ldd=$fls \
;

# ↑ are use to watch if scope is nested.
# In nested scope, inherit outter scope environmental definings,
# and avoid loading duplication.


if [[ $_is_s_sw_cpnt_ldd == $fls ]] ;
then


	# [ file_absolute_path ]
	for fl_abs_pf in "${BASH_SOURCE[0]%/*/*}"/sw/*/__cpnt__.sh ;
	do

		[[ ! "$fl_abs_pf" =~ \* ]] \
		&& . "$fl_abs_pf" \
		;

	done ;


	_is_s_sw_cpnt_ldd=$tru ;


fi ;



# --------------------------------------------------------------------------------------
# CLEARN UP
# --------------------------------------------------------------------------------------

unset _prf_fl_abs_pfx ;

unset _prfx ;

unset _fl_abs_pfx ;

unset fl_abs_pf ;



# --------------------------------------------------------------------------------------
# REPORT STATUS
# --------------------------------------------------------------------------------------

return $tru ;
