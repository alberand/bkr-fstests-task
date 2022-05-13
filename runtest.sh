#!/bin/bash
# vim: dict+=/usr/share/beakerlib/dictionary.vim cpt=.,w,b,u,t,i,k
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
#   runtest.sh of /distribution/xfstests-task/.
#   Description: Install xfstests
#   Author: Andrey Albershteyn <aalbersh@redhat.com>
#
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
#   Copyright (c) 2022 Red Hat, Inc.
#
#   This program is free software: you can redistribute it and/or
#   modify it under the terms of the GNU General Public License as
#   published by the Free Software Foundation, either version 2 of
#   the License, or (at your option) any later version.
#
#   This program is distributed in the hope that it will be
#   useful, but WITHOUT ANY WARRANTY; without even the implied
#   warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
#   PURPOSE.  See the GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program. If not, see http://www.gnu.org/licenses/.
#
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Include Beaker environment
. /usr/bin/rhts-environment.sh || exit 1
. /usr/share/beakerlib/beakerlib.sh || exit 1

PACKAGE="xfstests-task"

rlJournalStart
    rlPhaseStartTest
        rlRun "git clone git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git" 0 "Fetch xfstests git repository"
        rlRun "cd ~/xfstests-dev" 0 "Change directory to xfstests-dev"
        rlRun "make" 0 "Build xfstests utils"
        rlRun "make install" 0 "Install xfstests utils"
        rlRun "useradd -m fsgqa" 0 "Add user fsgqa"
        rlRun "useradd fsgqa2" 0 "Add user fsgqa2"
        rlRun "useradd 123456-fsgqa" 0 "Add user 123456-fsgqa"
        rlRun "wget -O local.config https://gist.githubusercontent.com/alberand/85fa4d7e0929902ef5d303ae1de5cc8a/raw/a0da0e27a53daf9acc28f53a6d3669b33eff1ddb/xfstests-config" 0 "Create config"
    rlPhaseEnd
rlJournalPrintText
rlJournalEnd
