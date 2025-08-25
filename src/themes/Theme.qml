pragma Singleton
import QtQuick 2.15

QtObject {
    id: theme
    
    // 기본 색상 팔레트
    readonly property color primary: "#1a1a1a"      // 메인 배경색
    readonly property color secondary: "#2a2a2a"    // 패널 배경색
    readonly property color tertiary: "#3a3a3a"     // 카드 배경색
    
    // 상태 색상
    readonly property color success: "#4CAF50"      // 성공/정상 (초록색)
    readonly property color warning: "#FF9800"      // 경고     (주황색)
    readonly property color error: "#f44336"        // 오류/위험 (빨간색)
    readonly property color info: "#2196F3"         // 정보     (파란색)
    
    // 텍스트 색상
    readonly property color textPrimary: "white"     // 주요 텍스트
    readonly property color textSecondary: "#999999" // 보조 텍스트
    readonly property color textMuted: "#666666"     // 흐린 텍스트
    
    // 테두리 및 구분선
    readonly property color border: "#555555"       // 테두리 색상
    readonly property color divider: "#444444"      // 구분선 색상
} 