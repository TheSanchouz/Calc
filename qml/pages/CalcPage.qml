import QtQuick 2.0
import Sailfish.Silica 1.0

import custom.CalcEngine 1.0
//import "C:/Users/Sanchouz/Calc/qml/pages/CalcButton.qml"

Page {
    id: page

    allowedOrientations: Orientation.All

    property var sizeElem: width / 4
    property var sizeFuncElem: sizeElem * 4 / 5
    property var sizeInElem: 64

    CalcEngine {
        id: calcEng

        onExprChanged: {
            calcEng.preEvaluate();
        }

        onValueChanged: {
            if (calcEng.value == "Divide by zero" || calcEng.value == "Wrong expr") {
                labelRes.color = "red";
            } else {
                labelRes.color = "#aaaaaa";
            }
        }
    }

    Rectangle {
        width: page.width
        height: page.height
        color: "white"
    }


    Column {
        width: page.width
        anchors.bottom: parent.bottom

        Column {
            Label {
                id: labelExpr
                width: page.width
                height: 150
                verticalAlignment: Label.AlignRight
                font.pixelSize: 78
                color: "black"
                text: calcEng.expr
            }

            Text {
                id: labelRes
                width: page.width
                height: 250
                verticalAlignment: Label.AlignRight
                font.pixelSize: 78
                color: "#aaaaaa"
                text: calcEng.value
            }
        }

        Row {
            Rectangle {
                width: 3 * sizeElem
                height: 4 * sizeElem
                color: "#fafafa"
                clip: true

                Grid {
                    rows: 4
                    columns: 3
                    anchors.fill: parent

                    CalcButton {
                        width: sizeElem
                        height: sizeElem
                        opText: "7"
                        opColor: "black"
                        calc: calcEng
                    }

                    CalcButton {
                        width: sizeElem
                        height: sizeElem
                        opText: "8"
                        opColor: "black"
                        calc: calcEng
                    }

                    CalcButton {
                        width: sizeElem
                        height: sizeElem
                        opText: "9"
                        opColor: "black"
                        calc: calcEng
                    }

                    CalcButton {
                        width: sizeElem
                        height: sizeElem
                        opText: "4"
                        opColor: "black"
                        calc: calcEng
                    }

                    CalcButton {
                        width: sizeElem
                        height: sizeElem
                        opText: "5"
                        opColor: "black"
                        calc: calcEng
                    }

                    CalcButton {
                        width: sizeElem
                        height: sizeElem
                        opText: "6"
                        opColor: "black"
                        calc: calcEng
                    }

                    CalcButton {
                        width: sizeElem
                        height: sizeElem
                        opText: "1"
                        opColor: "black"
                        calc: calcEng
                    }

                    CalcButton {
                        width: sizeElem
                        height: sizeElem
                        opText: "2"
                        opColor: "black"
                        calc: calcEng
                    }

                    CalcButton {
                        width: sizeElem
                        height: sizeElem
                        opText: "3"
                        opColor: "black"
                        calc: calcEng
                    }

                    CalcButton {
                        width: sizeElem
                        height: sizeElem
                        opText: ","
                        opColor: "black"
                        calc: calcEng
                    }

                    CalcButton {
                        width: sizeElem
                        height: sizeElem
                        opText: "0"
                        opColor: "black"
                        calc: calcEng
                    }

                    CalcButton {
                        width: sizeElem
                        height: sizeElem
                        opText: "DEL"
                        opTextFont: 40
                        opColor: "black"
                        calc: calcEng
                    }
                }
            }

            Rectangle {
                width: sizeElem
                height: 4 * sizeElem
                color: "#eeeeee"
                clip: true

                Grid {
                    rows: 5
                    columns: 1
                    anchors.fill: parent

                    CalcButton {
                        width: sizeElem
                        height: sizeFuncElem
                        opText: "÷"
                        opColor: "black"
                        //colorThenPressed: "#fafafa"
                        maxRadiusCircle: sizeFuncElem - 15
                        calc: calcEng
                    }

                    CalcButton {
                        width: sizeElem
                        height: sizeFuncElem
                        opText: "×"
                        opColor: "black"
                        //colorThenPressed: "#fafafa"
                        maxRadiusCircle: sizeFuncElem - 15
                        calc: calcEng
                    }

                    CalcButton {
                        width: sizeElem
                        height: sizeFuncElem
                        opText: "−"
                        opColor: "black"
                        //colorThenPressed: "#fafafa"
                        maxRadiusCircle: sizeFuncElem - 15
                        calc: calcEng
                    }

                    CalcButton {
                        width: sizeElem
                        height: sizeFuncElem
                        opText: "+"
                        opColor: "black"
                        //colorThenPressed: "#fafafa"
                        maxRadiusCircle: sizeFuncElem - 15
                        calc: calcEng
                    }


                    CalcButton {
                        width: sizeElem
                        height: sizeFuncElem
                        opText: "="
                        opColor: "white"
                        color: "#ffd046"
                        colorThenPressed: "grey"
                        maxRadiusCircle: sizeFuncElem - 15
                        calc: calcEng
                    }
                }
            }
        }
    }
}
