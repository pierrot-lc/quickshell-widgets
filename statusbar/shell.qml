import Quickshell
import QtQuick

Variants {
    model: Quickshell.screens

    PanelWindow {
        required property ShellScreen modelData

        screen: modelData
        implicitHeight: 30
        anchors {
            top: true
            left: true
            right: true
        }
        color: "transparent"

        Rectangle {
            anchors.fill: parent
            radius: 30
            color: "#1D2021"

            Text {
                text: Time.time
                color: "white"
                font.pixelSize: 15
                anchors.centerIn: parent
            }
            Text {
                text: Time.power
                color: "white"
                font.pixelSize: 15
                anchors.fill: parent
                leftPadding: 10
                verticalAlignment: Text.AlignVCenter
            }
        }
    }
}
