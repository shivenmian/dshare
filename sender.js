const net = require("net"), fs = require("fs");

let server, istream = fs.createReadStream("./test.rtf");

server = net.createServer(socket => {
    socket.pipe(process.stdout);
    istream.on("readable", function () {
        let data;
        while (data = this.read()) {
            socket.write(data);
        }
    })
    istream.on("end", function(){
        socket.end();
    })
    socket.on("end", () => {
        server.close(() => { console.log("\nTransfer is done!") });
    })
})

server.listen(8000, '168.150.103.86');
