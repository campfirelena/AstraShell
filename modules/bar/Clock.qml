import Quickshell
import QtQuick
import qs.settings
import qs.components

Rectangle {
  id: clock

  property var screen: (typeof modelData !== 'undefined' ? modelData : null)
  property bool popupVisible: false
  property int delay: 200

  implicitWidth: timeText.paintedWidth + 2
  implicitHeight: timeText.paintedHeight + 2

  color: "transparent"

  Text {
    id: timeText
    anchors.centerIn: parent
    text: Time.time
    color: "white"
    font.family: Theme.fontFamily
    font.weight: Font.Bold
  }

  MouseArea {
    id: launcherMouseArea
    anchors.fill: parent
    anchors.centerIn: parent
    hoverEnabled: true
    cursorShape: Qt.PointingHandCursor
    acceptedButtons: Qt.LeftButton
    onEntered: delayTimer.start()
    onExited: popupVisible = false
    onClicked: function() {
      calendar.visible = !calendar.visible
    }
  }

  Calendar {
    id: calendar
    screen: clock.screen
  }

  Timer {
    id: delayTimer
    running: false
    repeat: false
    interval: clock.delay
    onTriggered: if (launcherMouseArea.containsMouse) { popupVisible = true }
  }

  PopupWindow {
    id: date
    visible: popupVisible && !calendar.visible 

    anchor.item: parent
    anchor.rect.x: timeText.width / 2 - width / 2
    anchor.rect.y: 30

    implicitWidth: popupBackground.width
    implicitHeight: popupBackground.height

    color: "transparent"


    Rectangle {
      id: popupBackground
      color: Theme.backgroundPrimary
      radius: 15
      border.color: Theme.outline
      border.width: 1
      width: dateText.width + 40
      height: dateText.height + 30
      anchors.centerIn: parent

      Text {
        id: dateText
        text: Time.date
        anchors.centerIn: parent
        color: Theme.textPrimary
        width: Time.width
        height: 10
      }
      MouseArea {
        anchors.fill: parent
      }
    }
  }
}
