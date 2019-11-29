import QtQuick 2.0
import Sailfish.Silica 1.0

Rectangle {
    id: rect

    property var calc
    property var maxRadiusCircle: Math.sqrt(rect.width * rect.width + rect.height * rect.height)
    property alias opColor: op.color
    property alias colorThenPressed: circle.color
    property alias opTextFont: op.font.pixelSize
    property alias opText: op.text

    color: "transparent"

    Component.onCompleted: {
//        console.log("x=", x, " y=", y);
    }

    Rectangle {
        id: circle
        anchors.centerIn: parent
        property var circleSize: Math.min(rect.width, rect.height)

        width: circleSize / 2
        height: circleSize / 2
        radius: circleSize / 2
        color: "#d5d5d5"
        opacity: 0.25
        visible: false
    }

    Text {
        id: op

        anchors.centerIn: parent
        font.pixelSize: ((rect.width + rect.height) / 2) / 3
        color: "black"
    }

    MouseArea {
        id: mouseArea

        anchors.fill: parent

        onPressed: {
            circle.x = rect.x + rect.width / 2;
            circle.y = rect.y + rect.height / 2;

//            console.log("Rect x=", rect.x, " y=", rect.y);
//            console.log("Circle x=", circle.x, " y=", circle.y);
        }

        onExited: {
            if (opText == "=") {
                calc.evaluate();
            }
            if (opText == "DEL") {
                calc.expr = calc.expr.slice(0, -1);
            }
            if (opText != "=" && opText != "DEL") {
                calc.expr = calc.expr + opText;
            }
            //console.log(calc.expr);


            circle.width = circle.circleSize / 2
            circle.height = circle.circleSize / 2
            circle.radius = circle.circleSize / 2
            circle.opacity = 0.25
            circle.visible = false

        }

        onPressAndHold: {
            if (opText == "DEL") {
                calc.expr = "";
            }
        }
    }

    states: [
        State {
            name: "pressed"
            when: mouseArea.pressed
            PropertyChanges {
                target: circle
                width: maxRadiusCircle
                height: maxRadiusCircle
                radius: maxRadiusCircle
                opacity: 0.5
                visible: true
            }
        }
    ]

    transitions: [
        Transition {
            to: "pressed"
            NumberAnimation {
                properties: "width, height, radius, opacity"
                duration: 25
            }
        },

        Transition {
            from: "pressed"
            NumberAnimation {
                properties: "opacity"
                duration: 1000
            }
        }
    ]
}
