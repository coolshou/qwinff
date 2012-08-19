#-------------------------------------------------
#
# Project created by QtCreator 2011-06-25T12:27:54
#
#-------------------------------------------------

QT       += core gui

TARGET = qwinff
TEMPLATE = app

SOURCES += main.cpp \
    ui/progressbar.cpp \
    ui/mainwindow.cpp \
    ui/convertlist.cpp \
    ui/conversionparameterdialog.cpp \
    ui/addtaskwizard.cpp \
    ui/aboutffmpegdialog.cpp \
    ui/optionsdialog.cpp \
    converter/presets.cpp \
    converter/mencoderinterface.cpp \
    converter/mediaprobe.cpp \
    converter/mediaconverter.cpp \
    converter/ffmpeginterface.cpp \
    converter/converterinterface.cpp \
    converter/conversionparameters.cpp \
    services/paths.cpp \
    services/extensions.cpp \
    services/filepathoperations.cpp \
    ui/aboutdialog.cpp \
    services/notification.cpp \
    services/notificationservice-qt.cpp \
    services/notificationservice-notifysend.cpp \
    services/powermanagement-dummy.cpp \
    ui/poweroffdialog.cpp \
    converter/audiofilter.cpp

HEADERS  += \
    ui/progressbar.h \
    ui/mainwindow.h \
    ui/convertlist.h \
    ui/conversionparameterdialog.h \
    ui/addtaskwizard.h \
    ui/aboutffmpegdialog.h \
    ui/optionsdialog.h \
    converter/presets.h \
    converter/mencoderinterface.h \
    converter/mediaprobe.h \
    converter/mediaconverter.h \
    converter/ffmpeginterface.h \
    converter/converterinterface.h \
    converter/conversionparameters.h \
    services/paths.h \
    services/extensions.h \
    services/filepathoperations.h \
    ui/aboutdialog.h \
    version.h \
    services/notification.h \
    services/notificationservice.h \
    services/notificationservice-qt.h \
    services/notificationservice-notifysend.h \
    services/powermanagement.h \
    ui/poweroffdialog.h \
    converter/audiofilter.h

FORMS    += \
    ui/conversionparameterdialog.ui \
    ui/addtaskwizard.ui \
    ui/mainwindow.ui \
    ui/aboutffmpegdialog.ui \
    ui/optionsdialog.ui \
    ui/aboutdialog.ui \
    ui/poweroffdialog.ui

RESOURCES += \
    images.qrc

TRANSLATIONS += \
    translations/qwinff_zh_TW.ts \
    translations/qwinff_ja_JP.ts \
    translations/qwinff_it_IT.ts

unix {
    # If DATA_PATH is set, QWinFF searches data in DATA_PATH
    # Otherwise, it uses the executable path as data path.
    DEFINES += DATA_PATH=$(DATA_PATH)
    libnotify {
        # Linux desktop notification
        HEADERS += \
            services/notificationservice-libnotify.h
        SOURCES += \
            services/notificationservice-libnotify.cpp
        # pkgconfig
        CONFIG += link_pkgconfig
        PKGCONFIG = libnotify
        DEFINES += USE_LIBNOTIFY
    }
    # Shutdown
    QT += dbus
    SOURCES -= services/powermanagement-dummy.cpp
    SOURCES += services/powermanagement-linux.cpp
}

win32 {
    # If FFMPEG_IN_DATA_PATH is set, QWinFF searches for FFmpeg executables
    # in <datapath>/ffmpeg/ instead of PATH.
    DEFINES += FFMPEG_IN_DATA_PATH
    # Application Icon
    RC_FILE = appicon.rc
    # Shutdown
    LIBS += -lpowrprof
    SOURCES -= services/powermanagement-dummy.cpp
    SOURCES += services/powermanagement-w32.cpp
}

# This string is shown in the about box.
DEFINES += VERSION_ID_STRING=$(VERSION_ID_STRING)

# External Short Blocking Operation Timeout
DEFINES += OPERATION_TIMEOUT=30000
DEFINES += DEFAULT_THREAD_COUNT=1

OTHER_FILES += \
    settings.txt





