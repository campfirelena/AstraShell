import Quickshell
import Quickshell.Services.Mpris
import QtQuick
import QtQuick.Layouts
import qs.settings

MouseArea {
  id: button
  property real size: 32
  cursorShape: Qt.PointingHandCursor
  implicitWidth: size
  implicitHeight: size
  property bool hovering: false

  readonly property MprisPlayer activePlayer: MprisBackend.activePlayer;

  hoverEnabled: true
  onEntered: hovering = true
  onExited: hovering = false
  onClicked: popup.isOpen = true

  Rectangle {
    anchors.fill: parent
    radius: 8
    color: button.hovering ? Theme.accentPrimary : "transparent"
  }
  Text {
    id: iconText
    anchors.centerIn: parent
    text: "Music_Note"
    font.family: "Material Symbols Outlined"
    font.pixelSize: 24
    color: button.hovering ? Theme.onAccent : Theme.textPrimary
    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter
  }
  PopupWindow {
    id: popup

    anchor.item: parent
    color: "transparent"
    property bool isOpen: false
    visible: popup.isOpen
    width: 300
    height: 350
    anchor.rect.x: 40

    MouseArea {
      anchors.fill: parent
      onClicked: popup.isOpen = false
    }

    Rectangle {
      anchors.fill: parent
      radius: 12
      color: "#111111"

      ColumnLayout {
        anchors.fill: parent
        anchors.horizontalCenter: parent.horizontalCenter

        Rectangle {
          width: 300
          height: 300
          radius: 12
          color: "transparent"
        Image {
          id: albumArt
          source: (activePlayer && activePlayer.trackArtUrl) || ""
          anchors.fill: parent
          anchors.margins: 2
          fillMode: Image.PreserveAspectCrop
        }
      }

        RowLayout {
          Layout.fillWidth: true
          anchors.horizontalCenter: parent.horizontalCenter
          readonly property alias player: button.activePlayer;

          ControlsButton {
            id: shuffle
            icon: activePlayer.ShuffleSupported ? "Shuffle" : "Shuffle_On"
          }
          ControlsButton {
            id: left
            icon: "Skip_Previous"
            onClicked: activePlayer.skipPrev()
          }
          ControlsButton {
            id: play
            icon: activePlayer.isPlaying ? "Resume" : "Pause"
            onClicked: activePlayer.togglePlaying()
          }
          ControlsButton {
            id: right
            icon: "Skip_Next"
          }
          ControlsButton {
            id: loop
            icon: activePlayer.loopState ? "Repeat" : "Repeat_On"
          }
        }
      }
    }
  }
}
