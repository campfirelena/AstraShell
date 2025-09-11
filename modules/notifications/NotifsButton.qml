import Quickshell
import Quickshell.Wayland
import Quickshell.Services.Notifications

MouseArea {
  id: root
  property bool hovering: false
  property real size: 32
  property bool notifsMuted: true

  cursorShape: Qt.PointingHandCursor
  implicitWidth: size
  implicitHeight: size

  hoverEnabled: true
  onEntered: hovering = true
  onExited: hovering = false
  onClicked: notifsMuted = !notifsMuted

  Rectangle {
    anchors.fill: parent
    radius: 8
    color: root.hovering ? Theme.accentPrimary : "transparent"
  }
  Text {
    id: iconText
    anchors.centerIn: parent
    text: root.notifsMuted ? "Notifications_Active" : "Notifications"
    font.family: "Material Symbols Outlined"
    font.pixelSize: 24
    color: root.hovering ? Theme.onAccent : Theme.textPrimary
    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter
  }
}
