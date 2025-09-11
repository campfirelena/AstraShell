import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.modules.bar
import qs.settings

Scope {
  id: rootScope

  property var shell
  property alias visible: barRootItem.visible

  Item {
    id: barRootItem

    anchors.fill: parent

    Variants {
      model: Quickshell.screens

      Item {
        property var modelData

        PanelWindow {
          id: panel

          screen: modelData
          color: "transparent"
          implicitHeight: wrapper.height
          anchors {
            top: true
            left: true
            right: true
          }

          margins {
            top: 10
            left: 10
            right: 10
          }

          Item {
            id: wrapper

            width: parent.width
            height: 40
            anchors.top: parent.top
            anchors.left: parent.left

          }

          Rectangle {
            id: launcherWrapper
            anchors.verticalCenter: wrapper.verticalCenter
            anchors.left: wrapper.left
            color: "transparent"
            width: 40
            height: parent.height
            Launcher {
              anchors.top: parent.top
              anchors.left: parent.left
            }
          }

          Rectangle {
            id: leftWidgetsBackground
            width: 200
            height: parent.height
            anchors.verticalCenter: wrapper.verticalCenter
            anchors.left: wrapper.left
            anchors.leftMargin: 64

            color: Theme.backgroundPrimary
            border.color: Theme.outline
            border.width: 2
            radius: 8
            visible: false

            Row {
              anchors.verticalCenter: parent.verticalCenter
              anchors.left: parent.left
              id: leftWidgetsRow
              anchors.leftMargin: 8
              spacing: 12

            }
          }
          Workspaces {
            id: workspaces

            screen: modelData

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
          }

          Rectangle {
            id: rightWidgetsBackground
            width: clock.width + systemTrayModule.width + 36
            height: parent.height

            anchors.verticalCenter: wrapper.verticalCenter
            anchors.right: wrapper.right

            color: Theme.backgroundPrimary
            border.color: Theme.outline
            border.width: 2
            radius: 8

            Row {
              id: rightWidgetsRow
              anchors.verticalCenter: parent.verticalCenter
              anchors.right: parent.right
              anchors.rightMargin: 16
              spacing: 12

              SystemTray {
                id: systemTrayModule

                shell: rootScope.shell
                anchors.verticalCenter: parent.verticalCenter
                bar: panel
                trayMenu: externalTrayMenu
              }
              CustomTrayMenu {
                id: externalTrayMenu
              }
              Clock {
                id: clock
                screen: modelData
                anchors.verticalCenter: parent.verticalCenter
              }
            }
          }
        }
      }
    }
  }
}
