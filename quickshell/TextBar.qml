import QtQuick

Text {
    // Expose font properties with defaults
    property bool bold: true
    property int pointSize: 12
    property string family: "Arial"
    property color col: "#ebdbb2"

    // Bind the actual font
    font.bold: bold
    font.pointSize: pointSize
    font.family: family
    color: col
}
