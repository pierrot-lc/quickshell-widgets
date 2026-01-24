pragma Singleton
import QtQuick

QtObject {
    readonly property color backgroundColor: "#e60c0c0c"
    readonly property color buttonColor: "#1e1e1e"
    readonly property color buttonHoverColor: "#3700b3"
    readonly property color iconColor: "#f0f0f0"

    readonly property int buttonSize: 150
    readonly property int iconSize: 80
    readonly property int spacing: 20
    readonly property real buttonRadius: 50

    readonly property list<LogoutEntry> buttons: [
        LogoutEntry {
            icon: "./logout.svg"
            command: ["shutdown", "now"]
            keybind: "S"
        },
        LogoutEntry {
            icon: "./reboot.svg"
            command: ["reboot"]
            keybind: "R"
        },
        LogoutEntry {
            icon: "./lock.svg"
            command: ["hyprlock"]
            keybind: "L"
        }
    ]
}
