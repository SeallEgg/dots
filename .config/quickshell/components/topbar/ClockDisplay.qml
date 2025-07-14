import Quickshell
import QtQuick
import "root:/settings"

Item {
    id: root
    implicitHeight: parent.height
    implicitWidth: parent.width

    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }
    
    Text {
    id: clockText
    text: Qt.formatDateTime(clock.date, "hh:mm")
    font.family: "Geist"
    font.weight: 500
    font.pointSize: 14
    color: Theme.palette.primary
    anchors.centerIn: parent
    }
}
