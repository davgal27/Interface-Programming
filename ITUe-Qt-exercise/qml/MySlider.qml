import QtQuick 2.0

// We are using rectangle to create slider
Rectangle {
    id: container
    width: 400
    height: 35
    color: "#aaaaaa"
    property alias rectColor: rect.color // alias is used to make property of "rect" accessible from outside.

    property double minValue: 0
    property double maxValue: 200
    property int value: rect.x / (container.width-rect.width) * (maxValue-minValue) + minValue // formula to compute its position;

    Rectangle {
        id: rect
        width: 50; height: container.height
        color: "red"

        Text {
            anchors.centerIn: parent;
            text: container.value

        }

        MouseArea {
            anchors.fill: parent
            drag.target: rect
            drag.axis: Drag.XAxis
            drag.minimumX: 0
            drag.maximumX: container.width - rect.width
        }
    }
}
