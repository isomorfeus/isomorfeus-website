// entry file for the server side rendering environment (ssr)
// import npm modules that are only valid to use in the server side rendering environment
// for example modules which depend on objects provided by node js
import ReactDOMServer from 'react-dom/server';
global.ReactDOMServer = ReactDOMServer;
import { StaticRouter } from 'react-router-dom';
// global.History = History;
global.Router = StaticRouter;
import WebSocket from 'ws';
global.WebSocket = WebSocket;
// import modules common to browser and server side rendering (ssr)
// environments from application_common.js
import './application_common.js';

import init_app from 'isomorfeus_ssr_loader.rb';
init_app();
global.Opal.load('isomorfeus_ssr_loader');

if (module.hot) { module.hot.accept(); }
