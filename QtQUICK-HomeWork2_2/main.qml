import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Exercise 2")
    color: "#00ffff"
    property int r: Math.random()
    property int g: Math.random()
    property int b: Math.random()
    Rectangle{
        id: rect
        width: 200
        height: 200
        color: "red"
        anchors.centerIn: parent
        MouseArea{
            acceptedButtons: Qt.RightButton | Qt.LeftButton
            anchors.fill: parent
            onClicked: (mouse)=> {
                           if(mouse.button === Qt.RightButton){
                               rotation_anim.start()
                           }
                           else if(mouse.button === Qt.LeftButton){
                               color_anim.start()
                           }
                       }
            onDoubleClicked: (mouse) =>{
                                 if(mouse.button === Qt.LeftButton){
                                     radius_anim.start()
                                 }
                             }
        }
    }

    PropertyAnimation {
        id: color_anim
        target: rect
        property: "color"
        to: Qt.rgba(Math.random(),Math.random(),Math.random(),1 )
        duration: 500
    }

    PropertyAnimation {
        id: radius_anim
        target: rect
        property: "radius"
        to: 100
        duration: 1000
    }

    PropertyAnimation {
        id: rotation_anim
        target: rect
        property: "rotation"
        from: 0
        to: 360
        duration: 2000
    }
}
