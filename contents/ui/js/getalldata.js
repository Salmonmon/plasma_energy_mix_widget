function getfullmixjson(callback) {
    let url = 'https://api.carbonintensity.org.uk/generation/';

     let req = new XMLHttpRequest();
     req.open("GET", url, true);

     req.onreadystatechange = function () {
         if (req.readyState === 4) {
             if (req.status === 200) {
                 let response = JSON.parse(req.responseText);
                 callback(response);
             } else {
                 console.error(`Error en la solicitud: weathergeneral ${req.status}`);
                 //callback(`failed ${req.status}`)
             }
         }
     };

     req.send();
 }