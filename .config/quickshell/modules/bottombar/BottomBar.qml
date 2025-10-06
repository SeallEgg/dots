
import Quickshell
import QtQuick
import QtQuick.Effects

import "root:/common"
import "root:/settings"

Scope{
    property int barHeight: 26
    property int cornerHeight: 28
    property var backgroundColor: Theme.palette.background

    PanelWindow {
            id: bottomBar
            color: 'transparent'
            exclusiveZone: barHeight      
            implicitHeight: barHeight+cornerHeight
            anchors {
                bottom: true
                left: true
                right: true
            }
            Item {
                id: background
                anchors.fill: parent

                Rectangle {
                    height: barHeight
                    width: parent.width
                    y: cornerHeight
                    color: backgroundColor
                }
                
                Item {
                    id: cornerArea
                    height: cornerHeight
                    width: parent.width
                    y: 0

                    CornerThingy {
                        corners: [2,3]
                        cornerSize: cornerHeight
                        color: backgroundColor
                    }
                }
            }
            Item{
                id: barcontainer
                implicitHeight: barHeight
                implicitWidth: parent.width
            }
    }
}
