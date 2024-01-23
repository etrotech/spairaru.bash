#!/usr/bin/env bash
# ######################################################################################
# REGEX UTILITY
# ######################################################################################
# ======================================================================================
# GET REGEX GROUP COUNT
# ======================================================================================
s_gtRgxGrpCt() {


	# [ arguments ]
	local -a _ax=("$@") ;

	# [ result ]
	local _rslt=$tru ;


	# POSITIONED ARGUMENT --------

	# [ positoined_arguments ]
	local -a _pax=` \
		s_gtCblPax \
	` ;


	# [ expression ]
	local xprsn__="${_pax[0]}" ;


	# PRECHECK --------

	[[ -z $xprsn__ ]] \
	&& echo 0 \
	&& return $fls \
	;


	# MAIN PROCESS : MATCH CONDITIONS --------

	# [ count ]
	local _c=0 ;



	for (( i=0 ; i<${#xprsn__} ; i++ )) 
	do 

		if [[ ${xprsn__:i:1} == \( ]] ;
		then

			[[ \
				$i == 0 \
				|| ${xprsn__:i-1:1} != \\ \
			]] \
			&& (( _c++ )) \
			;

		fi ;

	done ;


	# POST PROCESS : OUTPUT RESUILT --------

	echo $_c ;


	# POST PROCESS : REPORT STATUS --------

	return $_rslt ;


} ;
