const fs = require('fs');
const path = require('path');
const os = require('os');

const sshDir = path.join(os.homedir(), '.ssh');
const configPath = path.join(sshDir, 'config');
// Use forward slashes for path in config file to be safe with SSH
const identityFile = path.join(sshDir, 'id_rsa_blog').replace(/\\/g, '/');

const content = `Host github.com
  HostName github.com
  User git
  IdentityFile ${identityFile}
  IdentitiesOnly yes
  StrictHostKeyChecking no
`;

try {
    fs.writeFileSync(configPath, content, { encoding: 'utf8' });
    console.log('Successfully updated ' + configPath);
    console.log('New content:\n' + content);
} catch (err) {
    console.error('Error writing file:', err);
    process.exit(1);
}
