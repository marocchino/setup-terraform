const core = require("@actions/core");
const installer = require("./installer");
// most @actions toolkit packages have async methods
async function run() {
  try {
    const version = core.getInput("version");
    if (version) {
      await installer.getTerraform(version);
    }
  } catch (error) {
    core.setFailed(error.message);
  }
}

run();
