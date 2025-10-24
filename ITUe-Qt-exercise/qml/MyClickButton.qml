import QtQuick 2.0

Rectangle {
    id: btn;
    width: 100
    height: 100

    property alias text: txt.text;

    property color btnColor: "#0066FF"
    property color textColor: mouse.pressed ? "red" : "black"

    signal clicked();

    border.color: "#bbbbbb";
    border.width: 3;

    // TODO
    // The button should change color when clicked

    // Mouse events are handled separately; 
    // This class should help you with mouse;
    // You can use onClicked inside of the element, 
    // but you can refer also to its properties e.g. mouse.pressed (see above)
    MouseArea {
        id: mouse;
        anchors.fill: parent;
        onClicked: {
            btn.clicked();
        }
    }
    color: mouse.pressed ? "#777777" : btnColor;

    // here lives the text renderer
    Text {
        id: txt;
        anchors.fill: parent;
        //Centering
        horizontalAlignment: Text.AlignHCenter;
        verticalAlignment: Text.AlignVCenter;
        //Size
        font.pointSize: 22;
        font.bold: true;
        color: btn.textColor;

        // TODO
        // The text should be in the center of the element
        // and have appropriate formatting (font size and color)
    }

}
