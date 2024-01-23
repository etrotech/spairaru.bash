#!/usr/bin/env bash
# ######################################################################################
# PROMPT DEFINE
# ######################################################################################
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ALTERNATIVE CONSTANTS
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# prompt_intend
[[ -z $S_PPT_ITND ]] \
&& declare -r S_PPT_ITND="  " \
;



# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# TEMPLATE VARIABLES
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# prompt_templates
[[ -z $S_PPT_TPLX ]] \
&& declare -A S_PPT_TPLX=( \
	["DfltAcpt"]="s_ivkPptTpl_DfltAcpt" \
	["DefaultAccept"]="s_ivkPptTpl_DfltAcpt" \
	\
	["DfltFl"]="s_ivkPptTpl_DfltFl" \
	["DefaultFail"]="s_ivkPptTpl_DfltFl" \
	\
	["DfltSuc"]="s_ivkPptTpl_DfltSuc" \
	["DefaultSuccess"]="s_ivkPptTpl_DfltSuc" \
	\
	["DfltRej"]="s_ivkPptTpl_DfltRej" \
	["DefaultReject"]="s_ivkPptTpl_DfltRej" \
	\
	\
	["DfltCdgcnvs"]="s_ivkPptTpl_DfltCdgCnvs" \
	["DfltCodingCanvas"]="s_ivkPptTpl_DfltCdgCnvs" \
	\
	["DfltBlkTtl"]="s_ivkPptTpl_DfltBlkTtl" \
	["DefaultBlockTitle"]="s_ivkPptTpl_DfltBlkTtl" \
	\
	["DfltBlkCnt"]="s_ivkPptTpl_DfltBlkCnt" \
	["DefaultBlockContent"]="s_ivkPptTpl_DfltBlkCnt" \
	\
	["DfltBlkStrm"]="s_ivkPptTpl_DfltBlkStrm" \
	["DefaultBlockStream"]="s_ivkPptTpl_DfltBlkStream" \
	\
	["DfltSecTtl"]="s_ivkPptTpl_DfltSecTtl" \
	["DefaultSectionTitle"]="s_ivkPptTpl_DfltSecTtl" \
	\
	\
	["GnlIdvAtnx"]="s_ivkPptTpl_GnlIdvAtnx" \
	["GeneralEditingActions"]="s_ivkPptTpl_GnlIdvAtnx" \
	\
	["GnlAssoctvAtnx"]="s_ivkPptTpl_GnlAssoctvAtnx" \
	["GeneralRelatedActions"]="s_ivkPptTpl_GnlAssoctvAtnx" \
	\
	\
	["CblMpa"]="s_ivkPptTpl_CblMpa" \
	["CallableMissPositionedArgument"]="s_ivkPptTpl_CblMpa" \
	\
	["DocMnpAtnx"]="s_ivkPptTpl_DocMnpAtnx" \
	["DocumentManipulativeActions"]="s_ivkPptTpl_DocMnpAtnx" \
	\
	\
	["FsIoAtnx"]="s_ivkPptTpl_FsIoAtnx" \
	["FileSystemIoActions"]="s_ivkPptTpl_FsIoAtnx" \
	\
	["FsXfrlAtnx"]="s_ivkPptTpl_FsXfrlAtnx" \
	["FileSystemTransferalActions"]="s_ivkPptTpl_FsXfrlAtnx" \
	\
	\
	["SvcGnlAtnx"]="s_ivkPptTpl_SvcGnlAtnx" \
	["ServiceGeneralActions"]="s_ivkPptTpl_SvcGnlAtnx" \
) ;



# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# TEMPORARY VARIABLES
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# prompt_max_rows
[[ -z $S_PPT_MAX_ROWX ]] \
&& declare S_PPT_MAX_ROWX \
;

# prompt_max_columns
[[ -z $S_PPT_MAX_COLX ]] \
&& declare S_PPT_MAX_COLX\
;

