const express = require('express');
const logger = require('morgan');

const indexRouter = require('./routes/index');

const app = express();

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));

app.use('/', indexRouter);

const port = 8080
app.listen(port, () => {
    console.log(`Example app listening on port ${port}`)
})

module.exports = app;
