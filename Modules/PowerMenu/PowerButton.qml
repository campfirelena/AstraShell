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
                icon: "Logout"
                text: "Logout"
              }
              MenuButton {
                command: "loginctl suspend"
                icon: "Pause_Circle"
                text: "Suspend"
              }
              MenuButton {
                command: "loginctl hibernate"
                icon: "Bedtime"
                text: "Hibernate"
              }
              MenuButton {
                command: "loginctl poweroff"
                icon: "Mode_Off_On"
                text: "Power Off"
              }
              MenuButton {
                command: "loginctl reboot"
                icon: "Restart_Alt"
                text: "Reboot"
              }
            }
