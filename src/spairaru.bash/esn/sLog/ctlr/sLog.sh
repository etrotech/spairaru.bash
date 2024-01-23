#!/usr/bin/env bash
# ######################################################################################
# LOG CONTROLLER UTILITY GROUP
# ######################################################################################
LogCtlr() (


# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ALTERNATIVE STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# EMERGENCY
# ======================================================================================
	emrg() {


		# MAIN PROCESSES --------

		ad \
			"$@" \
			--prio 0 \
		;


		# POST PROCESS : REPORT STATUS --------

		return $? ;


	} ;



# ======================================================================================
# ALERT
# ======================================================================================
	alt() {


		# MAIN PROCESSES --------

		ad \
			"$@" \
			--prio 1 \
		;


		# POST PROCESS : REPORT STATUS --------

		return $? ;


	} ;



# ======================================================================================
# CRITICAL
# ======================================================================================
	crit() {


		# MAIN PROCESSES --------

		ad \
			"$@" \
			--prio 2 \
		;


		# POST PROCESS : REPORT STATUS --------

		return $? ;


	} ;



# ======================================================================================
# ERROR
# ======================================================================================
	err() {


		# MAIN PROCESSES --------

		ad \
			"$@" \
			--prio 3 \
		;


		# POST PROCESS : REPORT STATUS --------

		return $? ;


	} ;



# ======================================================================================
# WARNING
# ======================================================================================
	wrn() {


		# MAIN PROCESSES --------

		ad \
			"$@" \
			--prio 4 \
		;


		# POST PROCESS : REPORT STATUS --------

		return $? ;


	} ;



# ======================================================================================
# NOTICE
# ======================================================================================
	ntc() {


		# MAIN PROCESSES --------

		ad \
			"$@" \
			--prio 5 \
		;


		# POST PROCESS : REPORT STATUS --------

		return $? ;


	} ;



# ======================================================================================
# INFORMATION
# ======================================================================================
	ifo() {


		# MAIN PROCESSES --------

		ad \
			"$@" \
			--prio 6 \
		;


		# POST PROCESS : REPORT STATUS --------

		return $? ;


	} ;



# ======================================================================================
# DEBUG
# ======================================================================================
	dbg() {


		# MAIN PROCESSES --------

		ad \
			"$@" \
			--prio 7 \
		;


		# POST PROCESS : REPORT STATUS --------

		return $? ;


	} ;



# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# CORE STATIC PUBLIC FUNCTION
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ======================================================================================
# MESSAGE
# ======================================================================================
	msg() {


		# [ arguments ]
		local -a _ax=("$@") ;

		# [ result ]
		local _rslt=$tru ;


		# POSITIONED ARGUMENT --------

		# [ positoined_arguments ]
		local -a _pax=` \
			s_gtCblPax \
		` ;


		# [ message ]
		local msg__="${_pax[0]}" ;


		# NAMED ARGUMENT --------

		# [ named_arguments ]
		local -A _nax=` \
			s_gtCblNax \
				--fac "f" "facility" \
				--fac-nov 1 \
				--fac-xasgmt \
				\
				--tag "t" \
				--tag-nov 1 \
				\
				--prio "p" "priority" \
				--prio-nov 1 \
		` ;


		# [ tag ]
		local -a tag="${_nax[tag]}" ;

		# [ prio ]
		local -a prio="${_nax[prio]}" ;


		# [ facilities ]
		local -a _facx="${_nax[fac]}" ;


		# PRECHECK : MESSAGE --------

		if [[ -z "$msg__" ]] ;
		then 


			[[ $env_vbo == $tru ]] \
			&& s_ivkPptTpl_CblMpa \
				"Message" \
				--pos "1st" \
			;


			return $fls ;


		fi ;


		# PRE PROCESS : DETERMINE FACILITY --------

		[[ "${#_facx[@]}" -eq 0 ]] \
		&& _facx=("user") \
		;


		# PRE PROCESS : DETERMINE PRIORITY --------

		[[ -z "$prio" ]] \
		&& prio=6 \
		;


		# MAIN PROCESS : BUILD OPTIONS --------

		# [ options ]
		local -a _optx ;

		# [ facility ]
		local _fac ;


		# FACILITY & PRIORITY

		for (( i=0 ; i < ${#_facx[@]} ; i++ )) ;
		do


			[[ "${_facx[$i]}" =~ ^.*\..* ]] \
			&& _fac="${_facx[$i]}" \
			|| _fac="${_facx[$i]}.${prio}" \
			;


			[[ "${_optx[0]}" ]] \
			&& _optx[0]+=",${_fac}" \
			|| _optx[0]="-p ${_fac}" \
			;


		done ;


		# TAG

		[[ "$tag" ]] \
		&& _optx+=(-t "$tag") \
		;


		# MAIN PROCESS : BUILD OPTIONS --------

		logger \
			"${_optx[@]}" \
			"$msg__" \
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

	# - action is callable
	if [[ "`
		type \
			-t \
			$mtd__ \
			2>/dev/null \
	`" ]] ;
	then


		shift 1 ;


		"$mtd__" \
			"$@" \
		;


		return $? ;


	fi ;


	# POST PROCESS : REPORT STATUS --------

	return $fls ;


 ) ;
