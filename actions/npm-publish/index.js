var path = require('path');
var fs = require('fs');

/**
 * Search starting at the specified start path for files ending in the filter
 * pattern.
 *
 * Pulled from https://stackoverflow.com/a/25462405/2605221
 *
 * @param {string} startPath - subdirectory search path
 * @param {string} filter  - pattern to match for file search
 * @return {[]string}    - an array of index.js files
 */
function findNodeRoots(startPath, filter) {
  const result = [];
  if (!fs.existsSync(startPath)) {
    console.log('no dir ', startPath);
    return;
  }

  var files = fs.readdirSync(startPath);
  for (var i = 0; i < files.length; i++) {
    var filename = path.join(startPath, files[i]);
    var stat = fs.lstatSync(filename);

    if (stat.isDirectory() && filename != 'node_modules') {
      result.push(...findNodeRoots(filename, filter)); //recurse
    } else if (filename.indexOf(filter) >= 0 && filename.endsWith('index.ts')) {
      result.push(`./${filename.replace('.ts', '.js')}`);
    }
  }
  return result;
}

const roots = findNodeRoots('./', '.ts');

/*
  Write a index.js file which contains the import calls to the relative ts
  libraries. Resulting file has multiple 
  `module.exports.name = require('./path/name/index.js');` declarations.
 */
let content = '';
for (i = 0; i < roots.length; i++) {
  const path = roots[i];
  const name = path.split('/')[1];
  content += `module.exports.${name} = require('${path}');\n`;
}

fs.writeFileSync(`${process.env.GITHUB_WORKSPACE}/index.js`, content);
