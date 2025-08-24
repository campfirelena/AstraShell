import QtQuick
import Quickshell
import Quickshell.Widgets
import Quickshell.Io
import qs.Settings

MouseArea {
    id: button
    property string icon
    property string text
    property bool enabled: true
    property bool hovering: false
    property string command
    cursorShape: Qt.PointingHandCursor
    onClicked: {
      process.startDetached()
    }

    hoverEnabled: true
    onEntered: hovering = true
    onExited: hovering = false

    Text {
      id: iconText
      anchors.centerIn: parent
      text: button.icon
      font.family: "Material Symbols Outlined"
      font.pixelSize: 200 * Theme.scale(screen)
      color: button.hovering ? Theme.onAccent : Theme.textPrimary
      horizontalAlignment: Text.AlignHCenter
      verticalAlignment: Text.AlignVCenter
      opacity: button.enabled ? 1.0 : 0.5
    }
    Text {
      id: underText
      anchors.top: iconText.bottom
      anchors.topMargin: 20
      anchors.horizontalCenter: iconText.horizontalCenter
      text: button.text
      font.family: "Iosevka Comfy"
      font.pixelSize: 24
      color: button.hovering ? Theme.onAccent : Theme.textPrimary
    }

    readonly property var process: Process {
      command: ["sh","-c", button.command]
    }
}
