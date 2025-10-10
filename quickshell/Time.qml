// with this line our type becomes a Singleton
pragma Singleton

import Quickshell

// your singletons should always have Singleton as the type
Singleton {
    id: root
    readonly property string time: Qt.formatDateTime(sysclock.date, "hh:mm")

    SystemClock {
        id: sysclock
        precision: SystemClock.Minutes
    }
}
