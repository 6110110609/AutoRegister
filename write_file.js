var request = require('request');
var fs = require('fs');
var options = {
  'method': 'GET',
  'url': 'https://asia-east2-asean-ivo.cloudfunctions.net/api/raspberry-pi/rsanode',
  'headers': {
}
};
request(options, function (error, response) {
  if (error) throw new Error(error);
  var result = response.body;
  var obj = JSON.parse(result);
  var date = new Date();
  var date_string = date.toISOString().slice(0, 10);
  var namefile_add =  'history/get-add-firebase.txt'
  var namefile_update =  'history/get-update-firebase.txt'

  obj['add'].forEach(element => {
    console.log('add: ' + element['name'])
    var content = element['name'] + '\n' + element['rsa'] + '\n';
    fs.appendFile(namefile_add, content, function (err) {
        if (err) throw err;
      });
  });

  obj['update'].forEach(element => {
    console.log('update: ' + element['name'])
    var content = element['name'] + '\n' + element['rsa'] + '\n';
    fs.appendFile(namefile_update, content, function (err) {
        if (err) throw err;
      });
  });
  
});
