const { Console } = require('console');
const express = require('express');
const app = express();
const http = require('http');
const server = http.createServer(app);
const https = require('https');
const { Server } = require("socket.io");
const io = new Server(server);


    let activeUsers = [];

    const getUser = (id) => {
        return activeUsers.find((user) => user.userId === id);
    }

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
        socket.on("new-user-add", (newUserId) => {
            if (!activeUsers.some((user) => user.userId === newUserId)) {
              activeUsers.push({ userId: newUserId, socketId: socket.id });
               console.log("New User Connected", activeUsers);
            }
            io.emit("get-users", activeUsers);
        });
        
        socket.on("notification", ({sender, receiver, type, message}) => {    
          const user = getUser(receiver);
          if(user) {
             console.log(user);
            io.to(user.socketId).emit("get-notification", { 
              message,
              sender,
              receiver,
              type
            });
          } else {
              console.log("user not online");
              const offlineNotification = {
                  contents: {en: `${""} ${""}`},
                  include_external_user_ids:[ `${receiver}`],  
                  app_id: "295cf3a9-987f-421f-9b0f-133358a8539a",
              };
              sendNotification(offlineNotification);
          }
      });
    });


server.listen(5000, () => {
    console.log('listening on *:5000');
});