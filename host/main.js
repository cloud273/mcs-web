'use strict';

const express = require('express'),
    app = express(),
    http = require('http'),
    Path = require('path');

app.use("", express.static( Path.join(__dirname, 'root')));

http.createServer(app).listen(3001)

console.log("listen http at port 3001")
