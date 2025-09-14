import QtQuick 
import QtQuick.Window 
import QtCharts

import org.kde.kirigami as Kirigami
import org.kde.plasma.plasmoid
import org.kde.plasma.core as PlasmaCore
//import org.kde.plasma.plasma5support as Plasma5Support

import org.kde.quickcharts as Charts
import QtQuick.Controls

import "components" as Components

import "js/getalldata.js" as Utils

PlasmoidItem {
    id: widget
    //visible: true
    //title: qsTr("JSON → Pie Chart")

    preferredRepresentation: compactRepresentation
  
    Plasmoid.contextualActions: [
        PlasmaCore.Action {
            id: clipboardAction
            text: i18n("Copy to Clipboard")
            icon.name: "edit-copy"
        }
    ]
    
    Components.GridData {
        id: gridData
    }

    property color textColour: {if (plasmoid.configuration.useDefaultTextColour) {PlasmaCore.Theme.viewTextColor} else {plasmoid.configuration.customTextColour}}

    property var minimumPercentLabeled: 0.5

    property bool showwind: {if (gridData.windPerc >= minimumPercentLabeled) {true} else {false}}
    property bool showsolar: {if (gridData.solarPerc >= minimumPercentLabeled) {true} else {false}}
    property bool showhydro: {if (gridData.hydroPerc >= minimumPercentLabeled) {true} else {false}}
    property bool shownuclear: {if (gridData.nuclearPerc >= minimumPercentLabeled) {true} else {false}}
    property bool showbiomass: {if (gridData.biomassPerc >= minimumPercentLabeled) {true} else {false}}
    property bool showimport: {if (gridData.importPerc >= minimumPercentLabeled) {true} else {false}}
    property bool showgas: {if (gridData.gasPerc >= minimumPercentLabeled) {true} else {false}}
    property bool showcoal: {if (gridData.coalPerc >= minimumPercentLabeled) {true} else {false}}
    property bool showother: {if (gridData.otherPerc >= minimumPercentLabeled) {true} else {false}}

    fullRepresentation: Item {
        width: 600
        height: 500
        Text {
            text: gridData.gridJson.data.from
            color: PlasmaCore.Theme.viewTextColor
        }
    
        ChartView {
            id: chart
            title: "Uk Energy mix"
            titleColor: textColour
            anchors.fill: parent
            legend.visible: false
            antialiasing: true   
            backgroundColor: "transparent"

            property variant othersSlice: 0

            PieSeries {
                id: pieSeries
                
                PieSlice { label: "Wind: " + gridData.windPerc + "%"; value: gridData.windPerc; color: plasmoid.configuration.windColour; labelVisible: showwind; labelColor: textColour; labelPosition: plasmoid.configuration.chartLabelPositions; exploded: false; onClicked: (exploded = !exploded)}
                PieSlice { label: "Solar: " + gridData.solarPerc + "%"; value: gridData.solarPerc; color: plasmoid.configuration.solarColour; labelVisible: showsolar; labelColor: textColour; labelPosition: plasmoid.configuration.chartLabelPositions; exploded: false; onClicked: (exploded = !exploded)}
                PieSlice { label: "Hydroelectric: " + gridData.hydroPerc + "%"; value: gridData.hydroPerc; color: plasmoid.configuration.hydroColour; labelVisible: showhydro; labelColor: textColour; labelPosition: plasmoid.configuration.chartLabelPositions; exploded: false; onClicked: (exploded = !exploded)}
                PieSlice { label: "Nuclear: " + gridData.nuclearPerc + "%"; value: gridData.nuclearPerc; color: plasmoid.configuration.nuclearColour; labelVisible: shownuclear; labelColor: textColour; labelPosition: plasmoid.configuration.chartLabelPositions; exploded: false; onClicked: (exploded = !exploded)}
                PieSlice { label: "Biomass: " + gridData.biomassPerc + "%"; value: gridData.biomassPerc; color: plasmoid.configuration.biomassColour; labelVisible: showbiomass; labelColor: textColour; labelPosition: plasmoid.configuration.chartLabelPositions; exploded: false; onClicked: (exploded = !exploded)}
                PieSlice { label: "Imports: " + gridData.importPerc + "%"; value: gridData.importPerc; color: plasmoid.configuration.importColour; labelVisible: showimport; labelColor: textColour; labelPosition: plasmoid.configuration.chartLabelPositions; exploded: false; onClicked: (exploded = !exploded)}
                PieSlice { label: "Gas: " + gridData.gasPerc + "%"; value: gridData.gasPerc; color: plasmoid.configuration.gasColour; labelVisible: showgas; labelColor: textColour; labelPosition: plasmoid.configuration.chartLabelPositions; exploded: false; onClicked: (exploded = !exploded)}
                PieSlice { label: "Coal: " + gridData.coalPerc + "%"; value: gridData.coalPerc; color: plasmoid.configuration.coalColour; labelVisible: showcoal; labelColor: textColour; labelPosition: plasmoid.configuration.chartLabelPositions; exploded: false; onClicked: (exploded = !exploded)}
                PieSlice { label: "Other: " + gridData.otherPerc + "%"; value: gridData.otherPerc; color: plasmoid.configuration.otherColour; labelVisible: showother; labelColor: textColour; labelPosition: plasmoid.configuration.chartLabelPositions; exploded: false; onClicked: (exploded = !exploded)}
                }
            Component.onCompleted: {
                // You can also manipulate slices dynamically, like append a slice or set a slice exploded
                //pieSeries.find("Wind").exploded = true;
                //pieSeries.find(value == 0).labelVisible = false;

            }
        }
    }

    compactRepresentation: Item {
        //anchors.rightMargin: 1
        //anchors.leftMargin: 1
        Charts.PieChart {
            id: piechartroot
            //width: 400
            //height: 300
            anchors.fill: parent
            filled: !plasmoid.configuration.smallPieFilled
            smoothEnds: (plasmoid.configuration.smallPieSmoothEnds && plasmoid.configuration.smallPieFilled)
            thickness: plasmoid.configuration.smallPieThickness

            MouseArea {
                id: compactMouseArea
                anchors.fill: parent
                hoverEnabled: true
                onClicked: widget.expanded = !widget.expanded
            }
            
            valueSources: Charts.ModelSource {
                id: pieTest
                roleName: "data";
                   
                model: ListModel {
                    id: pieModel
                    //dynamicRoles: true
                    ListElement { data: 0 }
                    ListElement { data: 0 }
                    ListElement { data: 0 }
                    ListElement { data: 0 }
                    ListElement { data: 0 }
                    ListElement { data: 0 }
                    ListElement { data: 0 }
                    ListElement { data: 0 }
                    ListElement { data: 0 }
                }
                //Component.onCompleted: windgettest()
                
                }

            colorSource: Charts.ArraySource { array: [plasmoid.configuration.windColour,
                                                    plasmoid.configuration.solarColour,
                                                    plasmoid.configuration.hydroColour,
                                                    plasmoid.configuration.nuclearColour,
                                                    plasmoid.configuration.biomassColour,
                                                    plasmoid.configuration.importColour,
                                                    plasmoid.configuration.gasColour,
                                                    plasmoid.configuration.coalColour,
                                                    plasmoid.configuration.otherColour] }
            nameSource: Charts.ArraySource { array: ["Wind",
                                                     "Solar",
                                                     "Hydroelectric",
                                                     "Nuclear",
                                                     "Biomass",
                                                     "Imports",
                                                     "Gas",
                                                     "Coal",
                                                     "Other"] }
            
            
        }
        Component.onCompleted: windgettest()
        
        function windgettest() {
                    function setSlice(pos, data) {
                        //console.log("setting position " + pos + " to " + data);
                        pieModel.set( pos, {"data": data})
                    }
                    setSlice(0, gridData.windPerc)
                    setSlice(1, gridData.solarPerc)
                    setSlice(2, gridData.hydroPerc)
                    setSlice(3, gridData.nuclearPerc)
                    setSlice(4, gridData.biomassPerc)
                    setSlice(5, gridData.importPerc)
                    setSlice(6, gridData.gasPerc)
                    setSlice(7, gridData.coalPerc)
                    setSlice(8, gridData.otherPerc)
                    //console.log("wind percent in pie is: " + gridData.windPerc);
                    //pieModel.set( 0, {"data": gridData.windPerc} );
                }
        property int updateInterval: plasmoid.configuration.updateInterval * 60000
        Timer {
                    id: updateGridData
                    interval: updateInterval
                    triggeredOnStart: true
                    running: true
                    repeat: true
                    onTriggered: {
                      windgettest();
                      //console.log("reload run");
                    }
                  }
    }

}
