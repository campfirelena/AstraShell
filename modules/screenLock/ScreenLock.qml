// This Module is referenced in the Launcher in the bar.

import Quickshell
import Quickshell.Wayland
import QtQuick
import QtQuick.Controls.Fusion
import qs.settings
import qs.components

Item {
  id: lockWidget
  property bool screenLocked: false

  WlSessionLock {
    id: lock
    locked: screenLocked

    WlSessionLockSurface {
      Rectangle {
        id: background
        anchors.fill: parent
        color: Theme.overlay
        opacity: 1
      Rectangle {
        width: 300
        height: 300
        anchors.centerIn: parent
        color: "blue"
        TextField {
          text: "unlock"
        }
        IconButton {
          anchors.fill: parent
          icon: "Lock_Open_Right"
          onClicked: {
            lock.locked = false
            screenLocked = false
          }
        }
      }
    }
    }
  }
}
