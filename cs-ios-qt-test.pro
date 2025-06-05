QT += quick multimedia
QTPLUGIN += qtaudio_coreaudio

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

# voibolla siiski parem teha ise audio valjund, uuri: https://wiki.qt.io/QtMultimedia_on_iOS_and_tvOS

RESOURCES += qml.qrc


macos {
    INCLUDEPATH += /Library/Frameworks/CsoundLib64.framework/Headers
    LIBS += -F/Library/Frameworks/ -framework CsoundLib64

}

# add test.csd by hand in XCode to Reosurces (Add files, set copy, targets) or add BUNDLE_DATA somehowß

ios {


    csdfiles.files = test.csd
    QMAKE_BUNDLE_DATA += csdfiles



    SOURCES += \
        csoundproxy.mm \
        main.cpp \
        csound-iOS/classes/CsoundObj.m

    HEADERS += \
        csound-iOS/classes/CsoundObj.h \
        csoundproxy.h


    INCLUDEPATH += $$PWD/csound-iOS/headers
    INCLUDEPATH += $$PWD/csound-iOS/classes
    INCLUDEPATH += $$PWD/csound-iOS/classes/midi
    LIBS += $$PWD/csound-iOS/libs/libcsound.a
    LIBS += $$PWD/csound-iOS/libs/libsndfile.a
    LIBS += -framework Accelerate
    LIBS += -framework AVFAudio
    LIBS += -framework CoreMidi
    LIBS += -framework CoreMotion

}

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    csound-iOS/classes/bindings/motion/CsoundAccelerometerBinding.h \
    csound-iOS/classes/bindings/motion/CsoundAttitudeBinding.h \
    csound-iOS/classes/bindings/motion/CsoundGyroscopeBinding.h \
    csound-iOS/classes/bindings/motion/CsoundMotion.h \
    csound-iOS/classes/bindings/ui/CsoundButtonBinding.h \
    csound-iOS/classes/bindings/ui/CsoundLabelBinding.h \
    csound-iOS/classes/bindings/ui/CsoundMomentaryButtonBinding.h \
    csound-iOS/classes/bindings/ui/CsoundSliderBinding.h \
    csound-iOS/classes/bindings/ui/CsoundSwitchBinding.h \
    csound-iOS/classes/bindings/ui/CsoundUI.h \
    csound-iOS/classes/midi/CsoundMIDI.h \
    csound-iOS/classes/midi/MidiWidgetWrapper.h \
    csound-iOS/classes/midi/MidiWidgetsManager.h \
    csound-iOS/classes/midi/SliderMidiWidgetWrapper.h

SOURCES += \
    csound-iOS/classes/bindings/motion/CsoundAccelerometerBinding.m \
    csound-iOS/classes/bindings/motion/CsoundAttitudeBinding.m \
    csound-iOS/classes/bindings/motion/CsoundGyroscopeBinding.m \
    csound-iOS/classes/bindings/motion/CsoundMotion.m \
    csound-iOS/classes/bindings/ui/CsoundButtonBinding.m \
    csound-iOS/classes/bindings/ui/CsoundLabelBinding.m \
    csound-iOS/classes/bindings/ui/CsoundMomentaryButtonBinding.m \
    csound-iOS/classes/bindings/ui/CsoundSliderBinding.m \
    csound-iOS/classes/bindings/ui/CsoundSwitchBinding.m \
    csound-iOS/classes/bindings/ui/CsoundUI.m \
    csound-iOS/classes/midi/CsoundMIDI.m \
    csound-iOS/classes/midi/MidiWidgetsManager.m \
    csound-iOS/classes/midi/SliderMidiWidgetWrapper.m

DISTFILES += \
    test.csd



