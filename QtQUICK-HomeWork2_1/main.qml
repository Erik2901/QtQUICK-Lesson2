import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    width: 640
    height: 480
    minimumHeight: 480
    maximumHeight: 480
    minimumWidth: 640
    maximumWidth: 640
    visible: true
    color: "#ffffff"
    id: root
    title: qsTr("Find Your Soulmate")
    Rectangle{
        id: img_rect
        width: 250
        height: 480
        anchors.left: parent.left
        anchors.top: parent.top
        Image{
            anchors.fill: parent
            source: "qrc:/firs_page.png"
        }
    }
    Rectangle{
        id: sec_rect
        width: 390
        height: 480
        anchors.top: parent.top
        anchors.right: parent.right
        FontLoader{
            id: poppins_reg
            source: "qrc:/Poppins-Regular.ttf"
        }
        FontLoader{
            id: poppins_sb
            source: "qrc:/Poppins-SemiBold.ttf"
        }
        Rectangle{
            y: 23
            anchors.horizontalCenter: parent.horizontalCenter
            Image {
                id: heart
                source: "qrc:/heart.png"
                x: -30
                y: 3
            }
            Text {
                id: fysm
                text: qsTr("FYSM")
                color: "#3F3F3F"
                font.family: poppins_sb.font
                font.pixelSize: 15
            }
        }

        Text{
            anchors.horizontalCenter: parent.horizontalCenter
            text: "<font color=\"#3F3F3F\" >Hi, </font><font color=\"#E25959\">single</font><font color=\"#3F3F3F\">!</font>"
            font.family: poppins_sb.font
            font.pixelSize: 28
            y:113
        }
        Text{
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Tell me what’s your name?"
            color: "#8B8B8B"
            font.family: poppins_reg.font
            font.pixelSize: 18
            y:172
        }

        TextField{
            id: name_inp
            width: 280
            height: 52
            anchors.horizontalCenter: parent.horizontalCenter
            y: 215
            font.pixelSize: 13
            font.family: poppins_reg.font
            verticalAlignment: TextInput.AlignVCenter
            leftPadding: 20
            color: "#C7C7C7"
            placeholderText: "Enter your name"
            placeholderTextColor: "#C7C7C7"
            background: Rectangle{
                id: name_rect
                color: "#F8F8F8"
                radius: 10
            }
            onFocusChanged: {
                name_rect.border.color = "#FFBBBB"
            }
        }
        Rectangle {
            anchors.horizontalCenter: parent.horizontalCenter
            width: 279
            height: 49
            y: 291
            color: "#E25959"
            radius: 40
            Text{
                color: "#FFFFFF"
                font.family: poppins_sb.font
                font.pixelSize: 15
                text: "Next"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onPressed: {
                    parent.color = "#ba3232"
                }
                onReleased: {
                    parent.color = "#E25959"
                }
                onEntered: {
                    parent.color = "#f26060"
                }
                onExited: {
                    parent.color = "#E25959"
                }

                onClicked: {
                    if(name_inp.text === ""){
                        empt_anim.start()
                    }
                    else{
                        img_rect.anchors.left =  undefined
                        img_rect.anchors.top =  undefined
                        sec_rect.anchors.top = undefined
                        sec_rect.anchors.right = undefined
                        sec_page_anim.start()
                        img_sec_rect.anchors.left =  root.left
                        img_sec_rect.anchors.top =  root.top
                        four_rect.anchors.top = root.top
                        four_rect.anchors.right = root.right

                    }
                }
            }
        }
        Text{
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 25
            text: qsTr("Privacy Policy")
            font.family: poppins_reg.font
            font.pixelSize: 14
            color: "#8B8B8B"

        }
    }
    Rectangle{
        id: img_sec_rect
        width: 250
        height: 480
        y: 480
        Image{
            anchors.fill: parent
            source: "qrc:/sec_page.png"
        }
    }
    Rectangle{
        id: four_rect
        width: 390
        height: 480
        y: 480
        x: 250
        Text{
            text: "We need some info..."
            color: "#3F3F3F"
            font.family: poppins_sb.font
            font.pixelSize: 16
            y: 38
            x: 40
        }
        Text{
            text: "Tell me something about you " + name_inp.text
            color: "#8B8B8B"
            font.family: poppins_reg.font
            font.pixelSize: 14
            y: 71
            x: 40
        }
        ComboBox{
            id: gender_box
            font.family: poppins_reg.font
            font.pixelSize: 13
            currentIndex: -1
            model: ["Man", "Woman"]
            width: 145
            height: 46
            anchors.left: parent.left
            anchors.leftMargin:40
            y: 117
            leftPadding: 13
            background: Rectangle{
                id: gend_rect
                color: "#F8F8F8"
                radius: 5
                Text{
                    id: gend_txt
                    text: "Gender"
                    font.family: poppins_reg.font
                    font.pixelSize: 13
                    anchors.left: parent.left
                    anchors.leftMargin: 13
                    anchors.verticalCenter: parent.verticalCenter
                    color: "#C7C7C7"
                }

                Image {
                    source: "qrc:/stroke.png"
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.rightMargin: 10
                }
            }
            onActivated: gend_txt.text = ""
        }
        ComboBox{
            id: age_box
            font.family: poppins_reg.font
            font.pixelSize: 13
            currentIndex: -1
            model: ["18", "19", "20", "21", "22", "23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39",
                "40","41", "42", "43", "44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60"]
            width: 145
            height: 46
            anchors.right: parent.right
            anchors.rightMargin: 40
            y: 117
            leftPadding: 13
            background: Rectangle{
                id: age_rect
                color: "#F8F8F8"
                radius: 5
                Text{
                    id: age_txt
                    text: "Age"
                    font.family: poppins_reg.font
                    font.pixelSize: 13
                    anchors.left: parent.left
                    anchors.leftMargin: 13
                    anchors.verticalCenter: parent.verticalCenter
                    color: "#C7C7C7"
                }

                Image {
                    source: "qrc:/stroke.png"
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.rightMargin: 10
                }

            }
            onActivated: age_txt.text = ""
        }
        TextField{
            id: hobb_inp
            width: 310
            height: 46
            anchors.horizontalCenter: parent.horizontalCenter
            y: 178
            font.pixelSize: 13
            font.family: poppins_reg.font
            verticalAlignment: TextInput.AlignVCenter
            leftPadding: 13
            selectByMouse: true
            color: "#C7C7C7"
            placeholderText: "Hobbies"
            placeholderTextColor: "#C7C7C7"
            background: Rectangle{
                id: hobb_rect
                color: "#F8F8F8"
                radius: 5
            }
        }
        ComboBox{
            id: education_box
            font.family: poppins_reg.font
            font.pixelSize: 13
            currentIndex: -1
            model: ["Primary", "Lower", "Upper"]
            width: 145
            height: 46
            anchors.left: parent.left
            anchors.leftMargin:40
            y: 239
            leftPadding: 13
            background: Rectangle{
                id: educ_rect
                color: "#F8F8F8"
                radius: 5
                Text{
                    id: education_txt
                    text: "Education"
                    font.family: poppins_reg.font
                    font.pixelSize: 13
                    anchors.left: parent.left
                    anchors.leftMargin: 13
                    anchors.verticalCenter: parent.verticalCenter
                    color: "#C7C7C7"
                }

                Image {
                    source: "qrc:/stroke.png"
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.rightMargin: 10
                }
            }
            onActivated: education_txt.text = ""
        }
        TextField{
            id: city_inp
            width: 145
            height: 46
            anchors.right: parent.right
            anchors.rightMargin: 40
            y: 239
            font.pixelSize: 13
            font.family: poppins_reg.font
            verticalAlignment: TextInput.AlignVCenter
            leftPadding: 20
            selectByMouse: true
            color: "#C7C7C7"
            placeholderText: "City"
            placeholderTextColor: "#C7C7C7"
            background: Rectangle{
                id: city_rect
                color: "#F8F8F8"
                radius: 5
            }
        }
        TextArea{
            id: about_area
            wrapMode: TextArea.WordWrap
            width: 310
            height: 75
            anchors.horizontalCenter: parent.horizontalCenter
            y: 300
            topPadding: 13
            leftPadding: 13
            font.pixelSize: 13
            font.family: poppins_reg.font
            color: "#C7C7C7"
            placeholderText: "Information about you"
            placeholderTextColor: "#C7C7C7"
            selectByMouse: true
            background: Rectangle{
                id: about_rect
                color: "#F8F8F8"
                radius: 5
            }
        }
        Rectangle {
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.rightMargin: 40
            anchors.bottomMargin: 40
            width: 112
            height: 47
            color: "#E25959"
            radius: 40
            Text{
                color: "#FFFFFF"
                font.family: poppins_sb.font
                font.pixelSize: 14
                text: "Next"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onPressed: {
                    parent.color = "#ba3232"
                }
                onReleased: {
                    parent.color = "#E25959"
                }
                onEntered: {
                    parent.color = "#f26060"
                }
                onExited: {
                    parent.color = "#E25959"
                }

                onClicked: {
                    if(gender_box.currentIndex === -1){
                        gender_anim.start()
                    }
                    if(age_box.currentIndex === -1){
                        age_anim.start()
                    }
                    if(hobb_inp.text === ""){
                        hobb_anim.start()
                    }
                    if(education_box.currentIndex === -1){
                        educ_anim.start()
                    }
                    if(city_inp.text === ""){
                        city_anim.start()
                    }
                    if(about_area.text === ""){
                        about_anim.start()
                    }
                    if(gender_box.currentIndex !== -1 && age_box.currentIndex !== -1
                            && hobb_inp.text !== "" && education_box.currentIndex !== -1
                            && city_inp.text !== "" && about_area.text !== "")
                    {
                        third_page_anim.start()
                    }
                }
            }
        }
    }
    Rectangle{
        id: img_third_rect
        width: 250
        height: 480
        y: 480
        Image{
            anchors.fill: parent
            source: "qrc:/third_page.png"
        }
    }

    Rectangle{
        id: sixth_rect
        width: 390
        height: 480
        y: 480
        x: 250
        Text{
            text: "Final step!"
            color: "#3F3F3F"
            font.family: poppins_sb.font
            font.pixelSize: 16
            y: 38
            x: 40
        }
        Text{
            text: "Tell me about your ideal partner"
            color: "#8B8B8B"
            font.family: poppins_reg.font
            font.pixelSize: 14
            y: 71
            x: 40
        }
        ComboBox{
            id: age_from_box
            font.family: poppins_reg.font
            font.pixelSize: 13
            currentIndex: -1
            model: ["18", "19", "20", "21", "22", "23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39",
                "40","41", "42", "43", "44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60"]
            width: 145
            height: 46
            anchors.left: parent.left
            anchors.leftMargin:40
            y: 117
            leftPadding: 13
            background: Rectangle{
                id: age_from_rect
                color: "#F8F8F8"
                radius: 5
                Text{
                    id: age_from_txt
                    text: "Age from"
                    font.family: poppins_reg.font
                    font.pixelSize: 13
                    anchors.left: parent.left
                    anchors.leftMargin: 13
                    anchors.verticalCenter: parent.verticalCenter
                    color: "#C7C7C7"
                }

                Image {
                    source: "qrc:/stroke.png"
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.rightMargin: 10
                }
            }
            onActivated: age_from_txt.text = ""
        }
        ComboBox{
            id: age_to_box
            font.family: poppins_reg.font
            font.pixelSize: 13
            currentIndex: -1
            model: ["18", "19", "20", "21", "22", "23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39",
                "40","41", "42", "43", "44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60"]
            width: 145
            height: 46
            anchors.right: parent.right
            anchors.rightMargin: 40
            y: 117
            leftPadding: 13
            background: Rectangle{
                id: age_to_rect
                color: "#F8F8F8"
                radius: 5
                Text{
                    id: age_to_txt
                    text: "Age to"
                    font.family: poppins_reg.font
                    font.pixelSize: 13
                    anchors.left: parent.left
                    anchors.leftMargin: 13
                    anchors.verticalCenter: parent.verticalCenter
                    color: "#C7C7C7"
                }

                Image {
                    source: "qrc:/stroke.png"
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.rightMargin: 10
                }

            }
            onActivated: age_to_txt.text = ""
        }
        ComboBox{
            id: gender_part_box
            font.family: poppins_reg.font
            font.pixelSize: 13
            currentIndex: -1
            model: ["Man", "Woman"]
            width: 310
            height: 46
            y: 183
            anchors.horizontalCenter: parent.horizontalCenter
            leftPadding: 13
            background: Rectangle{
                id: gend_part_rect
                color: "#F8F8F8"
                radius: 5
                Text{
                    id: gend_part_txt
                    text: "Gender"
                    font.family: poppins_reg.font
                    font.pixelSize: 13
                    anchors.left: parent.left
                    anchors.leftMargin: 13
                    anchors.verticalCenter: parent.verticalCenter
                    color: "#C7C7C7"
                }

                Image {
                    source: "qrc:/stroke.png"
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.rightMargin: 10
                }
            }
            onActivated: gend_part_txt.text = ""
        }
        ComboBox{
            id: educ_part_box
            font.family: poppins_reg.font
            font.pixelSize: 13
            currentIndex: -1
            model: ["Primary", "Lower", "Upper"]
            width: 310
            height: 46
            y: 249
            anchors.horizontalCenter: parent.horizontalCenter
            leftPadding: 13
            background: Rectangle{
                id: educ_part_rect
                color: "#F8F8F8"
                radius: 5
                Text{
                    id: educ_part_txt
                    text: "Education"
                    font.family: poppins_reg.font
                    font.pixelSize: 13
                    anchors.left: parent.left
                    anchors.leftMargin: 13
                    anchors.verticalCenter: parent.verticalCenter
                    color: "#C7C7C7"
                }

                Image {
                    source: "qrc:/stroke.png"
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.rightMargin: 10
                }
            }
            onActivated: educ_part_txt.text = ""
        }
        Rectangle {
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.rightMargin: 40
            anchors.bottomMargin: 118
            width: 130
            height: 47
            color: "#E25959"
            radius: 40
            Text{
                color: "#FFFFFF"
                font.family: poppins_sb.font
                font.pixelSize: 14
                text: "Registration"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onPressed: {
                    parent.color = "#ba3232"
                }
                onReleased: {
                    parent.color = "#E25959"
                }
                onEntered: {
                    parent.color = "#f26060"
                }
                onExited: {
                    parent.color = "#E25959"
                }

                onClicked: {
                    if(age_from_box.currentIndex === -1){
                        age_from_anim.start()
                    }
                    if(age_to_box.currentIndex === -1){
                        age_to_anim.start()
                    }
                    if(educ_part_box.currentIndex === -1){
                        educ_part_anim.start()
                    }
                    if(gender_part_box.currentIndex === -1){
                        gend_part_anim.start()
                    }
                    if(age_from_box.currentIndex !== -1 && age_to_box.currentIndex !== -1
                            && educ_part_box.currentIndex !== -1 && gender_part_box.currentIndex !== -1)
                    {
                        console.log("\n", "Name:", name_inp.text, "\n", "Gender:", gender_box.currentText,
                                    "\n", "Age:", age_box.currentText, "\n", "Hobbies:", hobb_inp.text,
                                    "\n", "Education:", education_box.currentText, "\n", "City:", city_inp.text,
                                    "\n", "About:", about_area.text)
                    }
                }
            }
        }
    }


    PropertyAnimation{
        id: empt_anim
        target: name_rect
        property: "color"
        from: "dark red"
        to: "#F8F8F8"
        duration: 1000
    }
    ParallelAnimation{
        id: sec_page_anim
        PropertyAnimation{
            target: img_rect
            property: "y"
            to: -480
            duration: 1000
        }
        PropertyAnimation{
            target: sec_rect
            property: "y"
            to: -480
            duration: 1000
        }
        PropertyAnimation{
            target: img_sec_rect
            property: "y"
            to: 0
            duration: 1000
        }
        PropertyAnimation{
            target: four_rect
            property: "y"
            to: 0
            duration: 1000
        }
    }
    PropertyAnimation{
        id: gender_anim
        target: gend_rect
        property: "color"
        from: "dark red"
        to: "#F8F8F8"
        duration: 1000
    }
    PropertyAnimation{
        id: age_anim
        target: age_rect
        property: "color"
        from: "dark red"
        to: "#F8F8F8"
        duration: 1000
    }
    PropertyAnimation{
        id: hobb_anim
        target: hobb_rect
        property: "color"
        from: "dark red"
        to: "#F8F8F8"
        duration: 1000
    }
    PropertyAnimation{
        id: educ_anim
        target: educ_rect
        property: "color"
        from: "dark red"
        to: "#F8F8F8"
        duration: 1000
    }
    PropertyAnimation{
        id: city_anim
        target: city_rect
        property: "color"
        from: "dark red"
        to: "#F8F8F8"
        duration: 1000
    }
    PropertyAnimation{
        id: about_anim
        target: about_rect
        property: "color"
        from: "dark red"
        to: "#F8F8F8"
        duration: 1000
    }
    ParallelAnimation{
        id: third_page_anim
        PropertyAnimation{
            target: img_sec_rect
            property: "y"
            to: -480
            duration: 1000
        }
        PropertyAnimation{
            target: four_rect
            property: "y"
            to: -480
            duration: 1000
        }
        PropertyAnimation{
            target: img_third_rect
            property: "y"
            to: 0
            duration: 1000
        }
        PropertyAnimation{
            target: sixth_rect
            property: "y"
            to: 0
            duration: 1000
        }
    }
    PropertyAnimation{
        id: age_from_anim
        target: age_from_rect
        property: "color"
        from: "dark red"
        to: "#F8F8F8"
        duration: 1000
    }
    PropertyAnimation{
        id: age_to_anim
        target: age_to_rect
        property: "color"
        from: "dark red"
        to: "#F8F8F8"
        duration: 1000
    }
    PropertyAnimation{
        id: educ_part_anim
        target: educ_part_rect
        property: "color"
        from: "dark red"
        to: "#F8F8F8"
        duration: 1000
    }
    PropertyAnimation{
        id: gend_part_anim
        target: gend_part_rect
        property: "color"
        from: "dark red"
        to: "#F8F8F8"
        duration: 1000
    }
}
