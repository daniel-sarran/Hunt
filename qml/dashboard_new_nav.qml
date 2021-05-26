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

            CustomBorder
            {
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
            width: 50
            height: 50
            anchors {
                left: parent.left
                verticalCenter: parent.verticalCenter
            }
            text: "<"
            action: shortcut_back
        }
        Action {
            id: shortcut_back
            text: "&<"
            shortcut: "Left"
            onTriggered: {
                stackView_nav.pop()
            }
        }
        Button {
            id: new_company
            width: 200
            height: 50
            anchors {
                left: backButton.right
                verticalCenter: parent.verticalCenter
                margins: 20
            }
            text: "NEW COMPANY"
            action: shortcut_company
        }
        Action {
            id: shortcut_company
            text: "&COMPANY"
            shortcut: "c"
            onTriggered: {
                stackView.push( "new_company.qml" )
                stackView_nav.push( "new_company_nav.qml" )
            }
        }
        Button {
            id: new_application
            width: 200
            height: 50
            anchors {
                left: new_company.right
                verticalCenter: parent.verticalCenter
                margins: 20
            }
            text: "NEW APPLICATION"
            action: shortcut_application
        }
        Action {
            id: shortcut_application
            text: "&APPLICATION"
            shortcut: "a"
            onTriggered: {
                stackView_nav.pop()
            }
        }
        Button {
            id: new_activity
            width: 200
            height: 50
            anchors {
                left: new_application.right
                verticalCenter: parent.verticalCenter
                margins: 20
            }
            text: "NEW ACTIVITY"
            action: shortcut_activity
        }
        Action {
            id: shortcut_activity
            text: "&ACTIVITY"
            shortcut: "v"
            onTriggered: {
                stackView_nav.pop()
            }
        }
    }
}


