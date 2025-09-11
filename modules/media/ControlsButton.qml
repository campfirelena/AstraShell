import Quickshell
import Quickshell.Widgets
import QtQuick
import qs.settings

MouseArea {
  id: root
  property string icon
  property bool activated: false
  property real size: 32
  cursorShape: Qt.PointingHandCursor
  implicitWidth: size
  implicitHeight: size

  onClicked: activated = !activated

  Rectangle {
    anchors.fill: parent
    radius: 8
    color: "transparent"
  }
  Text {
    id: iconText
    anchors.centerIn: parent
    text: root.icon
    font.family: "Material Symbols Outlined"
    font.pixelSize: 24
    color: root.hovering ? Theme.onAccent : Theme.textPrimary
    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter
  }
}
