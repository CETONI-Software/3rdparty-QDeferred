OUT_ROOT = $${OUT_PWD}/..
CONFIG += debug_and_release
TARGET = $$qtLibraryTarget(qdeferred)

DEFINES += QT_DEPRECATED_WARNINGS \
    QDEFERRED_BUILD_LIB

TEMPLATE = lib
DESTDIR = $${OUT_ROOT}/lib
QT += core

lessThan(QT_MAJOR_VERSION, 6) {
    CONFIG += c++14
}

windows {
	# MinGW
	*-g++* {
		QMAKE_CXXFLAGS += -Wall -Wextra -pedantic
	}
	# MSVC
	*-msvc* {
                QMAKE_CXXFLAGS += /utf-8
				CONFIG += c++20
        }
}

#RESOURCES += ads.qrc

HEADERS += \
	qdeferred_export.h \
	qeventer.h \
	qlambdathreadworker.h \
	qlambdathreadworkerdata.h \
	qdeferred.hpp \
	qdeferreddata.hpp \
	qdynamicevents.hpp \
	qdynamiceventsdata.hpp \
	qdeferred_export.h


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

INSTALL_HEADERS += \
	$$HEADERS \
	QDeferred \
	QDynamicEvents \
	QEventer \
	QLambdaThreadWorker \

headers.path=$$PREFIX/include/QDeferred
headers.files=$$INSTALL_HEADERS
target.path=$$PREFIX/lib
INSTALLS += headers target

DISTFILES +=
