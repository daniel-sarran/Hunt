import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3


Item {
    id: item1
    width: 1200
    height: 450

    Rectangle {
        id: rectangle
        width: 800
        height: 450
        color: "#ffffff"
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        clip: true

        GridLayout {
            anchors.fill: parent
            anchors.margins: 5
            columns: 8

            // RECENT APPLICATIONS header
            Label {
                id: recent_applications
                Layout.row: 0
                Layout.columnSpan: 8
                text: qsTr( "R E C E N T   A P P L I C A T I O N S" )
                color: "gray"
                font.pixelSize: 11
                verticalAlignment: Text.AlignBottom
                Layout.fillWidth: true
            }

            // Column Headers
            Label {
                id: applied_date
                Layout.row: 1
                Layout.column: 0
                height: 30
                text: qsTr( "Applied Date" )
                font.bold: true
                font.pixelSize: 14
            }
            Label {
                id: company
                Layout.row: 1
                Layout.column: 2
                height: 30
                text: qsTr( "Company" )
                font.bold: true
                font.pixelSize: 14
            }
            Label {
                id: position
                Layout.row: 1
                Layout.column: 4
                height: 30
                text: qsTr( "Position" )
                font.bold: true
                font.pixelSize: 14
            }
            Label {
                id: stage
                Layout.row: 1
                Layout.column: 6
                height: 30
                text: qsTr( "Stage" )
                font.bold: true
                font.pixelSize: 14
            }

            // Dashes
            Rectangle {
                width: 20
                height: 1
                color: "lightgray"
                Layout.row: 3
                Layout.column: 0

            }
            Rectangle {
                width: 20
                height: 1
                color: "lightgray"
                Layout.row: 3
                Layout.column: 2
            }
            Rectangle {
                width: 20
                height: 1
                color: "lightgray"
                Layout.row: 3
                Layout.column: 4
            }
            Rectangle {
                width: 20
                height: 1
                color: "lightgray"
                Layout.row: 3
                Layout.column: 6
            }

            // Application Labels row 0
            Label {
                objectName: "app_00"
                id: app_00
                Layout.row: 4
                Layout.column: 0
                text: qsTr( "Hello" )
                font.pixelSize: 14
                verticalAlignment: Text.AlignTop
                font.family: "Courier"
                color: "gray"
                Component.onCompleted: {
                    app_00.text = backend.get_app_field(0, 0);
                }
            }
            Label {
                id: app_01
                Layout.row: 4
                Layout.column: 2
                text: qsTr( "app_01" )
                font.pixelSize: 14
                color: "gray"
                Component.onCompleted: {
                    app_01.text = backend.get_app_field(0, 1);
                }
            }
            Label {
                id: app_02
                Layout.row: 4
                Layout.column: 4
                text: qsTr( "app_02" )
                font.pixelSize: 14
                color: "gray"
                Component.onCompleted: {
                    app_02.text = backend.get_app_field(0, 2);
                }
            }
            Label {
                id: app_03
                Layout.row: 4
                Layout.column: 6
                text: qsTr( "app_03" )
                font.pixelSize: 14
                color: "gray"
                Component.onCompleted: {
                    app_03.text = backend.get_app_field(0, 3);
                }
            }
            // Application Labels row 1
            Label {
                id: app_10
                Layout.row: 5
                Layout.column: 0
                text: qsTr( "app_10" )
                font.pixelSize: 14
                color: "gray"
                Component.onCompleted: {
                    app_10.text = backend.get_app_field(1, 0);
                }
            }
            Label {
                id: app_11
                Layout.row: 5
                Layout.column: 2
                text: qsTr( "app_11" )
                font.pixelSize: 14
                color: "gray"
                Component.onCompleted: {
                    app_11.text = backend.get_app_field(1, 1);
                }
            }
            Label {
                id: app_12
                Layout.row: 5
                Layout.column: 4
                text: qsTr( "app_12" )
                font.pixelSize: 14
                color: "gray"
                Component.onCompleted: {
                    app_12.text = backend.get_app_field(1, 2);
                }
            }
            Label {
                id: app_13
                Layout.row: 5
                Layout.column: 6
                text: qsTr( "app_13" )
                font.pixelSize: 14
                color: "gray"
                Component.onCompleted: {
                    app_13.text = backend.get_app_field(1, 3);
                }
            }

            // Application Labels row 2
            Label {
                width: 150
                id: app_20
                Layout.row: 6
                Layout.column: 0
                text: qsTr( "app_20" )
                font.pixelSize: 14
                color: "gray"
                Component.onCompleted: {
                    app_20.text = backend.get_app_field(2, 0);
                }
            }
            Label {
                id: app_21
                Layout.row: 6
                Layout.column: 2
                text: qsTr( "app_21" )
                font.pixelSize: 14
                color: "gray"
                Component.onCompleted: {
                    app_21.text = backend.get_app_field(2, 1);
                }
            }
            Label {
                id: app_22
                Layout.row: 6
                Layout.column: 4
                text: qsTr( "app_22" )
                font.pixelSize: 14
                color: "gray"
                Component.onCompleted: {
                    app_22.text = backend.get_app_field(2, 2);
                }

            }
            Label {
                id: app_23
                Layout.row: 6
                Layout.column: 6
                text: qsTr( "app_23" )
                font.pixelSize: 14
                color: "gray"
                Component.onCompleted: {
                    app_23.text = backend.get_app_field(2, 3);
                }
            }

            // UPCOMING ACTIVITIES header
            Label {
                id: upcoming_activities
                Layout.columnSpan: 8
                verticalAlignment: Text.AlignBottom
                Layout.fillWidth: true
                text: qsTr( "U P C O M I N G   A C T I V I T I E S" )
                color: "gray"
                font.pixelSize: 11
            }
            // Column Headers
            Label {
                id: date
                Layout.row: 8
                Layout.column: 0
                text: qsTr( "Date" )
                font.bold: true
                font.pixelSize: 14
            }
            Label {
                id: type
                Layout.row: 8
                Layout.column: 2
                text: qsTr( "Interaction" )
                font.bold: true
                font.pixelSize: 14
            }
            Label {
                id: notes
                Layout.row: 8
                Layout.column: 4
                text: qsTr( "Notes" )
                font.bold: true
                font.pixelSize: 14
            }

            // Dashes
            Rectangle {
                width: 20
                height: 1
                color: "lightgray"
                Layout.row: 9
                Layout.column: 0

            }
            Rectangle {
                width: 20
                height: 1
                color: "lightgray"
                Layout.row: 9
                Layout.column: 2
            }
            Rectangle {
                width: 20
                height: 1
                color: "lightgray"
                Layout.row: 9
                Layout.column: 4
            }

            // Activities Labels row 0
            Label {
                id: act_00
                Layout.row: 10
                Layout.column: 0
                text: qsTr( "act_00" )
                font.pixelSize: 14
                color: "gray"
                Component.onCompleted: {
                    act_00.text = backend.get_act_field(0, 0);
                }
            }
            Label {
                id: act_01
                Layout.row: 10
                Layout.column: 2
                text: qsTr( "act_01" )
                font.pixelSize: 14
                color: "gray"
                Component.onCompleted: {
                    act_01.text = backend.get_act_field(0, 1);
                }
            }
            Label {
                id: act_02
                Layout.row: 10
                Layout.column: 4
                text: qsTr( "act_02" )
                font.pixelSize: 14
                color: "gray"
                Component.onCompleted: {
                    act_02.text = backend.get_act_field(0, 2);
                }
            }

            // Activities Labels row 1
            Label {
                id: act_10
                Layout.row: 11
                Layout.column: 0
                text: qsTr( "act_10" )
                font.pixelSize: 14
                color: "gray"
                Component.onCompleted: {
                    act_10.text = backend.get_act_field(1, 0);
                }
            }
            Label {
                id: act_11
                Layout.row: 11
                Layout.column: 2
                text: qsTr( "act_11" )
                font.pixelSize: 14
                color: "gray"
                Component.onCompleted: {
                    act_11.text = backend.get_act_field(1, 1);
                }
            }
            Label {
                id: act_12
                Layout.row: 11
                Layout.column: 4
                text: qsTr( "act_12" )
                font.pixelSize: 14
                color: "gray"
                Component.onCompleted: {
                    act_12.text = backend.get_act_field(1, 2);
                }
            }

            // Activities Labels row 2
            Label {
                id: act_20
                Layout.row: 12
                Layout.column: 0
                Layout.preferredHeight: 10
                text: qsTr( "act_20" )
                font.pixelSize: 14
                color: "gray"
                Component.onCompleted: {
                    act_20.text = backend.get_act_field(2, 0);
                }
            }
            Label {
                id: act_21
                Layout.row: 12
                Layout.column: 2
                Layout.preferredHeight: 10
                text: qsTr( "act_21" )
                font.pixelSize: 14
                color: "gray"
                Component.onCompleted: {
                    act_21.text = backend.get_act_field(2, 1);
                }
            }
            Label {
                id: act_22
                Layout.row: 12
                Layout.column: 4
                Layout.preferredHeight: 10
                text: qsTr( "act_22" )
                font.pixelSize: 14
                color: "gray"
                Component.onCompleted: {
                    act_22.text = backend.get_act_field(2, 2);
                }
            }



//            Label {
//                id: label
////                width: 200
//                height: 50
//                color: "#000000"
//                text: qsTr( "Dashboard" )
////                anchors.top: parent.top
////                anchors.topMargin: 45
////                font.bold: true
////                anchors.horizontalCenter: parent.horizontalCenter
//                font.pointSize: 20
////                horizontalAlignment: Text.AlignHCenter
////                verticalAlignment: Text.AlignVCenter

//            }

//            TextInput {
//                id: textInput
////                width: 200
//                height: 50
//                text: qsTr( "Button" )
////                anchors.top: parent.top
////                anchors.topMargin: 150
////                anchors.horizontalCenter: parent.horizontalCenter
//                font.pixelSize: 12
//                selectByMouse: true
//                cursorVisible: true
////                horizontalAlignment: Text.AlignHCenter
////                verticalAlignment: Text.AlignVCenter
//            }
//            Button {
//                id: button

////                x: 511
////                width: 200
//                height: 50
//                text: qsTr( "Button" )
////                anchors.top: parent.top
////                anchors.topMargin: 90
//                font.bold: true
////                anchors.horizontalCenter: parent.horizontalCenter
//                font.pixelSize: 20
//                onClicked: {
//                    label.text = backend.welcome_text(textInput.text)
//                }
//            }
        }
    }
}
