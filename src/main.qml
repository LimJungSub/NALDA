import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.15
import QtLocation 5.15
import QtPositioning 5.15

import "./components" as Components


Rectangle {
    id: mainWindow
    anchors.fill: parent
    color: "#1a1a1a"
    
    // Material 테마 설정
    Material.theme: Material.Dark
    Material.accent: Material.Blue
    
    // 페이지 매핑을 한 곳에서 관리
    readonly property var pageMap: ({
        "SETUP": "pages/setup/index.qml",
        "PLAN": "pages/plan/index.qml",
        "FLIGHT": "pages/flight/index.qml",
        "CONFIG": "pages/config/index.qml"
    })
    property string currentPage: "FLIGHT"
    

    // 메인 레이아웃
    RowLayout {
        anchors.fill: parent

        // 왼쪽 사이드바
        Components.Sidebar {
            Layout.fillHeight: true
            Layout.preferredWidth: 60

            onPageSelected: function(pageName) {
                mainWindow.currentPage = pageName
            }
        }

        // 메인 컨텐츠 영역
        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "#1a1a1a"
            
            Loader {
                id: pageLoader
                anchors.fill: parent
                anchors.margins: 20
                
                source: mainWindow.pageMap[mainWindow.currentPage] || mainWindow.pageMap["FLIGHT"]
            }
        }
    }
}