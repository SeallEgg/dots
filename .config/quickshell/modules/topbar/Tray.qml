import Quickshell
import Quickshell.Services.SystemTray
import QtQuick

Row {
    height: parent.height
    spacing: 10

    Repeater {
        model: SystemTray.items
        delegate: Item {                                   
            
            width: 26; height: 26
            anchors.verticalCenter: parent.verticalCenter
            
            MouseArea {
                anchors.fill: parent
                acceptedButtons: Qt.LeftButton | Qt.RightButton

                onClicked: (mouse) => {
                    if (mouse.button === Qt.LeftButton ) {
                        console.log("LMB")
                        modelData.activate
                    }
                    else if (mouse.button === Qt.RightButton) {
                        console.log ("RMB")
                        if (modelData.hasMenu){
                            console.log ("ai ai ai")
                            modelData.menu.showAt(parent, 20,20)
                        }
                    }
                }     
                
                Image {
                    source: modelData.icon 
                    anchors.fill: parent
                }
            }
        }
    }         
}