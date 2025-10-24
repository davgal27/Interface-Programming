import QtQuick 2.0

// Rectangle is one of basic graphical primitives 
// We can create almost everything from rectangles
Rectangle {
    id: btn;
    width: 100
    height: 100

    // The properties are accesible from outside.
    property bool toggled;
    property alias text: txt.text;
    property color btnColor: "#777777";

    // from outside, we use onClicked: { }
    signal clicked();


    // We are changing color according to value of "toggled" property 
    // i.e. when is active
    color: toggled ? Qt.darker(btnColor) : btnColor
    border.color: "#bbbbbb";
    border.width: 3;


    // Definition of area where mouse events are processed;
    MouseArea {
        id: mouse;
        anchors.fill: parent; // we are using anchors to define area
        onClicked: { // we are using the method of MouseArea
            btn.clicked(); // and calling the signal defined above
        }
    }

    // This element allows rendering of text
    Text {
        id: txt;
        anchors.fill: parent;

        color: toggled ? "#0066FF" : "black"
        font.pointSize: 22;
        font.bold: true;

        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter

    }

}
