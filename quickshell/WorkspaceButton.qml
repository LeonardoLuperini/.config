import QtQuick
import QtQuick.Controls
import Quickshell.Hyprland
import "."

RoundButton {
    id: button

    required property string currentBarScreen
    required property var modelData
    property int id: modelData.id
    property string name: modelData.name
    property HyprlandMonitor monitor: modelData.monitor
    property bool focused: modelData.focused
    property var num_of_window: modelData.toplevels.values.length

    implicitWidth: 18
    implicitHeight: implicitWidth
    visible: currentBarScreen == monitor.name
    onClicked: modelData.activate()

    background: Rectangle {
        color: (parent.focused) ? MyStyle.fg : MyStyle.bg2
        radius: 10

        Rectangle {
            visible: button.num_of_window != 0
            implicitWidth: 6
            implicitHeight: implicitWidth
            radius: 6
            anchors.centerIn: parent
            color: (button.focused) ? MyStyle.bg1 : MyStyle.fg1
        }
    }
}
