import Quickshell.Hyprland
import QtQuick

Row {
    required property string currentBarScreen
    property int space: 4
    spacing: space
    Repeater {
        model: Hyprland.workspaces
        property string currentBarScreen: parent.currentBarScreen
        WorkspaceButton {
            currentBarScreen: parent.currentBarScreen
        }
    }
}
