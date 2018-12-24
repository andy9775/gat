import * as fs from 'fs';

// ============================= define file paths =============================
const ENV_PATH = process.env.GAT_ENV_PATH || process.env.HOME;
const ENV_SOURCE = `${ENV_PATH}/.envgat`;

/**
 * Fetch the environment variable from the env file
 * @param key - key used to fetch the environment variable for
 */
export function gEnv(key: string) {
  let result;
  if (fs.existsSync(ENV_SOURCE)) {
    result = fs
      .readFileSync(ENV_SOURCE, { flag: 'r' })
      .toString()
      .split('\n')
      .map(line => line && line.split('export ').slice(1)[0])
      .map(kv => kv && kv.split('='))
      .filter(kv => (kv ? kv[0] == key : false))
      .pop();
  }

  if (result && result.length == 2) {
    return result[1];
  }
  return '';
}

/**
 * Set the environment variable
 * @param key
 * @param value
 */
export function sEnv(key: string, value: string) {
  fs.appendFileSync(ENV_SOURCE, `export ${key.trim()}=${value.trim()}\n`);
}
