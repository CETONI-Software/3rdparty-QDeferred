OUT_ROOT = $${OUT_PWD}/..
CONFIG += c++14
CONFIG += debug_and_release
TARGET = $$qtLibraryTarget(qdeferred)
DEFINES += QT_DEPRECATED_WARNINGS
TEMPLATE = lib
DESTDIR = $${OUT_ROOT}/lib
QT += core

windows {
	# MinGW
	*-g++* {
		QMAKE_CXXFLAGS += -Wall -Wextra -pedantic
	}
	# MSVC
	*-msvc* {
                QMAKE_CXXFLAGS += /utf-8
        }
}

#RESOURCES += ads.qrc

HEADERS += \
	qeventer.h \
	qlambdathreadworker.h \
	qlambdathreadworkerdata.h \
	qdeferred.hpp \
	qdeferreddata.hpp \
	qdynamicevents.hpp \
	qdynamiceventsdata.hpp


SOURCES += \
	qdeferreddata.cpp \
	qdynamiceventsdata.cpp \
	qeventer.cpp \
	qlambdathreadworker.cpp \
	qlambdathreadworkerdata.cpp


isEmpty(PREFIX){
	PREFIX=../installed
	warning("Install Prefix not set")
}

headers.path=$$PREFIX/include
headers.files=$$HEADERS
target.path=$$PREFIX/lib
INSTALLS += headers target

DISTFILES +=
