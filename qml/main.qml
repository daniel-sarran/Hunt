import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.12


Window {
    id: mainwindow
    width: 1350
    height: 800
    visible: true
    color: "#00000000"
    title: qsTr("HUNT")

    Rectangle {
        id: bg
        color: "#034844"
        border.color: "#175c58"
        border.width: 1
        anchors.fill: parent
        anchors.rightMargin: 1
        anchors.leftMargin: 1
        anchors.bottomMargin: 1
        anchors.topMargin: 1

        Rectangle {
            id: app_container
            x: 377
            width: 1200
            height: 650
            border.width: 0
            anchors.top: parent.top
            anchors.topMargin: 75
            anchors.horizontalCenter: parent.horizontalCenter

            CustomBorder
            {
                id: nav_top
                height: 100
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 25
                anchors.leftMargin: 25
                anchors.topMargin: 0

                lBorderwidth: 0
                rBorderwidth: 0
                tBorderwidth: 0
                bBorderwidth: 2
                borderColor: "lightgray"

                Image {
                    id: name
                    width: 40
                    height: 40
                    anchors.verticalCenter: label.verticalCenter
                    source: "../images/aim.svg"
                }

                Label {
                    id: label
                    width: 200
                    text: qsTr("HUNT")
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 30
                    anchors.topMargin: 0
                    anchors.bottomMargin: 0
                    anchors.leftMargin: 60
                }
            }
            Rectangle {
                id: content
                color: "#ffffff"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: nav_top.bottom
                anchors.bottom: nav_bottom.top
                clip: true
                anchors.bottomMargin: 0
                anchors.topMargin: 0

                StackView {
                    id: stackView
                    anchors.fill: parent
                    initialItem: "dashboard.qml"                
                }

            }
            Rectangle {
                id: nav_bottom
                height: 100
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                clip: true
                anchors.bottomMargin: 0
                anchors.rightMargin: 0
                anchors.leftMargin: 0

                StackView {
                    id: stackView_nav
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 25
                    anchors.leftMargin: 25
                    anchors.bottomMargin: 0
                    anchors.topMargin: 0
                    initialItem: "dashboard_nav.qml"
                }
            }
        }
    }
}



/*##^##
Designer {
    D{i:0;formeditorZoom:0.75}
}
##^##*/
