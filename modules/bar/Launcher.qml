import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import Quickshell.Widgets
import Quickshell.Wayland
import qs.components
import qs.settings
import qs.modules.screenLock
import qs.modules.powerMenu
import qs.modules.media

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
      source: "../../settings/icon.svg"
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
      width: 40
      height: 200
      anchors.top: parent.top
      anchors.left: parent.left
      anchors.topMargin: 16
      anchors.leftMargin: 10

      ColumnLayout {
        anchors.fill: parent
        anchors.margins: 4
        spacing: 2
        IconButton { // ScreenLock Module
          icon:"Lock"
          onClicked: {
            lock.screenLocked = true
          }
          ScreenLock {
            id: lock
          }
        }
        PowerButton { // PowerMenu Module
          onClicked: {
            launcherMenu.visible = false
          }
        }
        IconButton { // Light and dark mode maybe?
          icon: Theme.darkTheme ? "Bedtime" : "Wb_Sunny"
          onClicked: {
            Theme.darkTheme = !Theme.darkTheme
          }
        }
        MusicControls {
          id: music
        }
      }
    }
  }
}
