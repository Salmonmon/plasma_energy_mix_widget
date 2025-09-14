/*
function getFile(myCallback) {
  let req = new XMLHttpRequest();
  req.onload = function() {
    if (req.status == 200) {
		//let returnedjson = JSON.parse(this.responseText);
		//let date = returnedjson.data.from;
		//return date;
        let returnedjson = this.responseText;
		resolve(returnedjson);
		

    } else {
      reject("Error: " + req.status);
    }
  }
  req.open('GET', 'https://api.carbonintensity.org.uk/generation/');
  req.send();
};
*/

function getFile() {
    return new Promise(function(resolve, reject) {
        let req = new XMLHttpRequest();
        req.onload = function() {
            if (req.status == 200) {
		        //let returnedjson = JSON.parse(this.responseText);
		        //let date = returnedjson.data.from;
		        //return date;
                let returnedjson = this.responseText;
		        resolve(returnedjson);
            } else {
                reject("Error: " + req.status);
            }
        }
        req.open('GET', 'https://api.carbonintensity.org.uk/generation/');
        req.send();
    }
)
};

function testfunction(n){
    return n + "valls!";
}
//export {getFile};