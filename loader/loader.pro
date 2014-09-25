#
# This file is part of the xTuple ERP: PostBooks Edition, a free and
# open source Enterprise Resource Planning software suite,
# Copyright (c) 1999-2012 by OpenMFG LLC, d/b/a xTuple.
# It is licensed to you under the Common Public Attribution License
# version 1.0, the full text of which (including xTuple-specific Exhibits)
# is available at www.xtuple.com/CPAL.  By using this software, you agree
# to be bound by its terms.
#

include( ../global.pri )

TEMPLATE = app
CONFIG += qt warn_on
DEPENDPATH  += ../$${XTUPLE_BLD}/common

TARGET = updater
OBJECTS_DIR = tmp
MOC_DIR     = tmp
UI_DIR      = tmp

LIBS += -L../$${OPENRPT_BLD}/lib -L../$${XTUPLE_BLD}/lib -lxtuplecommon -L../lib -lupdatercommon -lMetaSQL -lopenrptcommon -lrenderer
macx: LIBS += -lz

win32-msvc* {
  PRE_TARGETDEPS += ../lib/updatercommon.lib          \
                    ../$${XTUPLE_BLD}/lib/xtuplecommon.lib \
                    ../$${OPENRPT_BLD}/lib/MetaSQL.lib \
                    ../$${OPENRPT_BLD}/lib/openrptcommon.lib \
                    ../$${OPENRPT_BLD}/lib/renderer.lib
} else {
  PRE_TARGETDEPS += ../lib/libupdatercommon.a          \
                    ../$${XTUPLE_BLD}/lib/libxtuplecommon.a \
                    ../$${OPENRPT_BLD}/lib/libMetaSQL.a \
                    ../$${OPENRPT_BLD}/lib/libopenrptcommon.a \
                    ../$${OPENRPT_BLD}/lib/librenderer.a
}

DESTDIR = ../bin

RC_FILE = rcloader.rc
macx {
  RC_FILE = ../images/updater.icns
  QMAKE_INFO_PLIST = Info.plist
}

FORMS   += loaderwindow.ui
HEADERS += loaderwindow.h
SOURCES += loaderwindow.cpp \
           main.cpp

QT += xml sql

RESOURCES += loader.qrc
