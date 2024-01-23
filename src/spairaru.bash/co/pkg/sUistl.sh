#!/usr/bin/env bash
# ######################################################################################
# PACKAGE COMMON
# ######################################################################################

. "${BASH_SOURCE[0]%/*}/sCom.sh" ;




# ######################################################################################
# PACKAGE UNINSTALL
# ######################################################################################
# --------------------------------------------------------------------------------------
# MAIN PROCESSES : UNINSTALL FILES
# --------------------------------------------------------------------------------------

# 	📦
# 	└─ 🖿 opt
# 	   └─ 🖿 EtroTech spairaru.bash
# 	      └─ 🖺 spairaru.sh
# 	🛠️
# 	├─ 🖿 etc
# 	│  └─ 🖿 EtroTech spairaru.bash
# 	│     └─ 🖺 s.cnf
# 	├─ 🖿 $HOME
# 	│  └─ 🖿 .s.bash
# 	?     └─ 🖺 s.cnf
# 	└─ 🖿 $PWD
# 	   └─ 🖿 .s.bash
# 	      └─ 🖺 s.cnf
# 	👟
# 	└─ 🖿 var
# 	   └─ 🖿 log  👈
# 	      └─ 🖺 spairaru.bash
# 	🗑️
# 	└─ 🖿 tmp
# 	   └─ 🖿 EtroTech spairaru.bash

rm \
	-fr \
	"${S_LOG_FLDR}" \
;


[[ $env_vbo == $tru ]] \
&& s_ivkPptTpl_DfltAcpt \
	"%s%s is removed." \
	"${ANSI_F_BL}`__ "Log"`${_ANSI} " \
	"folder" \
&& s_ivkPptTpl_DfltBlkCnt \
	"${ANSI_F_LG}🖿${_ANSI}${ANSI_F_CN}%s${_ANSI}" \
	"${S_LOG_FLDR/$PWD\//\./}" \
;


# 	📦
# 	└─ 🖿 opt
# 	   └─ 🖿 EtroTech spairaru.bash
# 	      └─ 🖺 spairaru.sh
# 	🛠️
# 	├─ 🖿 etc
# 	│  └─  👈
# 	│     └─ 🖺 s.cnf
# 	├─ 🖿 $HOME
# 	│  └─ 🖿 .s.bash
# 	?     └─ 🖺 s.cnf
# 	└─ 🖿 $PWD
# 	   └─ 🖿 .s.bash
# 	      └─ 🖺 s.cnf
# 	👟
# 	└─ 🖿 var
# 	   └─ 🖿 log
# 	      └─ 🖿 EtroTech spairaru.bash
# 	🗑️
# 	└─ 🖿 tmp
# 	   └─ 🖿 EtroTech spairaru.bash

rm \
	-fr \
	"${S_D_CNF_FLDR}" \
;


[[ $env_vbo == $tru ]] \
&& s_ivkPptTpl_DfltAcpt \
	"%s%s is removed." \
	"${ANSI_F_PR}`__ "global"`${_ANSI} ${ANSI_F_BL}`__ "Configuration"`${_ANSI} " \
	"folder" \
&& s_ivkPptTpl_DfltBlkCnt \
	"${ANSI_F_LG}🖿${_ANSI}${ANSI_F_CN}%s${_ANSI}" \
	"${S_D_CNF_FLDR/$PWD\//\./}" \
;


# 	📦
# 	└─ 🖿 opt
# 	   └─ 🖿 EtroTech spairaru.bash
# 	      └─ 🖺 spairaru.sh
# 	🛠️
# 	├─ 🖿 etc
# 	│  └─ 🖿 EtroTech spairaru.bash
# 	│     └─ 🖺 s.cnf
# 	├─ 🖿 $HOME 
# 	│  └─ 🖿 .s.bash 👈
# 	?     └─ 🖺 s.cnf
# 	└─ 🖿 $PWD
# 	   └─ 🖿 .s.bash
# 	      └─ 🖺 s.cnf
# 	👟
# 	└─ 🖿 var
# 	   └─ 🖿 log
# 	      └─ 🖿 EtroTech spairaru.bash
# 	🗑️
# 	└─ 🖿 tmp
# 	   └─ 🖿 EtroTech spairaru.bash

