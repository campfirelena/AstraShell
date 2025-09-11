pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
  id: root
  property string time: Qt.formatDateTime(clock.date, "hh:mm")
  property string date: Qt.formatDateTime(clock.date, "d MMMM yyyy")
  property int width: 100

  SystemClock {
    id: clock
    precision: SystemClock.Minutes
  }
}
