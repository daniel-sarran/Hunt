import QtQuick 2.0
import QtQuick.Layouts 1.11
import QtQuick.Controls 2.15


Item {
    width: 1150
    height: 100

    Rectangle {
        id: nav_bar
        width: 1150
        color: "#00000000"
        anchors.fill: parent

        CustomBorder {
            id: borderLine
            anchors.fill: parent
            anchors.topMargin: 0
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            color: "white"

            lBorderwidth: 0
            rBorderwidth: 0
            tBorderwidth: 2
            bBorderwidth: 0
            borderColor: "lightgray"
        }
        Button {
            id: backButton
            width: 200
            height: 50
            anchors {
                left: parent.left
                verticalCenter: parent.verticalCenter
            }
            text: "DASHBOARD"
            action: shortcut_back
        }
        Action {
            id: shortcut_back
            text: "&D"
            shortcut: "d"
            onTriggered: {
                stackView.pop(null)
                stackView_nav.pop(null)
            }
        }
        Button {
            id: submitButton
            width: 200
            height: 50
            anchors {
                left: backButton.right
                verticalCenter: parent.verticalCenter
                margins: 20
            }
            text: "NEW APPLICATION"
            action: shortcut_go
        }
        Action {
            id: shortcut_go
            shortcut: "Right"
            onTriggered: {
                stackView.push( "new_application.qml" )
                stackView_nav.push( "new_application_nav.qml" )
            }
        }
    }
}


