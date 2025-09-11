//@ Pragma UseQApplication

import Quickshell
import Quickshell.Io
import QtQuick
import QtCore
import qs.modules

Scope {
  id: root
  Bar {
    id: bar
    shell: root
  }
}
