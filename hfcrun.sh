#!/bin/sh
export MONO_PATH=/usr/local/lib/hfc
mono /usr/local/lib/hfc/HyperFastCgi.exe /config=/etc/hfc/hfc.config /appconfigdir=/etc/hfc/apps.d &
exec nginx $*
