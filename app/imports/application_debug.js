// entry file for the browser debugging environment
import deepForceUpdate from 'react-deep-force-update'
global.deepForceUpdate = deepForceUpdate;

// import application.js
import './application.js';

// space for additional modules for debugging or helper code

// allow for hot reloading
if (module.hot) { module.hot.accept(); }
