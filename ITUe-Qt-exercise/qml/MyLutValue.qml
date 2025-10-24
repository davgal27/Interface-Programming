import QtQuick 2.1

Rectangle {
    id: lutRect
    width: 400
    height: 40
    color: "#ccc"
    border.color: "#bbb"

    property alias text: txt.text

    Text {
        id: txt
        anchors.centerIn: parent
        font.pointSize: 20
        text: "LUT: 0"
    }
}
