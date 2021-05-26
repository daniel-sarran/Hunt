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

            Label {
                id: nameDesc
                x: 450
                height: 15
                color: "#26282a"
                text: qsTr("Company Name *")
                anchors.top: pageTitle.bottom
                font.italic: true
                anchors.leftMargin: 0
                anchors.topMargin: 0
                font.family: "Verdana"
                font.pointSize: 10
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
                    color: "#666766"
                    text: qsTr("Add Company")
                    anchors.top: stage1.bottom
                    anchors.topMargin: 5
                    anchors.horizontalCenter: stage1.horizontalCenter
                    font.bold: false
                }

                Label {
                    id: reviewSubmit
                    x: 195
                    color: "#000000"
                    text: qsTr("Review & Submit")
                    anchors.top: stage2.bottom
                    font.bold: true
                    anchors.horizontalCenter: stage2.horizontalCenter
                    anchors.topMargin: 5
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

            Label {
                id: industryDesc
                height: 15
                color: "#26282a"
                text: qsTr("Company Industry")
                anchors.left: nameDesc.left
                anchors.top: nameDesc.bottom
                font.italic: true
                anchors.leftMargin: 0
                anchors.topMargin: 70
                font.pointSize: 10
                font.family: "Verdana"
            }
            Label {
                id: descriptionDesc
                height: 15
                color: "#26282a"
                text: qsTr("Company Description")
                anchors.left: industryDesc.left
                anchors.top: industryDesc.bottom
                font.italic: true
                anchors.leftMargin: 0
                anchors.topMargin: 70
                font.pointSize: 10
                font.family: "Verdana"
            }

            Label {
                id: nameLabel
                width: 300
                height: 20
                color: "#000000"
                text: qsTr("Label")
                anchors.left: nameDesc.left
                anchors.top: nameDesc.bottom
                font.pointSize: 14
                anchors.leftMargin: 0
                anchors.topMargin: 12
            }

            Label {
                id: industryLabel
                width: 300
                height: 20
                color: "#000000"
                text: qsTr("Label")
                anchors.left: industryDesc.left
                anchors.top: industryDesc.bottom
                font.pointSize: 14
                anchors.leftMargin: 0
                anchors.topMargin: 12
            }

            Label {
                id: descriptionLabel
                width: 300
                height: 120
                color: "#000000"
                text: qsTr("Label")
                anchors.left: descriptionDesc.left
                anchors.top: descriptionDesc.bottom
                wrapMode: Text.WordWrap
                font.pointSize: 14
                anchors.leftMargin: 0
                anchors.topMargin: 12
            }
        }
    }
}
