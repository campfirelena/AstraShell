pragma Singleton

import Quickshell
import QtQuick
import qs

Singleton {
  id: root


  // Global config options
  readonly property string symbolsFont: "Material Symbols Outlined"
  property string colourScheme: "default"
  property bool darkMode: true
  property string barLeft: "example"
  property string barMid: "example"
  property string barRight: "example"
}
