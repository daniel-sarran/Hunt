import QtQuick 2.0
import QtQuick.Controls 2.15

Item {
    width: 1200
    height: 450

    Rectangle {
        id: flipable
        anchors.fill: parent
    
        Rectangle {
            id: front
            color: "#ffffff"
            border.width: 0
            anchors.fill: parent
            clip: true

            Rectangle {
                id: nameRect
                x: 475
                width: 300
                height: 45
                color: "#ffffff"
                border.color: "#d3d3d3"
                border.width: 1
                radius: 5
                anchors.top: nameDesc.bottom
                anchors.topMargin: 0
                anchors.horizontalCenterOffset: 0
                anchors.horizontalCenter: parent.horizontalCenter


                TextInput {
                    id: nameTextInput
                    x: 484
                    y: 128
                    width: 270
                    height: 20
                    color: "#808080"
                    text: qsTr("Facebook, Amazon, Google...")
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
                text: qsTr("Company Name *")
                anchors.left: nameRect.left
                anchors.top: pageTitle.bottom
                font.italic: true
                anchors.leftMargin: 0
                anchors.topMargin: 0
                font.family: "Verdana"
                font.pointSize: 10
            }

            Rectangle {
                id: industryRect
                x: 475
                width: 300
                height: 45
                radius: 5
                border.color: "#d3d3d3"
                border.width: 1
                anchors.top: industryDesc.bottom
                anchors.topMargin: 0
                anchors.horizontalCenter: parent.horizontalCenter

                TextInput {
                    id: industryTextInput
                    x: 484
                    y: 128
                    width: 270
                    height: 20
                    color: "#808080"
                    text: qsTr("IT, Finance, Healthcare...")
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
                anchors.horizontalCenterOffset: 0
            }

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
                    width: 20
                    border.width: 1
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.leftMargin: 100
                    anchors.bottomMargin: 60
                    anchors.topMargin: 20
                    radius: width*0.5
                    border.color: "#7f808080"

                    Rectangle {
                        id: innerCircle
                        color: "#c4e8be"
                        radius: width*0.5
                        border.color: "#ffffff"
                        border.width: 1
                        anchors.fill: parent
                        anchors.rightMargin: 2
                        anchors.leftMargin: 2
                        anchors.bottomMargin: 2
                        anchors.topMargin: 2
                    }
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
                    id: addCompanyLabel
                    x: 94
                    text: qsTr("Add Company")
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
            }

            Label {
                id: industryDesc
                height: 15
                color: "#26282a"
                text: qsTr("Company Industry")
                anchors.left: nameDesc.right
                anchors.top: nameDesc.bottom
                font.italic: true
                anchors.leftMargin: -90
                anchors.topMargin: 70
                font.pointSize: 10
                font.family: "Verdana"
            }

            Rectangle {
                id: descriptionRect
                x: 470
                width: 300
                height: 120
                radius: 5
                border.color: "#d3d3d3"
                border.width: 1
                anchors.top: descriptionDesc.bottom
                anchors.topMargin: 0
                anchors.horizontalCenterOffset: 0
                anchors.horizontalCenter: parent.horizontalCenter

                TextArea {
                    id: descriptionTextArea
                    x: 484
                    y: 128
                    width: 270
                    height: 90
                    color: "#808080"
                    text: "www.wafflehouse.com\n\nXYZ Company's mission is to connect toasters to waffles to help them achieve breakfastdom..."
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 14
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignTop
                    wrapMode: Text.WordWrap
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
                text: qsTr("Company Description")
                anchors.left: nameRect.left
                anchors.top: industryDesc.bottom
                font.italic: true
                anchors.leftMargin: 0
                anchors.topMargin: 70
                font.pointSize: 10
                font.family: "Verdana"
            }
        }
    }
}
