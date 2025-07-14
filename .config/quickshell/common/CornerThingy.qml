// A quick & easy way to add those fancy inverted rounded corners

// All you need to do is give it an array of corners
// 0 is top left, 1 is top right, 2 is bottom left, 3 is bottom right

// Corners are perfect quarter circles, radius is defined by cornerSize

import QtQuick
import QtQuick.Shapes

Item {
    id: root
    anchors.fill: parent

    property int cornerSize: 20
    property color color: "#000000"
    property var corners: [0]


    Repeater{
        model: root.corners
        delegate: Shape {
            id: shape
            asynchronous: true
            fillMode: Shape.PreserveAspectFit
            preferredRendererType: Shape.CurveRenderer
            width: root.cornerSize
            height: root.cornerSize

            property int currentCorner: modelData

            anchors.left: {
                switch (currentCorner) {
                case 0:
                case 2:
                    return root.left
                default:
                    return undefined
                }
            }
            anchors.right: {
                switch (currentCorner) {
                case 1:
                case 3:
                    return root.right
                default:
                    return undefined
                }
            }
            anchors.top: {
                switch (currentCorner) {
                case 0:
                case 1:
                    return root.top
                default:
                    return undefined
                }
            }
            anchors.bottom: {
                switch (currentCorner) {
                case 2:
                case 3:
                    return root.bottom
                default:
                    return undefined
                }
            }

            ShapePath {
                startX: 0
                startY: 0
                strokeWidth: 0
                fillColor: root.color

                PathLine { x: 0; y: shape.height }
                PathLine { x: shape.width; y: shape.height }
                PathArc { 
                    x: 0
                    y: 0
                    radiusX: shape.width
                    radiusY: shape.height
                }
            }

            transform: Rotation {
                origin.x: shape.width / 2
                origin.y: shape.height / 2
                angle: {
                    switch (currentCorner) {
                        case 0: 
                            return 90
                        case 1:
                            return 180
                        case 2: 
                            return 0
                        case 3: 
                            return 270
                        default:
                            return 90
                    }
                } 
            }
        }
    }
}