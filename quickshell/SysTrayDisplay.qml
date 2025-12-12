import Quickshell.Services.SystemTray
import Quickshell
import Quickshell.Widgets
import QtQuick
import "."

Row {
    Repeater {
        model: SystemTray.items
        IconImage {
            source: "qrc:///home/leo/telegram.png"
        }
    }
}
