#!/bin/bash

_CONFIG=/opt/retronas/config/retronas.cfg
source $_CONFIG
source ${LIBDIR}/common.sh
cd ${DIDIR}
CHOICE=""

rn_advanced() {
  
  local MENU_ARRAY=(
    01 "Back"
    02 "webui - experimental retronas webui (cockpit)"
    03 "piforce (docker) - (rpi4) >15m install, >2GB space req."
  )

  local MENU_BLURB="\nWARNING these tools are very EXPERIMENTAL and could break your system or destroy your data! Do not use these unless you are comfortable with losing everthing"

  DLG_MENU "EXPERIMENTAL Menu" $MENU_ARRAY 10 "${MENU_BLURB}"

}

DROP_ROOT
CLEAR
while true
do
  rn_advanced
  case ${CHOICE} in
  01)
    exit 0
    ;;
  02)
    # experimental webui
    CLEAR
    RN_INSTALL_DEPS
    RN_INSTALL_EXECUTE install_cockpit-retronas.yml
    PAUSE
    ;;
  03)
    # experimental webui
    CLEAR
    RN_INSTALL_DEPS
    RN_INSTALL_EXECUTE install_docker.yml
    RN_INSTALL_EXECUTE install_piforce.yml
    PAUSE
    ;;
  *)
    exit 1
    ;;
  esac
done