rm \
	-fr \
	"${S_G_CNF_FLDR}" \
;


[[ $env_vbo == $tru ]] \
&& s_ivkPptTpl_DfltAcpt \
	"%s%s is removed." \
	"${ANSI_F_PR}`__ "local"`${_ANSI} ${ANSI_F_BL}`__ "Configuration"`${_ANSI} " \
	"folder" \
&& s_ivkPptTpl_DfltBlkCnt \
	"${ANSI_F_LG}🖿${_ANSI}${ANSI_F_CN}%s${_ANSI}" \
	"${S_G_CNF_FLDR/$PWD\//\./}" \
;


# 	📦
# 	└─ 🖿 opt
# 	   └─ 🖿 EtroTech spairaru.bash 👈
# 	      └─ 🖺 spairaru.sh
# 	🛠️
# 	├─ 🖿 etc
# 	│  └─ 🖿 EtroTech spairaru.bash
# 	│     └─ 🖺 s.cnf
# 	├─ 🖿 $HOME 
# 	│  └─ 🖿 .s.bash
# 	?     └─ 🖺 s.cnf
# 	└─ 🖿 $PWD
# 	   └─ 🖿 .s.bash
# 	      └─ 🖺 s.cnf
# 	👟
# 	└─ 🖿 var
# 	   └─ 🖿 log
# 	      └─ 🖿 EtroTech spairaru.bash
# 	🗑️
# 	└─ 🖿 tmp
# 	   └─ 🖿 EtroTech spairaru.bash

rm \
	-fr \
	"${S_APP_FLDR}" \
;


[[ $env_vbo == $tru ]] \
&& s_ivkPptTpl_DfltAcpt \
	"%s%s is removed." \
	"${ANSI_F_BL}`__ "Applicaiton"`${_ANSI} " \
	"folder" \
&& s_ivkPptTpl_DfltBlkCnt \
	"${ANSI_F_LG}🖿${_ANSI}${ANSI_F_CN}%s${_ANSI}" \
	"${S_APP_FLDR/$PWD\//\./}" \
;



# --------------------------------------------------------------------------------------
# POST TASK : REPORT STATUS
# --------------------------------------------------------------------------------------
rmTmpFldr() { 


	# 	📦
	# 	└─ 🖿 opt
	# 	   └─ 🖿 EtroTech spairaru.bash
	# 	      └─ 🖺 spairaru.sh
	# 	🛠️
	# 	├─ 🖿 etc
	# 	│  └─ 🖿 EtroTech spairaru.bash
	# 	│     └─ 🖺 s.cnf
	# 	├─ 🖿 $HOME
	# 	│  └─ 🖿 .s.bash
	# 	?     └─ 🖺 s.cnf
	# 	└─ 🖿 $PWD
	# 	   └─ 🖿 .s.bash
	# 	      └─ 🖺 s.cnf
	# 	👟
	# 	└─ 🖿 var
	# 	   └─ 🖿 log
	# 	      └─ 🖿 EtroTech spairaru.bash
	# 	🗑️
	# 	└─ 🖿 tmp
	# 	   └─ 🖿 EtroTech spairaru.bash 👈

	rm \
		-fr \
		"${S_TMP_FLDR}" \
	;


} ;


trap \
	"rmTmpFldr" \
	EXIT \
;



# --------------------------------------------------------------------------------------
# POST TASK : OUTPUT MESSAGE
# --------------------------------------------------------------------------------------

[[ $env_vbo == $tru ]] \
&& s_ivkPptTpl_DfltSuc \
	"%s%s is uninstalled." \
	"${ET_TTL} " \
	"${S_TTL}" \
;



# --------------------------------------------------------------------------------------
# POST TASK : REPORT STATUS
# --------------------------------------------------------------------------------------

return $tru ;
