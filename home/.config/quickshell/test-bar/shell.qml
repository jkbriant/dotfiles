import Quickshell
import QtQuick
import QtQuick.Layouts

PanelWindow {
    id: root

    // Theme
    property color colBg: '#5ba11e'
    property color colFg: "#a9b1d6"
    property color colMuted: "#444b6a"
    property color colCyan: "#0db9d7"
    property color colBlue: "#7aa2f7"
    property color colYellow: "#e0af68"
    property string fontFamily: "JetBrainsMono Nerd Font"
    property int fontSize: 14

    // System data
    property int cpuUsage: 0
    property int memUsage: 0
    property var lastCpuIdle: 0
    property var lastCpuTotal: 0

    // Processes and timers here...

    anchors.top: true
    anchors.left: true
    anchors.right: true
    implicitHeight: 30
    color: root.colBg

    RowLayout {
        anchors.fill: parent
        spacing: 8

        

        Item { Layout.fillWidth: true }

        // CPU
        Text {
            text: "CPU: " + cpuUsage + "%"
            color: root.colYellow
            font { family: root.fontFamily; pixelSize: root.fontSize; bold: true }
        }

        Rectangle { width: 1; height: 16; color: root.colMuted }

        // Memory
        Text {
            text: "Mem: " + memUsage + "%"
            color: root.colCyan
            font { family: root.fontFamily; pixelSize: root.fontSize; bold: true }
        }

        Rectangle { width: 1; height: 16; color: root.colMuted }

        // Clock
        Text {
            id: clock
            color: root.colBlue
            font { family: root.fontFamily; pixelSize: root.fontSize; bold: true }
            text: Qt.formatDateTime(new Date(), "ddd, MMM dd - HH:mm")
            Timer {
                interval: 1000
                running: true
                repeat: true
                onTriggered: clock.text = Qt.formatDateTime(new Date(), "ddd, MMM dd - HH:mm:ss")
            }
        }

        Item { Layout.fillWidth: true }

    }
}