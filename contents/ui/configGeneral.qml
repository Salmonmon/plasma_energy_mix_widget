import QtQuick
import QtQuick.Controls as QQC2
import org.kde.kirigami as Kirigami
import org.kde.kquickcontrols 2.0 as KQControls

import org.kde.kcmutils as KCM

//import QtQuick.Dialogs
//import QtQuick.Layouts
KCM.SimpleKCM{
    property alias cfg_updateInterval: updateInterval.value
    property alias cfg_chartLabelPositions: chartLabelPositions.currentValue
    property alias cfg_smallPieThickness: smallPieThickness.value
    property alias cfg_smallPieFilled: smallPieFilled.checked
    property alias cfg_smallPieSmoothEnds: smallPieSmoothEnds.checked

    Kirigami.FormLayout {
        id: page

        Kirigami.Heading {
            text: "Technichal Options"
            level: 2
        }
        QQC2.SpinBox {
            id: updateInterval
            stepSize: 5
            from: 5.0
    	    to: 1000.0
            Kirigami.FormData.label: i18n("Update interval (minuites):")
        }

        Kirigami.Heading {
            text: "Compact View Options"
            level: 2
        }

        QQC2.CheckBox {
        id: smallPieFilled
        Kirigami.FormData.label: i18n("Hollow pie:")
        checked: plasmoid.configuration.smallPieFilled
        }
        QQC2.SpinBox {
            id: smallPieThickness
            stepSize: 1        
            Kirigami.FormData.label: i18n("Pie thickness:")
            enabled: cfg_smallPieFilled
        }
        QQC2.CheckBox {
        id: smallPieSmoothEnds
        Kirigami.FormData.label: i18n("Compact pie slice end smoothing:")
        checked: plasmoid.configuration.smallPieSmoothEnds
        enabled: cfg_smallPieFilled
        }

        Kirigami.Heading {
            text: "Expanded View Options"
            level: 2
        }

        QQC2.ComboBox {
        id: chartLabelPositions
        textRole: "text"
        valueRole: "value"
        Kirigami.FormData.label: i18n("Pie chart label position:")
        Component.onCompleted: currentIndex = indexOfValue(plasmoid.configuration.chartLabelPositions)
        model: [
            { value: "LabelOutside", text: i18n("Outside") },
            { value: "LabelInsideHorizontal", text: i18n("Horozontal") },
            { value: "LabelInsideNormal", text: i18n("Radial") },
            ]
        }
    }
}

