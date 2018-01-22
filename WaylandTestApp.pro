QT += core gui qml

SOURCES += \
    main.cpp

OTHER_FILES = \
    qml/main.qml \
    qml/GridScreen.qml \
    qml/ShellScreen.qml \
    qml/ShellCh rome.qml \
    images/background.jpg \

RESOURCES += qml.qrc

target.path = $$[QT_INSTALL_EXAMPLES]/wayland/minimal-qml
sources.files = $$SOURCES $$HEADERS $$RESOURCES $$FORMS WaylandTestApp.pro
sources.path = $$[QT_INSTALL_EXAMPLES]/wayland/minimal-qml
INSTALLS += target sources
