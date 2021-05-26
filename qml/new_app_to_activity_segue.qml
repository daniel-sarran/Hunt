import QtQuick 2.0
import QtQuick.Controls 2.15

Item {
    width: 1200
    height: 450
    clip: true

    Rectangle {
        id: rectangle
        color: "#ffffff"
        anchors.fill: parent

        Label {
            id: label
            x: 511
            width: 200
            height: 50
            color: "#000000"
            text: qsTr( "Do you have any activities to log for this application??" )
            anchors.top: parent.top
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.topMargin: 45
            font.bold: true
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 20
        }
    }

}
