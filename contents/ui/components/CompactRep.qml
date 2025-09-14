import QtQuick 
import QtQuick.Window 
import QtCharts

import org.kde.kirigami as Kirigami
import org.kde.plasma.plasmoid
import org.kde.plasma.core as PlasmaCore

Item {
    id: smallPie
        ChartView {
            id: chart
            anchors.fill: parent
            legend.visible: false
            antialiasing: true   
            backgroundColor: "transparent"
            animationOptions: ChartView.NoAnimation
            backgroundRoundness: 0
            margins.top: 0
            margins.bottom: 0
            margins.left: 0
            margins.right: 0
            
            MouseArea {
                id: compactMouseArea
                anchors.fill: parent
                hoverEnabled: true
                onClicked: widget.expanded = !widget.expanded
            }

            

            PieSeries {
                id: pieSeries
                size: 0.9
                PieSlice { label: "Wind"; value: gridData.windPerc; color: plasmoid.configuration.windColour; borderWidth: 1}
                PieSlice { label: "Solar"; value: gridData.solarPerc; color: plasmoid.configuration.solarColour; borderWidth: 1}
                PieSlice { label: "Hydroelectric"; value: gridData.hydroPerc; color: plasmoid.configuration.hydroColour; borderWidth: 1}
                PieSlice { label: "Nuclear"; value: gridData.nuclearPerc; color: plasmoid.configuration.nuclearColour; borderWidth: 1}
                PieSlice { label: "Biomass"; value: gridData.biomassPerc; color: plasmoid.configuration.biomassColour; borderWidth: 1}
                PieSlice { label: "Imports"; value: gridData.importPerc; color: plasmoid.configuration.importColour; borderWidth: 1}
                PieSlice { label: "Gas"; value: gridData.gasPerc; color: plasmoid.configuration.gasColour; borderWidth: 1}
                PieSlice { label: "Coal"; value: gridData.coalPerc; color: plasmoid.configuration.coalColour; borderWidth: 1}
                PieSlice { label: "Other"; value: gridData.otherPerc; color: plasmoid.configuration.otherColour; borderWidth: 1}
                }
        }
    }