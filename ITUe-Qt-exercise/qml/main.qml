import QtQuick 2.1
import QtQuick.Window 2.0
import "../js/Theme.js" as Theme
import cz.vutbr.fit 1.0

Window {
    visible: true
    width: 400
    height: 315

    title: "ITUe - Qt exercise"

    // Definition of data model.
    // hint: 'op' is shortcut for operation
    //       'tog' is shortcut for toggled / which of them is selected 
    ListModel {
        id: operations;
        ListElement { op: "+"; tog: false; }
        ListElement { op: "-"; tog: true; }
        ListElement { op: "*"; tog: false; }
        ListElement { op: "/"; tog: false; }
        // TODO
        // Add operation of multiplication and division (1pt)
    }

    // The column element helps us with placement of elements.
    // See http://en.wikipedia.org/wiki/Layout_%28computing%29
    // https://qmlbook.github.io/ch04-qmlstart/qmlstart.html#positioning-elements
    Column {

        // Input value - First operand of calculation
        Rectangle {
            height: 35;
            width: 400;
            border.color: "#bbb";
            border.width: 3;
            anchors.margins: 2
            color: "#777"

            TextInput {
                anchors.fill: parent;
                anchors.margins: 2
                horizontalAlignment: TextInput.AlignLeft
                verticalAlignment: TextInput.AlignVCenter
                id: textA
                font.pointSize: 22
                text: "0"
            }
        }

        // Similar to column, but horizontal
        Row {

            // Similar to ListView (but more generic) or function foreach()
            // it have _model_ and _delegate_
            Repeater {
                // what data should be displayed
                model: operations;

                // how looks one element
                // @disable-check M301
                delegate: MyButton {
                    btnColor: Theme.btn_colour

                    text: model.op
                    toggled: model.tog;

                    onClicked: {
                        for (var i = 0; i < operations.count; i++) {
                            operations.setProperty( i, "tog", (i == index) );
                        }
                    }
                }
            }

        }

        // "Our" new class. Its definiton is in MySlider.qml
        // @disable-check M301
        MySlider {
            id: slider
            color: Qt.darker(Theme.slider_color)
            rectColor: Theme.slider_color

        }

        // TODO 
        // Insert new element with gray background which will show
        // verticaly centered text 'LUT: value: ' and value of 
        // currently chosen item from LUT
        Rectangle {
            height: 45;
            width: 400;
            border.color: "#bbb";
            border.width: 3;
            anchors.margins: 2
            color: "#777"

            Row {
                anchors.verticalCenter: parent
                anchors.left: parent.left
                anchors.leftMargin: 10
                spacing: 10


                Text {
                    text: "LUT value:"
                    font.pointSize: 22
                    color: "black"
                }

                Text {
                    id: lutvaluetext
                    font.pointSize: 22
                    text: lut.getValue(slider.value)
                }
            }
        }


        // Our own button, Its definition is in MyClickButton.qml
        //@disable-check M301
        MyClickButton {
            width: 400;
            //btnColor: Theme.btn_colour commented out
            
            text: qsTr( "Compute" )
            
            function getOperation() {
                for (var i = 0; i < operations.count; i++) {
                    var item = operations.get(i);
                    if (item.tog) {
                        return item.op;
                    }
                }
                return "+";
            }

            // mouse clicked event handler
            onClicked: {
                    var a = parseFloat(textA.text);
                    if (isNaN(a)){
                        result.text = "Err: input is NAN"
                        result.color = "red";
                        return;
                    } else {
                        result.color = "black";
                    }

                    var b = lut.getValue(slider.value);
                    var res = 0;
                    var op = "";
                    for (var i = 0; i < operations.count; i++) {
                        if (operations.get(i).tog) op = operations.get(i).op;
                    }
                    switch(op){
                    case "+": res = a + b; break;
                    case "-": res = a - b; break;
                    case "*": res = a * b; break;
                    case "/": if (b != 0) {
                            res = a / b;
                        } else {
                            res = "Err: Div by 0!";
                            result.color = "red";
                        }
                        break;
                    }

                result.text = res
                console.log( a + " "+ op + " " + b + "=" + res)

                // TODO
                // Compute result
            }
        }

        // The result will be displayed in this element
        Rectangle {
            height: 45;
            width: 400;
            border.color: "#bbb";
            border.width: 3;
            anchors.margins: 2
            color: "#777"

            Text {
                id:  result;
                anchors.centerIn: parent
                height: 35;
                font.pointSize: 22
                color: "black"
                text: ""
                }

        }

    }

    // The object LUT is defined in C++
    // We are creating its instance here
    // we can call its function using its id
    LUT {
        id: lut
    }

}


