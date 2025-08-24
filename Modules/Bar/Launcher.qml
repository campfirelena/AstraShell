import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import Quickshell.Widgets
import Quickshell.Wayland
import qs.Components
import qs.Settings
import qs.Modules.ScreenLock
import qs.Modules.PowerMenu

Item {
  id: root
  property bool value: false
  property var screen: modelData

  function isVisible() {
    value: !value
    console.log(value)
  }



  Rectangle {
    id: background
    color: Theme.backgroundPrimary
    border.color: Theme.outline
    border.width: 2
    width: 40
    height: 40
    radius: 8

    MouseArea {
      id: launcherMouseArea
      anchors.fill: parent
      anchors.centerIn: parent
      hoverEnabled: true
      cursorShape: Qt.PointingHandCursor
      acceptedButtons: Qt.LeftButton | Qt.RightButton | Qt.MiddleButton
      onClicked: function() {
        launcherMenu.visible = !launcherMenu.visible
      }
    }

    Image {
      id: launcherIcon
      source: "../../Settings/icon.svg"
      anchors.centerIn: parent
      height: 32
      width: 32
    }
  }
  PanelWithOverlay {
    id: launcherMenu

    visible: false

    Rectangle {
      color: Theme.backgroundPrimary
      radius: 12
      border.color: Theme.outline
      border.width: 1
      width: 200
      height: 200
      anchors.top: parent.top
      anchors.left: parent.left
      anchors.topMargin: 16
      anchors.leftMargin: 10

      MouseArea {
        anchors.fill: parent
      }

      ColumnLayout {
        anchors.fill: parent
        anchors.margins: 16
        spacing: 12

        RowLayout{
          Layout.fillWidth: true
          spacing: parent.width - (32 * 3) - (20 * 2)
          IconButton { // ScreenLock Module
            icon:"Lock"
            onClicked: {
              lock.screenLocked = true
            }
            ScreenLock {
              id: lock
            }
          }
          IconButton { // PowerMenu Module
            icon: "Power_Settings_New"
            Layout.alignment: Qt.AlignHCenter
            onClicked: {
              launcherMenu.visible = false
              powerMenu.isOpen = true
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
                icon: "Lock"
                text: "Logout"
              }
              MenuButton {
                command: "loginctl suspend"
                icon: "Lock"
                text: "Suspend"
              }
              MenuButton {
                command: "loginctl hibernate"
                icon: "Lock"
                text: "Hibernate"
              }
              MenuButton {
                command: "loginctl poweroff"
                icon: "Lock"
                text: "Power Off"
              }
              MenuButton {
                command: "loginctl reboot"
                icon: "Lock"
                text: "Reboot"
              }
            }
          }
          IconButton { // Light and dark mode maybe?
            icon: Theme.darkTheme ? "Bedtime" : "Wb_Sunny"
            onClicked: {
              Theme.darkTheme = !Theme.darkTheme
            }
          }
        }
        Rectangle {
          Layout.fillWidth: true

          color: "transparent"
          height: 30

          radius: 8

          Text {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            text: "Start Terminal"
            color: Theme.textPrimary
            opacity: 0.8
            font.pixelSize: 13 * Theme.scale(screen)
            font.family: Theme.fontFamily
            font.bold: true
          }
          MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
              parent.color = Theme.onAccent
            }
            onExited: {
              parent.color = "transparent"
            }
            onClicked: {
              terminal.running = true
            }
          }
          Process {
            id: terminal
            running: false
            command: ["sh","-c","kitty","&"]
          }
        }
        Rectangle {
          Layout.fillWidth: true

          color: "transparent"
          height: 30

          radius: 8

          Text {
            Layout.fillWidth: true
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            text: "Start Applications"
            color: Theme.textPrimary
            opacity: 0.8
            font.pixelSize: 13 * Theme.scale(screen)
            font.family: Theme.fontFamily
            font.bold: true
          }
          MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
              parent.color = Theme.onAccent
            }
            onExited: {
              parent.color = "transparent"
            }
            onClicked: {
              lock.screenLocked = true
            }
          }
        }
      }
    }
  }
}
