import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

Rectangle {
    id: initPage
    color: "#2a2a2a"
    Layout.fillHeight: true
    Layout.fillWidth: true
    Layout.margins: 20

    Text {
        text: "config"
        color: "white"
        font.pixelSize: 20
        anchors.centerIn: parent
    }
}