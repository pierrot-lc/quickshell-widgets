import QtQuick
import Quickshell

QtObject {
    required property list<string> command
    required property string icon
    property var keybind: null

    function exec() {
        Quickshell.execDetached(this.command);
        Qt.quit();
    }
}
