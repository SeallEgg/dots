import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Shapes
import QtQuick.Effects
import Qt5Compat.GraphicalEffects

import "root:/common"
import "root:/settings"

Scope{
    property int barHeight: 35
    property int barPadding: barHeight/2
    property var backgroundColor: Theme.palette.surface

    PanelWindow {
            id: topBar
            color: 'transparent'
            exclusiveZone: barHeight 
            implicitHeight: barHeight
            anchors {
                top: true
                left: true
                right: true
            }

            WrapperRectangle{
                id: leftBar
                color: backgroundColor
                anchors.left: parent.left
                Row{
                    height: barHeight 
                    Text{ 
                        text: "󰣇"
                        font.family: "Maple Mono NF"
                        height: barHeight
                        leftPadding: barPadding
                        anchors.verticalCenter: topBar.verticalCenter
                        font.pointSize: barHeight*0.6   
                        color: Theme.palette.primary
                    }
                }
            }

            Item {
                id: leftCornerArea
                height: barHeight
                anchors.left: leftBar.right
                anchors.right: centerBar.left

                CornerThingy {
                   anchors.fill: parent
                    corners: [0, 1]
                    cornerType: "cubic"
                    cornerHeight: barHeight
                    cornerWidth: barPadding*3
                    color: backgroundColor
                }
            }

            WrapperRectangle{
                id: centerBar
                color: backgroundColor
                anchors.centerIn: parent
                Row{
                    height: barHeight
                    ClockDisplay{width: 60; size: barHeight/2}
                }
            }

            Item {
                id: rightCornerArea
                height: barHeight
                anchors.left: centerBar.right
                anchors.right: rightBar.left

                CornerThingy {
                    anchors.fill: parent
                    corners: [0, 1]
                    cornerType: "cubic"
                    cornerHeight: barHeight
                    cornerWidth: barPadding*3
                    color: backgroundColor
                }
            }

            WrapperRectangle{
                id: rightBar
                color: backgroundColor
                anchors.right: parent.right
                Row{
                    height: barHeight
                    Tray {rightPadding: barPadding}
                }
            }
    }
}

