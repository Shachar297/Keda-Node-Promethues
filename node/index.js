const
    express = require('express'),
    os = require('os'),
    app = express(),
    apiMetrics = require('prometheus-api-metrics'),
    client = require('prom-client'),
    port = 5089 || process.env.PORT;

app.use(apiMetrics());
app.use(express.json());

const gauge = new client.Gauge({
    name: "custom_generic_counter_total_by_pod",
    help: "Custom Generic : Count per Pod",
    labelNames: ["pod"]
});

app.post("/api/count", (req, res, next) => {
    gauge.set({
        pod: os.hostname 
    },
    req.body.count);
    res.status(200).send("Counter At : " + req.body.count);
});

app.listen(port, () => {
    console.log("Server listening on port " + port) 
    gauge.set({pod: os.hostname}, 1);
});