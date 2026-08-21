import Quickshell
import Quickshell.Services.Notifications
import QtQuick
import QtQuick.Layouts

Scope {
    id: root
    NotificationServer {
        id: server
        actionsSupported: true
        bodySupported: true
        imageSupported: true
        onNotification: n => {
            console.log("got:", n.summary, " --- ", n.body)
            n.tracked = true
        }
    }
    PanelWindow {
        anchors { top: true; right: true }
        implicitHeight: Math.max(1, column.implicitHeight)
        color: "transparent"

       exclusionMode: ExclusionMode.Ignore 

   }
}   
