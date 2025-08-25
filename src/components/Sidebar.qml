import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15


Rectangle {
    id: sidebar
    color: "#2a2a2a"

    signal pageSelected(string pageName)
    
    property var menuItems: [
        { name: "SETUP", page: "SETUP", icon: "../assets/icons/sidebar/usb.svg" },
        { name: "PLAN", page: "PLAN", icon: "../assets/icons/sidebar/map.svg" },
        { name: "FLIGHT", page: "FLIGHT", icon: "../assets/icons/sidebar/flight.svg" },
        { name: "CONFIG", page: "CONFIG", icon: "../assets/icons/sidebar/settings.svg" },
    ]
    property string selectedPage: "FLIGHT"
    

    ColumnLayout {
        anchors.fill: parent
        spacing: 15

        // 상단 로고
        Image {
            source: "../assets/logo.png"
            Layout.fillWidth: true
            Layout.preferredHeight: 100
            fillMode: Image.PreserveAspectFit
            Layout.alignment: Qt.AlignHCenter
        }

        // 메뉴 버튼들
        Repeater {
            id: menuRepeater
            model: sidebar.menuItems
            
            delegate: Rectangle {
                id: menuItem
                required property var modelData
                
                Layout.preferredWidth: 40
                Layout.preferredHeight: 40
                Layout.alignment: Qt.AlignHCenter
                radius: 8
                color: sidebar.selectedPage === menuItem.modelData.page ? "#1a1a1a" : "#2a2a2a"
                
                function updateColor() {
                    if (sidebar.selectedPage === menuItem.modelData.page) {
                        color = "#1a1a1a"
                    } else {
                        color = "#2a2a2a"
                    }
                }
                
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    
                    onClicked: {
                        sidebar.selectedPage = menuItem.modelData.page
                        sidebar.pageSelected(menuItem.modelData.page)
                        
                        // 도크 영역 토글
                        dockManager.toggle_dock_area(menuItem.modelData.page)
                        
                        // 모든 메뉴 아이템의 색상을 강제로 업데이트
                        for (let i = 0; i < menuRepeater.count; i++) {
                            menuRepeater.itemAt(i).updateColor()
                        }
                    }
                    
                    onEntered: {
                        // Python 툴팁 매니저 호출 - 전역 좌표 계산
                        var globalPos = menuItem.mapToGlobal(menuItem.width + 10, menuItem.height / 2 - 30)
                        tooltipManager.show_tooltip(menuItem.modelData.name, globalPos.x, globalPos.y)

                        if (sidebar.selectedPage === menuItem.modelData.page) {
                            return
                        } 
                        menuItem.color = "#3a3a3a"
                    }
                    onExited: {
                        if (sidebar.selectedPage === menuItem.modelData.page) {
                            menuItem.color = "#1a1a1a"
                        } else {
                            menuItem.color = "#2a2a2a"
                        }
                        tooltipManager.hide_tooltip()
                    }
                }

                Image {
                    source: menuItem.modelData.icon
                    Layout.preferredWidth: 20
                    Layout.preferredHeight: 20
                    anchors.centerIn: parent
                    fillMode: Image.PreserveAspectFit
                }
            }
        }
         
        // 여백
        Item {
            Layout.fillHeight: true
        }
    }
}