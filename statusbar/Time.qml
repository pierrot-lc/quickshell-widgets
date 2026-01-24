pragma Singleton

import Quickshell
import Quickshell.Services.UPower
import QtQuick

Singleton {
    readonly property string time: Qt.formatDateTime(clock.date, "ddd d / hh:mm")
    readonly property string power: (UPower.displayDevice.percentage * 100).toString() + "%"

    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }
}
