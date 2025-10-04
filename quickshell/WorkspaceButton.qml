import QtQuick

Rectangle {
    id: rect
    required property int index
    required property string screen
    property int name: index + 1
    implicitHeight: 20
    implicitWidth: 20
    color: "#ebdbb2"
    visible: (screen == "DP-1" && name < 4) || (screen == "HDMI-A-1" && name > 3)
    Text {
        anchors.centerIn: parent
        text: parent.index
    }
}
