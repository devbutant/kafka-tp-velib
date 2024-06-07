const express = require("express");
const http = require("http");
const socketIo = require("socket.io");
const kafka = require("kafka-node");

const app = express();
const server = http.createServer(app);
const io = socketIo(server);

const stations = {};

app.use(express.static("public"));

app.get("/", (req, res) => {
    res.sendFile(__dirname + "/public/index.html");
});

const Consumer = kafka.Consumer;
const client = new kafka.KafkaClient({ kafkaHost: "localhost:9092" });
const consumer = new Consumer(
    client,
    [{ topic: "velib-stations", partition: 0 }],
    { autoCommit: true }
);

consumer.on("message", (message) => {
    const station = JSON.parse(message.value);
    const stationNumber = station.number;
    const contract = station.contract_name;
    const availableBikeStands = station.available_bike_stands;

    if (!stations[contract]) {
        stations[contract] = {};
    }
    const cityStations = stations[contract];
    if (!cityStations[stationNumber]) {
        cityStations[stationNumber] = availableBikeStands;
    }

    const countDiff = availableBikeStands - cityStations[stationNumber];
    if (countDiff !== 0) {
        cityStations[stationNumber] = availableBikeStands;
        const data = {
            diff: countDiff,
            address: station.address,
            contract: contract,
            available_bike_stands: availableBikeStands,
            station_number: stationNumber,
        };
        io.emit("station_update", data);
        console.log(
            `${countDiff > 0 ? "+" : ""}${countDiff} ${
                station.address
            } (${contract})`
        );
    }
});

server.listen(3000, () => {
    console.log("Server is running on http://localhost:3000");
});
