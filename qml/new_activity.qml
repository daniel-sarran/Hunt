import QtQuick 2.0
import QtQuick.Controls 2.15

Item {
    width: 1200
    height: 450

    Rectangle {
        id: rectangle
        color: "#ffffff"
        border.width: 0
        anchors.fill: parent
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        clip: true

        Rectangle {
            id: pageTitle
            x: 511
            width: 400
            height: 100
            border.color: "#00000000"
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.horizontalCenter: parent.horizontalCenter


            Rectangle {
                id: stage1
                anchors {
                    left: parent.left
                    top: parent.top
                    bottom: parent.bottom
                }
                width: 20
                height: 35
                color: "#c4e8be"
                border.width: 1
                anchors.topMargin: 20
                anchors.bottomMargin: 60
                anchors.leftMargin: 100
                radius: width*0.5
                border.color: "#7f808080"
            }

            Rectangle {
                id: stage2
                width: 20
                height: 35
                color: "#ffffff"
                radius: width*0.5
                border.width: 1
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.rightMargin: 100
                anchors.bottomMargin: 60
                anchors.topMargin: 20
                border.color: "lightgray"

            }

            CustomBorder
            {
                id: borderLine
                height: 70
                color: "white"
                anchors.left: stage1.right
                anchors.right: stage2.left
                anchors.bottom: parent.bottom
                anchors.rightMargin: 0
                anchors.leftMargin: 0

                lBorderwidth: 0
                rBorderwidth: 0
                tBorderwidth: 1
                bBorderwidth: 0
                borderColor: "lightgray"
            }

            Label {
                id: addActivityLabel
                x: 94
                text: qsTr("Add Activity")
                anchors.top: stage1.bottom
                anchors.topMargin: 5
                anchors.horizontalCenter: stage1.horizontalCenter
                font.bold: true
            }

            Label {
                id: reviewSubmit
                x: 195
                color: "#666766"
                text: qsTr("Review & Submit")
                anchors.top: stage2.bottom
                font.bold: false
                anchors.horizontalCenter: stage2.horizontalCenter
                anchors.topMargin: 5
            }

            Rectangle {
                id: innerCircle
                width: 20
                height: 35
                color: "#c4e8be"
                radius: width*0.5
                border.color: "#d8d8d8"
                border.width: 1
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 60
                anchors.leftMargin: 100
                anchors.topMargin: 20
            }
            Image {
                id: check
                width: 20
                height: 20
                source: "../images/check.svg"
                anchors {
                    left: parent.left
                    top: parent.top
                    bottom: parent.bottom
                }
                anchors.topMargin: 20
                anchors.bottomMargin: 60
                anchors.leftMargin: 100
            }
        }
        Rectangle {
            id: workspace
            x: 234
            width: 630
            height: 280
            color: "#ffffff"
            anchors.top: pageTitle.bottom
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 0

            Rectangle {
                id: nameRect
                width: 300
                height: 45
                color: "#ffffff"
                border.color: "#d3d3d3"
                border.width: 1
                anchors.left: parent.left
                radius: 5
                anchors.top: nameDesc.bottom
                anchors.leftMargin: 0
                anchors.topMargin: 5


                TextInput {
                    id: nameTextInput
                    x: 484
                    y: 128
                    width: 270
                    height: 20
                    color: "#808080"
                    text: qsTr("Zillow")
                    font.pixelSize: 14
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    font.italic: false
                    font.family: "Arial"
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    cursorVisible: false
                    selectByMouse: true
                }
            }
            Label {
                id: nameDesc
                height: 15
                color: "#26282a"
                text: qsTr("Application Date *")
                anchors.left: parent.left
                anchors.top: parent.top
                font.italic: true
                anchors.leftMargin: 0
                anchors.topMargin: 0
                font.family: "Verdana"
                font.pointSize: 9
            }

            Rectangle {
                id: industryRect
                width: 300
                height: 45
                radius: 5
                border.color: "#d3d3d3"
                border.width: 1
                anchors.left: parent.left
                anchors.top: industryDesc.bottom
                anchors.leftMargin: 0
                anchors.topMargin: 5

                TextInput {
                    id: industryTextInput
                    x: 484
                    y: 128
                    width: 270
                    height: 20
                    color: "#808080"
                    text: qsTr("Applied")
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 14
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    font.italic: false
                    selectByMouse: true
                    anchors.horizontalCenter: parent.horizontalCenter
                    cursorVisible: false
                    font.family: "Arial"
                }
            }

            Label {
                id: industryDesc
                height: 15
                color: "#26282a"
                text: qsTr("Application Stage *")
                anchors.left: nameRect.left
                anchors.top: nameDesc.bottom
                font.italic: true
                anchors.leftMargin: 0
                anchors.topMargin: 70
                font.pointSize: 9
                font.family: "Verdana"
            }

            Rectangle {
                id: descriptionRect
                x: 470
                y: 121
                width: 300
                height: 221
                radius: 5
                border.color: "#d3d3d3"
                border.width: 1
                anchors.right: parent.right
                anchors.top: descriptionDesc.bottom
                anchors.rightMargin: 0
                anchors.topMargin: 5
                TextArea {
                    id: descriptionTextArea
                    x: 484
                    width: 270
                    color: "#808080"
                    text: "Glassdoor: $7k/mo\n\nReferral: Diana\n\nExperience in at least one multifaceted server-side language: PHP, Python, Perl, Java, Ruby, Scala, or similar\n\nAbility to work in a fast-paced, ever evolving environment"
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    font.pixelSize: 14
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignTop
                    wrapMode: Text.WordWrap
                    anchors.bottomMargin: 15
                    anchors.topMargin: 15
                    topPadding: 0
                    leftPadding: 0
                    selectByMouse: true
                    font.italic: false
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.family: "Arial"
                    cursorVisible: false
                }
            }

            Label {
                id: descriptionDesc
                height: 15
                color: "#26282a"
                text: qsTr("Job Description")
                anchors.left: descriptionRect.left
                anchors.top: industryDesc.bottom
                anchors.leftMargin: 0
                font.italic: true
                anchors.topMargin: -100
                font.pointSize: 9
                font.family: "Verdana"
            }

            Label {
                id: jobTitleDesc
                x: 264
                y: 270
                height: 15
                color: "#26282a"
                text: qsTr("Job Title *")
                anchors.left: nameRect.left
                anchors.top: industryDesc.bottom
                anchors.topMargin: 70
                font.pointSize: 9
                anchors.leftMargin: 0
                font.family: "Verdana"
                font.italic: true
            }

            Rectangle {
                id: jobTitleRect
                width: 300
                height: 45
                radius: 5
                border.color: "#d3d3d3"
                border.width: 1
                anchors.left: parent.left
                anchors.top: jobTitleDesc.bottom
                anchors.leftMargin: 0
                TextInput {
                    id: industryTextInput1
                    x: 484
                    y: 128
                    width: 270
                    height: 20
                    color: "#808080"
                    text: qsTr("Software Engineering Intern")
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 14
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.family: "Arial"
                    font.italic: false
                    cursorVisible: false
                    selectByMouse: true
                }
                anchors.topMargin: 5
            }

            ComboBox {
                id: comboBox
                x: 172
                y: 156
                textRole: "hello"
                flat: false
                displayText: "Applied"
                editable: false
                currentIndex: 0
            }
        }
    }
}
