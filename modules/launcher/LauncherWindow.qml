import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.components
import qs.settings
import qs.modules.screenLock
import qs.modules.powerMenu
import qs.modules.media
  PanelWindow {
    id: root
    visible: false

    anchors.top: true
    anchors.left: true
    anchors.right: true
    anchors.bottom: true

    color: "transparent"

    Rectangle {
      color: Theme.backgroundPrimary
      radius: 12
      border.color: Theme.outline
      border.width: 2
      width: 40
      height: 200
      anchors.top: parent.top
      anchors.left: parent.left
      anchors.topMargin: 10
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
            root.visible = false
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
