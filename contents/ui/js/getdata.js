function apicall(callback) {
    let url = 'https://api.carbonintensity.org.uk/generation/';

     let req = new XMLHttpRequest();
     req.open("GET", url, true);

     req.onreadystatechange = function () {
         if (req.readyState === 4) {
             if (req.status === 200) {
                 let response = JSON.parse(req.responseText);
                 let date = response.data.from;
                 let windpercent = response.data.generationmix.filter(x => x.fuel == "wind")[0].perc;                 
                 //let full = temperaturaActual + " " + tempMin + " " + tempMax + " " + codeCurrentWeather + " " + propabilityPrecipitationCurrent + " " + windSpeed + " " + propabilityUVindex + " " + isday
                 console.log(`all data receved is: ${req.responseText}`);
                 console.log('date grabbed is: ' + date);
                 console.log(windpercent);
                 callback(windpercent);
                 //return req.responseText;
             } else {
                 console.error(`Error en la solicitud: weathergeneral ${req.status}`);
                 //callback(`failed ${req.status}`)
             }
         }
     };

     req.send();
 }