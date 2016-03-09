import QtQuick 2.0
import Ubuntu.Components 1.1

/*!
    \brief MainView with a Label and Button elements.
*/

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "urldispatcher.liu-xiao-guo"

    /*
     This property enables the application to change orientation
     when the device is rotated. The default is false.
    */
    //automaticOrientation: true

    // Removes the old toolbar and enables new features of the new header.
    useDeprecatedToolbar: false

    width: units.gu(60)
    height: units.gu(85)

    property var plugins: ["about", "phone", "battery", "bluetooth", "brightness",
        "cellular", "language", "background", "flight-mode",
        "notifications", "orientation-lock", "reset", "security-privacy",
        "sound", "system-update", "time-date", "wifi"]

    Page {
        title: i18n.tr("urldispatcher")

        Flickable {
            clip: true
            width: parent.width
            height: parent.height
            contentHeight: content.childrenRect.height

            Column {
                id: content
                anchors.centerIn: parent
                spacing: units.gu(1)

                Repeater {
                    model: plugins
                    delegate: Button {
                        text: modelData
                        onClicked: {
                            Qt.openUrlExternally("settings:///system/" + modelData);
                        }
                    }
                }
            }

        }
    }
}

