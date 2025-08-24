//@ Pragma UseQApplication

import Quickshell
import Quickshell.Io
import QtQuick
import QtCore
import qs.Modules

Scope {
  id: root
  Bar {
    id: bar
    shell: root
  }
}
