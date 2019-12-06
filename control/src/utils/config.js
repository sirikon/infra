const fs = require('fs');
const pathUtils = require('path');

module.exports = function config() {
    return new Promise((resolve, reject) => {
        fs.readFile('./config.json', { encoding: 'utf8' }, (err, data) => {
            if (err) { return reject(err); }
            resolve(JSON.parse(data));
        });
    });
}
