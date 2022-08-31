var express = require('express');
var moment = require('moment');
var router = express.Router();

router.get('/', (req, res) => {
    console.log('req.query', req.query, moment().format())
    const time = req.query.time
    const isOkay = moment().isAfter(moment(time, 'HH:mm'), 'HH:mm')
    res.send({complete: isOkay});
});

function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

router.get('/sleep', async (req, res) => {
    console.log('req.query', req.query)
    await sleep(req.query.waiting)
    res.send({});
});

router.get('/boolean', async (req, res) => {
    console.log('req.query', req.query)
    if (req.query.bool === 'false') {
        console.log('throw error')
        return res.status(500).send()
    }

    res.send({bool: req.query.bool});
});

module.exports = router;
