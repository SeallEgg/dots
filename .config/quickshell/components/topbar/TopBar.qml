import Quickshell
import Quickshell.Io
import Quickshell.Services.SystemTray 
import QtQuick

import "root:/common"
import "root:/settings"

Scope{
    property int barHeight: 36
    property int cornerHeight: 28
    property var backgroundColor: Theme.palette.background 

    PanelWindow {
            id: topbar
            color: 'transparent'
            exclusiveZone: barHeight      
            implicitHeight: barHeight+cornerHeight
            anchors {
                top: true
                left: true
                right: true
            }
            Item {
                id: background
                anchors.fill: parent

                Rectangle {
                    height: barHeight
                    width: parent.width
                    color: backgroundColor
                }
                
                Item {
                    id: cornerArea
                    height: cornerHeight
                    width: parent.width
                    y: barHeight

                    CornerThingy {
                        corners: [0,1]
                        cornerSize: cornerHeight
                        color: backgroundColor
                    }
                }
            }
            Item {
                id: barcontainer
                implicitHeight: barHeight
                implicitWidth: parent.width

                ClockDisplay {}

                Item {
                    id: rightContainer
                    anchors.rightMargin: parent
                    
                 //   SysTray{}
                }
            }
    }
}
