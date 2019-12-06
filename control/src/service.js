const fs = require('fs');
const pathUtils = require('path');

const getConfig = require('./utils/config');
const compose = require('./utils/compose');

module.exports = async function service(args) {
    if (!args.length) { return; }
    await commands[args[1]](args[0]);
}

const commands = {
    'up': async (serviceName) => {
        await runComposeForService(serviceName, ['up', '-d'])
    },
    'down': async (serviceName) => {
        await runComposeForService(serviceName, ['down'])
    },
    'logs': async (serviceName) => {
        await runComposeForService(serviceName, ['logs', '-f'])
    },
    'build': async (serviceName) => {
        await runComposeForService(serviceName, ['build'])
    }
}

async function runComposeForService(serviceName, args) {
    const projectConfig = getProjectConfig(serviceName);
    const config = await getConfig();
    const env = config.services[serviceName];
    await compose(pathUtils.join(`./services/${serviceName}`, projectConfig.workingDirectory), env, serviceName, [
        './docker-compose.yml',
        pathUtils.join(pathUtils.resolve('.'), `./config/${serviceName}/docker-compose.yml`)
    ], args);
}

function getProjectConfig(serviceName) {
    return JSON.parse(fs.readFileSync(`./config/${serviceName}/config.json`, { encoding: 'utf8' }));
}
