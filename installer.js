const tc = require("@actions/tool-cache");
const core = require("@actions/core");

async function getTerraform(version) {
  // check cache
  let toolPath = tc.find("terraform", version);
  if (!toolPath) {
    const terraformPath = await tc.downloadTool(
      `https://releases.hashicorp.com/terraform/${version}/terraform_${version}_linux_amd64.zip`
    );
    const extracted = await tc.extractZip(terraformPath);
    toolPath = await tc.cacheDir(extracted, "terraform", version);
  }
  core.addPath(toolPath);
}
exports.getTerraform = getTerraform;
