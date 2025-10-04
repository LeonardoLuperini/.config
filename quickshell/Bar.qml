import Quickshell
import Quickshell.Hyprland
import QtQuick
import "."

Scope {
    id: root
    property string time

    Variants {
        model: Quickshell.screens

        PanelWindow {
            id: panel
            required property var modelData
            property var screen: modelData.name
            color: "#1d2021"

            anchors {
                top: true
                left: true
                right: true
            }

            implicitHeight: 30

            Row {
                property var screen: panel.screen
                anchors.left: parent.left
                anchors.leftMargin: 5
                anchors.verticalCenter: parent.verticalCenter
                spacing: 5
                Repeater {
                    model: 6
                    property var screen: parent.screen
                    WorkspaceButton {
                        screen: parent.screen
                    }
                }
            }
            TextBar {
                text: panel.screen
                anchors.centerIn: parent
            }
            Clock {
                anchors.right: parent.right
                anchors.rightMargin: 5
                anchors.verticalCenter: parent.verticalCenter
            }
        }
    }
}
