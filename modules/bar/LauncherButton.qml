import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import Quickshell.Widgets
import Quickshell.Wayland
import qs.components
import qs.settings
import qs.modules.launcher

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
        launcher.visible = !launcher.visible
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
  LauncherWindow {
    id: launcher
  }
}
