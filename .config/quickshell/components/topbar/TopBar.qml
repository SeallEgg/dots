import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Shapes
import QtQuick.Effects

import "root:/common"
import "root:/settings"
import "root:/assets"

Scope{
    property int barHeight: 40

    property int centerWidth: 500
    property int leftWidth: 200
    property int rightWidth: 200

    property int cornerHeight: 40
    property var backgroundColor: Theme.palette.surface

    Image{
    id: logo
    source: "root:/assets/arch-linux-48.svg"
    visible: false
    sourceSize: Qt.size(48, 48)
    height: 30; width: 30
    }

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
                    
                    Item{
                        id: cornerIcon
                        height: barHeight
                        width: 50

                        MultiEffect{
                            source: logo
                            visible: true
                            height: 30; width: 30
                            anchors.centerIn: parent
                            colorization: 1
                            colorizationColor: Theme.palette.primary
                        }
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
                    cornerHeight: 40
                    cornerWidth: 50
                    color: backgroundColor
                }
            }

            WrapperRectangle{
                id: centerBar
                color: backgroundColor
                anchors.centerIn: parent
                Row{
                    height: barHeight
                    ClockDisplay{width: 400}
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
                    cornerHeight: 40
                    cornerWidth: 50
                    color: backgroundColor
                }
            }

            WrapperRectangle{
                id: rightBar
                color: backgroundColor
                anchors.right: parent.right
                Row{
                    height: barHeight
                    Tray {width: 90}
                }
            }
    }
}

