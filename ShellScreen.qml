import QtQuick 2.0
import QtQuick.Window 2.2
import QtWayland.Compositor 1.0

WaylandOutput {
    id: output
    property alias surfaceArea: background

    sizeFollowsWindow: true
    window: Window {
        width: 1024
        height: 760
        visible: true

        WaylandMouseTracker {
            id: mouseTracker
            anchors.fill: parent

            windowSystemCursorEnabled: true
            Image {
                id: background
                anchors.fill: parent
                fillMode: Image.Tile
                source: "qrc:/background.jpg"
                smooth: true
            }
            WaylandCursorItem {
                id: cursor
                inputEventsEnabled: false
                x: mouseTracker.mouseX
                y: mouseTracker.mouseY

                seat : output.compositor.defaultSeat
            }
        }
    }
}
