// https://quickshell.org/docs/v0.2.1/guide/introduction/
// https://git.outfoxxed.me/quickshell/quickshell-examples/src/branch/master/wlogout/WLogout.qml
// https://lucide.dev/
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland

Variants {
    id: root

    model: Quickshell.screens

    PanelWindow {
        color: "transparent"

        required property ShellScreen modelData
        screen: modelData

        exclusionMode: ExclusionMode.Ignore
        WlrLayershell.layer: WlrLayer.Overlay
        WlrLayershell.keyboardFocus: WlrKeyboardFocus.Exclusive

        // Keybindings
        Shortcut {
            sequence: "Esc"
            onActivated: Qt.quit()
        }
        Repeater {
            model: Config.buttons
            Item {
                required property LogoutEntry modelData
                Shortcut {
                    sequence: modelData.keybind
                    onActivated: modelData.exec()
                }
            }
        }


        anchors {
            top: true
            left: true
            bottom: true
            right: true
        }

        Rectangle {
            color: Config.backgroundColor
            anchors.fill: parent

            RowLayout {
                spacing: Config.spacing
                anchors.centerIn: parent

                Repeater {
                    model: Config.buttons
                    delegate: LogoutButton {}
                }
            }
        }
    }
}
