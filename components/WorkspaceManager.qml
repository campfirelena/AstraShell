pragma Singleton
pragma ComponentBehavior: Bound

import QtQuick
import Quickshell
import Quickshell.Io
import qs.components

Singleton {
  id: root

  property ListModel workspaces: ListModel {}

  function initNiri() {
    updateNiriWorkspaces();
  }

  Connections {
    target: Niri
    function onWorkspacesChanged() { 
      updateNiriWorkspaces();
    }
  }

  function updateNiriWorkspaces() {
    const niriWorkspaces = Niri.workspaces || [];
    workspaces.clear();
    for (let i = 0; i < niriWorkspaces.length; i++) {
      const ws = niriWorkspaces[i];
      workspaces.append({
        id: ws.id,
        idx: ws.idx || 1,
        name: ws.name || "",
        output: ws.output || "",
        isFocused: ws.isFocused === true,
        isActive: ws.isActive === true,
        isUrgent: ws.isUrgent === true,
        isOccupied: ws.isOccupied === true,
      });
    }

    workspacesChanged();
  }

  function switchToWorkspace(workspaceId) {    
    try {
      Quickshell.execDetached(["niri", "msg", "action", "focus-workspace", workspaceId.toString()]);
    } catch (e) {
      console.error("Error switching Niri workspace:", e);
    }
  }
}
