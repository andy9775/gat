import * as os from 'os';
import * as fs from 'fs';

describe('Test getting env variables', () => {
  let gat = require('./');
  beforeEach(() => {
    const GAT_ENV_DIR = os.tmpdir();
    process.env.GAT_ENV_PATH = GAT_ENV_DIR;
    jest.resetModules();
    gat = require('./');
  });

  afterEach(() => {
    // delete temp file between tests
    if (fs.existsSync(`${process.env.GAT_ENV_PATH}/.envgat`)) {
      fs.unlinkSync(`${process.env.GAT_ENV_PATH}/.envgat`);
    }
  });

  test('Get env variable with no file', () => {
    expect(gat.gEnv('HELLO')).toBe('');
  });

  test('Get env variable with existing values with valid key', () => {
    // setup
    const key = 'HELLO';
    const value = 'test';
    fs.appendFileSync(
      `${process.env.GAT_ENV_PATH}/.envgat`,
      `export ${key}=${value}`
    );

    // invoke/assert
    expect(gat.gEnv(key)).toBe(value);
  });

  test('Get env variable with existing values with invalid key', () => {
    // setup
    const key = 'HELLO';
    const value = 'test';
    fs.appendFileSync(
      `${process.env.GAT_ENV_PATH}/.envgat`,
      `export ${key}=${value}`
    );

    // invoke/assert
    expect(gat.gEnv(key + 'S')).toBe('');
  });

  test('Get env variable with multiple values with valid key', () => {
    // setup
    const key = 'HELLO';
    const value = 'test';
    const expectedValue = value + 'S';
    fs.appendFileSync(
      `${process.env.GAT_ENV_PATH}/.envgat`,
      `export ${key}=${value}\nexport ${key}=${expectedValue}`
    );

    // invoke/assert
    expect(gat.gEnv(key)).toBe(expectedValue);
  });
});

describe('Test setting env variables', () => {
  let gat = require('./');
  beforeEach(() => {
    const GAT_ENV_DIR = os.tmpdir();
    process.env.GAT_ENV_PATH = GAT_ENV_DIR;
    jest.resetModules();
    gat = require('./');
  });

  afterEach(() => {
    // delete temp file between tests
    if (fs.existsSync(`${process.env.GAT_ENV_PATH}/.envgat`)) {
      fs.unlinkSync(`${process.env.GAT_ENV_PATH}/.envgat`);
    }
  });

  test('Set env variable with no existing file', () => {
    // invoke
    gat.sEnv('HELLO', 'world');

    // assert
    const result = fs
      .readFileSync(`${process.env.GAT_ENV_PATH}/.envgat`)
      .toString();
    expect(result).toBe('export HELLO=world\n');
  });
});
