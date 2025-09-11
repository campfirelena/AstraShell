pragma Singleton
pragma ComponentBehavior: Bound

import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Services.Mpris

Singleton {
  id: root

  property list<MprisPlayer> players: Mpris.players.values
  property MprisPlayer activePlayer: players.find(p => p.isPlaying) ?? players.find(p => p.canControl && p.canPlay) ?? null

  IpcHandler {
    target: "mpris"

    function list(): string {
      return root.players.map(p => p.identity).join("\n")
    }

    function play(): void {
      if (root.activePlayer && root.activePlayer.canPlay) {
        root.activePlayer.play()
      }
    }
    function pause(): void {
      if (root.activePlayer && root.activePlayer.canPause) {
        root.activePlayer.pause()
      }
    }
    function playpause(): void {
      if (root.activePlayer && root.activePlayer.canTogglePlaying) {
        root.activePlayer.togglePlaying()
      }
    }
    function previous(): void {
      if (root.activePlayer && root.activePlayer.canGoPrevious) {
        root.activePlayer.previous()
      }
    }
    function next(): void {
      if (root.activePlayer && root.activePlayer.canGoNext) {
        root.activePlayer.next()
      }
    }
    function stop(): void {
      if (root.activePlayer) {
        root.activePlayer.stop()
      }
    }
  }
}
