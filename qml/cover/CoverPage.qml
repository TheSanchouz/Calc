import QtQuick 2.0
import Sailfish.Silica 1.0

CoverBackground {
    Rectangle {
        anchors.fill: parent
        color: "#ffd046"
    }

    Rectangle {
        anchors.centerIn: parent
        color: "transparent"

        Label {
            id: label
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("Calculator")
        }

        Label {
            anchors.top: label.bottom
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            text: "+ − × ÷"
            font.pixelSize: 64
        }
    }
}
