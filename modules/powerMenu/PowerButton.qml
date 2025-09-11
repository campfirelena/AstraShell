import Quickshell
import Quickshell.Widgets
import QtQuick
import qs.settings

MouseArea {
  id: root
  property bool hovering: false
  property real size: 32
  
  cursorShape: Qt.PointingHandCursor
  implicitWidth: size
  implicitHeight: size

  hoverEnabled: true
  onEntered: hovering = true
  onExited: hovering = false
  onClicked: powerMenu.isOpen = true

  Rectangle {
    anchors.fill: parent
    radius: 8
    color: root.hovering ? Theme.accentPrimary : "transparent"
  }
  Text {
    id: iconText
    anchors.centerIn: parent
    text: "Mode_Off_On"
    font.family: "Material Symbols Outlined"
    font.pixelSize: 24
    color: root.hovering ? Theme.onAccent : Theme.textPrimary
    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter
  }
  PowerMenu {
    id:powerMenu
    MenuButton {
      command: "loginctl lock-session"
      icon: "Lock"
      text: "Lock"
    }
    MenuButton {
      command: "loginctl terminate-user $USER"
      icon: "Logout"
      text: "Logout"
    }
    MenuButton {
      command: "loginctl suspend"
      icon: "Pause_Circle"
      text: "Suspend"
    }
    MenuButton {
      command: "loginctl hibernate"
      icon: "Bedtime"
      text: "Hibernate"
    }
    MenuButton {
      command: "loginctl poweroff"
      icon: "Mode_Off_On"
      text: "Power Off"
    }
    MenuButton {
      command: "loginctl reboot"
      icon: "Restart_Alt"
      text: "Reboot"
    }
  }
}
