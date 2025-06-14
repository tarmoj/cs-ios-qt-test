import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    id: app
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Rectangle {
        anchors.fill: parent
        gradient: Gradient {
            GradientStop {
                position: 0.00;
                color: "#7a6363";
            }
            GradientStop {
                position: 1.00;
                color: "#ffffff";
            }
        }

    }

    Button {
        id:playButton
        anchors.centerIn:  parent
        text: "Play"

        onClicked: {

            console.log("Cicked")
            csoundProxy.play()
        }

    }

    Slider {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: playButton.bottom
        anchors.topMargin: 10
        from: 100
        to:1000


        onValueChanged: csoundProxy.setChannel("slider", value)
    }


}
