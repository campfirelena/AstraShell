import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts
import qs.settings

  PanelWindow {
    id: powerPanel
    
    default property list<MenuButton> buttons
    property bool isOpen: false

    exclusionMode: ExclusionMode.Ignore
    WlrLayershell.layer: WlrLayer.Overlay
    WlrLayershell.keyboardFocus: WlrKeyboardFocus.Exclusive

    contentItem {
      focus: true
      Keys.onPressed: event => {
        if (event.key == Qt.Key_Escape) powerPanel.isOpen = !powerPanel.isOpen;
        else {
          for (let i = 0; i < buttons.length; i++) {
            let button = buttons[i];
            if (event.key == button.keybind) button.exec();
          }
        }
      }
    }

    visible: isOpen
    color: isOpen ? Theme.overlay: "transparent"

    anchors {
      top: true
      left: true
      right: true
      bottom: true
    }
    MouseArea {
      anchors.fill: parent
      onClicked: powerPanel.isOpen = !powerPanel.isOpen
    }

    Rectangle {
      id: background
      anchors.fill: parent
      color: Theme.overlay
      visible: powerPanel.visible

      GridLayout {
        id: grid
        anchors.centerIn: parent
        columns: 3

        width: parent.width * 0.75
        height: parent.height * 0.75

        rowSpacing: 2
        columnSpacing: 2

        Repeater {
          model: buttons
          delegate: Rectangle {
            required property MenuButton modelData;

            Layout.fillWidth: true
            Layout.fillHeight: true

            color: menuButton.containsMouse ? Theme.accentPrimary : Theme.backgroundPrimary
            border.color: Theme.outline
            border.width: 1
            MenuButton {
              id: menuButton
              icon: modelData.icon
              text: modelData.text
              command: modelData.command
              anchors.fill: parent
              onClicked: {
                powerPanel.isOpen = !powerPanel.isOpen
              }
              width: parent.width * 0.5
              height: parent.height * 0.5
            }
          }
        }
      }
    }
  }
