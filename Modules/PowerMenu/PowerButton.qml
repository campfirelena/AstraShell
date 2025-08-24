import Quickshell
            PowerMenu {
              id:powerMenu
              MenuButton {
                command: "loginctl lock-session"
                icon: "Lock"
                text: "Lock"
              }
              MenuButton {
                command: "loginctl terminate-user $USER"
                icon: "Lock"
                text: "Logout"
              }
              MenuButton {
                command: "loginctl suspend"
                icon: "Lock"
                text: "Suspend"
              }
              MenuButton {
                command: "loginctl hibernate"
                icon: "Lock"
                text: "Hibernate"
              }
              MenuButton {
                command: "loginctl poweroff"
                icon: "Lock"
                text: "Power Off"
              }
              MenuButton {
                command: "loginctl reboot"
                icon: "Lock"
                text: "Reboot"
              }
            }
