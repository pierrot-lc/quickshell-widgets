import QtQuick
import Quickshell

Variants {
    model: Quickshell.screens

    Item {
        required property ShellScreen modelData
        property int barsize: 30

        PanelWindow {
            id: barTop
            anchors {
                top: true
                left: true
                right: true
            }

            color: "transparent"
            implicitWidth: barsize
            implicitHeight: barsize
        }

        PanelWindow {
            id: barLeft
            anchors {
                top: true
                bottom: true
                left: true
            }

            color: "transparent"
            implicitWidth: barsize
            implicitHeight: barsize
        }

        PanelWindow {
            id: shaderWindow
            anchors {
                top: true
                bottom: true
                left: true
                right: true
            }

            exclusionMode: ExclusionMode.Ignore
            color: "transparent"
            mask: Region {
                item: Rectangle {
                    anchors.centerIn: parent
                    anchors.fill: parent
                }
            }
            ShaderEffect {
                width: shaderWindow.width
                height: shaderWindow.height

                property vector2d rect1Pos: Qt.vector2d(barLeft.width / (2 * modelData.width), 0.5)
                property vector2d rect1Size: Qt.vector2d(barLeft.width / (2 * modelData.width), 0.5)
                property color color1: "red"

                property vector2d rect2Pos: Qt.vector2d(0.5, barTop.height / (2 * modelData.height))
                property vector2d rect2Size: Qt.vector2d(0.5, barTop.height / (2 * modelData.height))
                property color color2: "blue"

                property real smoothness: 0.02
                property real softness: 0.0002
                fragmentShader: "shader.frag.qsb"
            }
        }

        // FloatingWindow {
        //     screen: modelData
        //
        //     width: 300
        //     height: 300
        //
        //     Rectangle {
        //         width: 300
        //         height: 300
        //         color: "#1e1e1e"
        //     }
        //
        //     ShaderEffect {
        //         width: 300
        //         height: 300
        //
        //         property vector2d rect1Pos: Qt.vector2d(0.4, 0.3)
        //         property vector2d rect1Size: Qt.vector2d(0.1, 0.1)
        //         property color color1: "red"
        //
        //         property vector2d rect2Pos: Qt.vector2d(0.48, 0.5)
        //         property vector2d rect2Size: Qt.vector2d(0.1, 0.2)
        //         property color color2: "blue"
        //
        //         property real smoothness: 0.05
        //         property real softness: 0.002
        //         fragmentShader: "shader.frag.qsb"
        //     }
        // }
    }
}
