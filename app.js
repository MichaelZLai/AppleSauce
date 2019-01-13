'use strict';

const request = require('request');
var express = require('express');
var app = express();


// Replace <Subscription Key> with your valid subscription key.
const subscriptionKey = 'dc565dfb55344704879376ec526d78a3';

// You must use the same location in your REST call as you used to get your
// subscription keys. For example, if you got your subscription keys from
// westus, replace "westcentralus" in the URL below with "westus".
const uriBase =
    'https://westus.api.cognitive.microsoft.com/vision/v2.0/analyze';

const imageUrl =
    'http://upload.wikimedia.org/wikipedia/commons/3/3c/Shaki_waterfall.jpg';

// Request parameters.
const params = {
    'visualFeatures': 'Categories,Description,Color',
    'details': '',
    'language': 'en'
};

const options = {
    uri: uriBase,
    qs: params,
    body: '{"url": ' + '"' + imageUrl + '"}',
    headers: {
        'Content-Type': 'application/json',
        'Ocp-Apim-Subscription-Key' : subscriptionKey
    }
};

request.post(options, (error, response, body) => {
  if (error) {
    console.log('Error: ', error);
    return;
  }
  let jsonResponse = JSON.stringify(JSON.parse(body), null, '  ');
  console.log('JSON Response\n');
  console.log(jsonResponse);
});


app.get('/', function (req, res) {
  res.send('hello world');
});

// app.post('/upload', function (req, res) {
//
//     var form = new formidable.IncomingForm();
//     //console.log(form);
//     //console.log(req._readableState);
//     //console.log(req.body);
//     form.parse(req, function(err, fields, files) {
//         res.end('success');
//     });
//     form.on('end', function(fields, files) {
//          var temp_path = this.openedFiles[0].path;
//          //console.log(temp_path);
//          var file_name = this.openedFiles[0].name;
//          var new_location = path.dirname(require.main.filename) + "/uploads/fullsize/";
//          fs.copy(temp_path, new_location + file_name, function(err) {
//             if (err) {
//                  console.error(err);
//             } else {
//                    console.log("success!");
//             }
//         });
//     });
// });
