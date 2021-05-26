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
            id: nextButton
            width: 200
            height: 50
            anchors {
                left: parent.left
                verticalCenter: parent.verticalCenter
            }
            focus: true
            text: "NEW"
            autoRepeat: false
            display: AbstractButton.TextBesideIcon
            action: shortcut_next
        }
        Action {
            id: shortcut_next
            text: "&N"
            shortcut: "n"
            onTriggered: {
                stackView_nav.push( "dashboard_new_nav.qml" )
            }
        }
        Button {
            id: menu_button_2
            width: 200
            height: 50
            anchors {
                left: nextButton.right
                verticalCenter: parent.verticalCenter
                margins: 20
            }
            text: "ADVANCE"
            action: shortcut_go
        }
        Action {
            id: shortcut_go
            text: "&A"
            shortcut: "a"
            onTriggered: {
                stackView_nav.push( "dashboard_new_nav.qml" )
            }
        }

    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.5}
}
##^##*/
