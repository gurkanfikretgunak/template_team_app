const { Console } = require('console');
const express = require('express');
const app = express();
const http = require('http');
const server = http.createServer(app);
const https = require('https');
const { Server } = require("socket.io");
const io = new Server(server);




    const sendNotification = (data) => {
        var headers = {
            "Content-Type": "application/json; charset=utf-8",
            Authorization: "Bearer token =" + "YmM1YjRhNjMtMWRjNi00ODE2LTliYTMtMzU3ZGE5MGQwNjdm"
        };
        var options = {
            host: "onesignal.com",
            port: 443,
            path: "/api/v1/notifications",
            method: "POST",
            headers: headers
        };
        var req = https.request(options, function(res) {
            res.on('data', function(data) {
           
            });
        });
        req.on('error', function(e) {
           console.log("ERROR:");
             console.log(e);
        });
        req.write(JSON.stringify(data));
        req.end();
    }   

    io.on("connection", (socket) => {
            socket.on("notification", ({sender, receiver, type, message}) => {    
            const user = getUser(receiver);
            const offlineNotification = {
                contents: {en: "test"},
                included_segments:["Subscribed Users"],
                data:{
                    "foo":"bar"
                },
                app_id: "6aa7ad16-6b4a-4de7-a707-9f9f9a883dee",
            };
            sendNotification(offlineNotification);
      });
    });


server.listen(5000, () => {
    console.log('listening on *:5000');
});