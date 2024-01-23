#!/usr/bin/env bash
# ######################################################################################
# COMPONENT
# ######################################################################################

# [ arguments ]
local -a _ax=("$@") ;



# --------------------------------------------------------------------------------------
# POSITIONED ARGUMENT
# --------------------------------------------------------------------------------------

# [ positoined_arguments ]
local -a _pax=` \
	s_gtCblPax \
` ;


[[ ${#_pax[@]} -lt 2 ]] \
&& return $fls \
;


# [ controller ]
local Ctlr__="${_pax[0]}" ;

# [ aliases ]
local -a akax__=("${_pax[@]:1:${#_pax[@]}-2}") ;

# [ path ]
local pf__="${_pax[@]: -1}" ;



# --------------------------------------------------------------------------------------
# NAMED ARGUMENT
# --------------------------------------------------------------------------------------

# [ named_arguments ]
local -A _nax=` \
	s_gtCblNax \
		--rqr "require" \
		--rqr-nov 1 \
		--rqr-xasgmt \

` ;


# [ requirements ]
local -a rqrmtx="${_nax[rpr]}" ;



# --------------------------------------------------------------------------------------
# MAIN PROCESSES
# --------------------------------------------------------------------------------------

# ALIASES --------
# ↑ each element contains aliases in format :
#	[controller_name]=controller_name|alias_name...

__s_cpnt_akax__[$Ctlr__]="$Ctlr__" ;


for (( i=0 ; i<${#akax__[@]} ; i++ )) ;
do

	__s_cpnt_akax__[$Ctlr__]+="|${akax__[$i]}" ;

done ;


# LOADER --------
# ↑ each element contains in format :
# 	[controller_name]=script_path

__s_cpnt_ldr__[$Ctlr__]=$pf__ ;



# STATUS --------
# ↑ each element contains in format :
# 	[script_path]=(0|1)

[[ -z "${__s_cpnt_ldd__[$pf__]}" ]] \
&& __s_cpnt_ldd__[$pf__]=$fls \
;


# REPQUIREMENTS --------
# ↑ each element contains requirements in format :
# 	[controller_name]=(controller_name|alias_name)...

for (( i=0 ; i<${#rqrmtx[@]} ; i++ )) ;
do

	[[ $i == 0 ]] \
	&& __s_cpnt_rqrmtx__[$Ctlr__]="${rqrmtx[$i]}" \
	|| __s_cpnt_rqrmtx__[$Ctlr__]+=" ${rqrmtx[$i]}" \
	;

done ;



# --------------------------------------------------------------------------------------
# POST TASK : REPORT STATUS
# --------------------------------------------------------------------------------------

return $tru ;
