const service = require('./src/service');

async function main() {
    const args = getArgs();
    if (!args.length) { return; }
    switch(args[0]) {
        case 'service': await service(args.slice(1));
    }
}

function getArgs() {
    return process.argv.slice(2);
}

main().then(
    () => {},
    (err) => console.log(err));
