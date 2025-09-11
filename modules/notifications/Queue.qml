import Quickshell
import Quickshell.Wayland
import Quickshell.Services.Notifications
import qs.settings

PanelWindow {
  id: root

  property bool visible: false

  anchors.top: true
  anchors.left: true
  anchors.right: true
  anchors.bottom: true

  color: visible ? "transparent" : Theme.overlay

  MouseArea {
    onClicked: root.visible = false
  }

}
