pragma Singleton
import Quickshell.Services.Pipewire
import Quickshell
import QtQuick

Singleton {
    id: root

    property var audioTracker: PwObjectTracker {
        objects: [Pipewire.defaultAudioSink]
    }

    property var sink: null

    // When component starts, check if PipeWire is already ready
    Component.onCompleted: {
        if (Pipewire.ready && Pipewire.defaultAudioSink)
            root.sink = Pipewire.defaultAudioSink.audio;
    }

    // React when PipeWire becomes ready (after login delay)
    Connections {
        target: Pipewire
        function onReadyChanged() {
            if (Pipewire.ready && Pipewire.defaultAudioSink)
                root.sink = Pipewire.defaultAudioSink.audio;
        }
    }

    // Also track when default sink changes
    Connections {
        target: Pipewire
        function onDefaultAudioSinkChanged() {
            if (Pipewire.ready && Pipewire.defaultAudioSink)
                root.sink = Pipewire.defaultAudioSink.audio;
            else
                root.sink = null;
        }
    }

    readonly property string text: {
        if (sink) {
            if (sink.muted) {
                return "  " + Math.trunc(sink.volume * 100) + "%";
            } else
                return "󰕾  " + Math.trunc(sink.volume * 100) + "%";
        }
        return "No Sink!";
    }
}
