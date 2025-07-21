import Quickshell
import Quickshell.Services.SystemTray
import QtQuick

Item{
    id: root
    height: parent.height

    Row{
        anchors.fill: parent
        spacing: 10

        Repeater{
            model:SystemTray.items
            delegate: Item {
                id: trayItem
                width: 20; height: 20
                Image{
                    source:modelData.icon 
                    anchors.fill: parent
                }
            }
        }
    }
}