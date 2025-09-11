import Quickshell
import Quickshell.Widgets
import QtQuick
import qs.settings
import qs

MouseArea {
  id: root
  property string icon
  property bool hovering: false
  property real size: 32
  
  cursorShape: Qt.PointingHandCursor
  implicitWidth: size
  implicitHeight: size

  hoverEnabled: true
  onEntered: hovering = true
  onExited: hovering = false
  onClicked: Globals.darkMode = true

  Rectangle {
    anchors.fill: parent
    radius: 8
    color: root.hovering ? Theme.accentPrimary : "transparent"
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
