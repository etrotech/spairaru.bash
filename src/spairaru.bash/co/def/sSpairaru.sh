#!/usr/bin/env bash
# ######################################################################################
# SPAIRARU DEFINE
# ######################################################################################

. "${BASH_SOURCE[0]%/*}/sEtroTech.sh" ;


# --------------------------------------------------------------------------------------
# BASIC
# --------------------------------------------------------------------------------------

# spairau_name
[[ -z "$S_NM" ]] \
&& declare -r S_NM="s.bash" \
;

# spairau_title
[[ -z "$S_TTL" ]] \
&& declare -r S_TTL="spairaru.bash" \
;

# spairau_command_line_interface 
[[ -z "$S_S_CLI" ]] \
&& declare -r S_S_CLI="s" \
;

[[ -z "$S_L_CLI" ]] \
&& declare -r S_L_CLI="spairaru" \
;

# spairau_remark
[[ -z "$S_RMRK" ]] \
&& declare -r S_RMRK="below lanes are managed by ${S_TTL}." \
;

# spairau_version
[[ -z "$S_VER" ]] \
&& declare -r S_VER="0.5.0" \
;



# --------------------------------------------------------------------------------------
# LOCATIONAL
# --------------------------------------------------------------------------------------
# 	📦
# 	└─ 🖿 opt
# 	   └─ 🖿 EtroTech spairaru.bash 👈
# 	      └─ 🖺 spairaru.sh

[[ -z "$S_APP_FLDR" ]] \
&& declare -r S_APP_FLDR="` realpath  "${BASH_SOURCE[0]%/*/*/*}" `" \
;


# 	📦
# 	└─ 🖿 opt
# 	   └─ 🖿 EtroTech spairaru.bash
# 	      └─ 🖺 spairaru.sh 👈

[[ -z "$S_APP_EXC_FL" ]] \
&& declare -r S_APP_EXC_FL="${S_APP_FLDR}/spairaru.sh" \
;

# 	🛠️
# 	├─ 🖿 etc
# 	│  └─ 🖿 EtroTech spairaru.bash 👈
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
# 	      ├─ 🖺 *.env
# 	      ├─ 🖺 s.cnf
# 	      └─ 🖺 *.ini

[[ -z "$S_D_CNF_FLDR" ]] \
&& declare -r S_D_CNF_FLDR="/etc/${ET_TTL} ${S_TTL}" \
;

# 	🛠️
# 	├─ 🖿 etc
# 	│  └─ 🖿 EtroTech spairaru.bash
# 	│     ├─ 🖺 *.env
# 	│     ├─ 🖺 s.cnf 👈
# 	│     └─ 🖺 *.ini
# 	├─ 🖿 $HOME
# 	│  └─ 🖿 .s.bash
# 	│     ├─ 🖺 *.env
# 	│     ├─ 🖺 s.cnf
# 	?     └─ 🖺 *.ini
# 	└─ 🖿 $PWD
# 	   └─ 🖿 .s.bash
# 	      ├─ 🖺 *.env
# 	      ├─ 🖺 s.cnf
# 	      └─ 🖺 *.ini

[[ -z "$S_D_CNF_FL" ]] \
&& declare -r S_D_CNF_FL="${S_D_CNF_FLDR}/${S_S_CLI}.cnf" \
;

# 	🛠️
# 	├─ 🖿 etc
# 	│  └─ 🖿 EtroTech spairaru.bash
# 	│     ├─ 🖺 *.env
# 	│     ├─ 🖺 s.cnf
# 	│     └─ 🖺 *.ini
# 	├─ 🖿 $HOME
# 	│  └─ 🖿 .s.bash 👈
# 	│     ├─ 🖺 *.env
# 	│     ├─ 🖺 s.cnf
# 	?     └─ 🖺 *.ini
# 	└─ 🖿 $PWD
# 	   └─ 🖿 .s.bash
# 	      ├─ 🖺 *.env
# 	      ├─ 🖺 s.cnf
# 	      └─ 🖺 *.ini

[[ -z "$S_G_CNF_FLDR" ]] \
&& declare -r S_G_CNF_FLDR="${RL_HM}/.${S_NM}" \
;

# 	🛠️
# 	├─ 🖿 etc
# 	│  └─ 🖿 EtroTech spairaru.bash
# 	│     ├─ 🖺 *.env
# 	│     ├─ 🖺 s.cnf
# 	│     └─ 🖺 *.ini
# 	├─ 🖿 $HOME
# 	│  └─ 🖿 .s.bash
# 	│     ├─ 🖺 *.env
# 	│     ├─ 🖺 s.cnf 👈
# 	?     └─ 🖺 *.ini
# 	└─ 🖿 $PWD
# 	   └─ 🖿 .s.bash
# 	      ├─ 🖺 *.env
# 	      ├─ 🖺 s.cnf
# 	      └─ 🖺 *.ini

[[ -z "$S_G_CNF_FL" ]] \
&& declare -r S_G_CNF_FL="${S_G_CNF_FLDR}/${S_S_CLI}.cnf" \
;

# 	📄
# 	└─ 🖿 var
# 	   └─ 🖿 log
# 	      └─ 🖿 EtroTech spairaru.bash 👈

[[ -z "$S_LOG_FLDR" ]] \
&& declare -r S_LOG_FLDR="/var/log/${ET_TTL} ${S_TTL}" \
;

# 	🗑️
# 	└─ 🖿 tmp
# 	   └─ 🖿 EtroTech spairaru.bash 👈

[[ -z "$S_TMP_FLDR" ]] \
&& declare -r S_TMP_FLDR="/tmp/${ET_TTL} ${S_TTL}" \
;
