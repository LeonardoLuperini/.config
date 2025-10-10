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
            property string currentBarScreen: modelData.name
            color: MyStyle.bg0_h

            anchors {
                top: true
                left: true
                right: true
            }

            implicitHeight: 30

            Workspaces {
                currentBarScreen: panel.currentBarScreen
                anchors.left: parent.left
                anchors.leftMargin: 5
                anchors.verticalCenter: parent.verticalCenter
                space: 5
            }

            NetworkDisplay {
                id: network
                anchors.right: audio.left
                anchors.rightMargin: 5
                anchors.verticalCenter: parent.verticalCenter
            }

            AudioDisplay {
                id: audio
                anchors.right: battery.left
                anchors.rightMargin: 5
                anchors.verticalCenter: parent.verticalCenter
            }

            BatteryDisplay {
                id: battery
                anchors.right: clock.left
                anchors.rightMargin: 5
                anchors.verticalCenter: parent.verticalCenter
            }

            Clock {
                id: clock
                anchors.right: parent.right
                anchors.rightMargin: 5
                anchors.verticalCenter: parent.verticalCenter
            }
        }
    }
}
