import QtQuick
import Quickshell
import Quickshell.Wayland

PanelWindow {
    default property int frameThickness: Config.frameThickness

    implicitHeight: frameThickness
    implicitWidth: frameThickness
    WlrLayershell.layer: WlrLayer.Top

    color: "transparent"
    Rectangle {
        anchors.fill: parent
        color: Config.frameColor
        border.color: "white"
        radius: Config.frameRadius
    }
}
