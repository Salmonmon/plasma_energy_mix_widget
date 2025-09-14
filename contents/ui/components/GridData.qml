import QtQuick
import "../js/getalldata.js" as Utils

Item{
    id: root

    property var alldata: JSON.parse('{"data":{"from":"","to":"","generationmix":[{"fuel":"biomass","perc":0},{"fuel":"coal","perc":0},{"fuel":"imports","perc":0},{"fuel":"gas","perc":0},{"fuel":"nuclear","perc":0},{"fuel":"other","perc":0},{"fuel":"hydro","perc":0},{"fuel":"solar","perc":0},{"fuel":"wind","perc":0}]}}')
    property var fromtime: ""
    property int testvalue: 0

    function getalldata(){
        Utils.getfullmixjson(function(result){
        //console.log("the whole output given is ------->" + JSON.stringify(result));
        //console.log(plasmoid.configuration.chartLabelPositions);
        //console.log("and time is ------>" + result.data.from);
        alldata = result;
        fromtime = result.data.from;
        })
    }

    property var testProp: getalldata()
    property var gridJson: alldata

    property var windPerc: alldata.data.generationmix.filter(x => x.fuel == "wind")[0].perc
    property var solarPerc: alldata.data.generationmix.filter(x => x.fuel == "solar")[0].perc
    property var hydroPerc: alldata.data.generationmix.filter(x => x.fuel == "hydro")[0].perc
    property var nuclearPerc: alldata.data.generationmix.filter(x => x.fuel == "nuclear")[0].perc
    property var biomassPerc: alldata.data.generationmix.filter(x => x.fuel == "biomass")[0].perc
    property var importPerc: alldata.data.generationmix.filter(x => x.fuel == "imports")[0].perc
    property var gasPerc: alldata.data.generationmix.filter(x => x.fuel == "gas")[0].perc
    property var coalPerc: alldata.data.generationmix.filter(x => x.fuel == "coal")[0].perc
    property var otherPerc: alldata.data.generationmix.filter(x => x.fuel == "other")[0].perc

    property int updateInterval: plasmoid.configuration.updateInterval * 60000

    Timer {
    id: updateGridData
    interval: updateInterval
    running: true
    repeat: true
    onTriggered: {
      getalldata();
      console.log("reload run");
      console.log(alldata)
    }
  }
}