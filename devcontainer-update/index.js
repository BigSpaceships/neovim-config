const fs = require("fs");
const {spawn} = require("node:child_process");
const merge = require("lodash.merge");

const reposString = fs.readFileSync("./repos.json", "utf-8");
const repoNames = JSON.parse(reposString);

const repoUrls = repoNames.map((repo) => `https://github.com/${repo}.git`);

async function waitForCommand(commandString, commandOpts) {
    return new Promise((resolve, reject) => {
        const command = spawn(commandString, commandOpts, {
            cwd: process.env.REPL_HOME
        });

        command.stdout.on("data", output => {
            console.log(`${output}`)
        })

        command.on("error", (e) => {
            console.error(e.message)

            resolve()
        })

        command.on("close", () => {
            resolve();
        })
    })
}

const defaultDevcontainer = JSON.parse(fs.readFileSync("./template-dev-container.json"));

for (let i = 0; i < repoUrls.length; i++) {
    const clone_command = waitForCommand("git", ["clone", repoUrls[i], `${__dirname}/working-dir`]);

    const customDevcontainer = JSON.parse(fs.readFileSync("./working-dir/.devcontainer-custom/devcontainer.json"));

    const devcontainer = merge(defaultDevcontainer, customDevcontainer);

    console.log(JSON.stringify(devcontainer));
}
