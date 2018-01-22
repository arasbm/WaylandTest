import QtQuick 2.0
import QtQuick.Window 2.2
import QtWayland.Compositor 1.0

WaylandOutput {
    id: output
    property alias gridSurfaces: listModel

    sizeFollowsWindow: true
    window: Window {
        width: 1024
        height: 760
        visible: true

        Image {
            id: background
            anchors.fill: parent
            fillMode: Image.Tile
            source: "qrc:/background.jpg"
            smooth: true
            GridView {
                id: gridView
                anchors.fill: parent
                model: ListModel {
                    id: listModel
                }
                interactive: false
                cellWidth: 200
                cellHeight: 200
                delegate: WaylandQuickItem {
                    id: item
                    surface: gridSurface
                    width: gridView.cellWidth
                    height: gridView.cellHeight
                    sizeFollowsSurface: false
                    inputEventsEnabled: false
                    allowDiscardFrontBuffer: true
                    MouseArea {
                        anchors.fill: parent
                        onClicked: item.surface.activated()
                    }
                }
            }
        }
    }
}
