#! /bin/bash
if [ -f "rkhunter" ]; 
	then
		mkdir db log scripts tmp
		mv *.dat db
		mv i18n db
		mv signatures db
		mv *.{pl,sh} scripts
		echo "INSTALLDIR=./
DBDIR=./db
SCRIPTDIR=./scripts
TMPDIR=./tmp
USER_FILEPROP_FILES_DIRS=./rkhunter.conf" >> rkhunter.conf
#		sed 's/^DFLT_LOGFILE.*/DFLT_LOGFILE=\".\/log\/rkhunter.log\"/' rkhunter > tmpfile1
#		sed 's/^RKHLOGFILE.*/RKHLOGFILE=\".\/log\/rkhunter.log\"/' tmpfile1 > tmpfile2
		patch -p0 < rkhunter.patch
		rm -f rkhunter.patch
		rm -f $#
	else
		echo "Please put the $# into the rkhunter dirctorys!\n"

fi
