// import javascript modules common to browser and server side rendering environments
import * as Redux from 'redux';
global.Redux = Redux;
import React from 'react';
global.React = React;
import { Link, NavLink, Route, Switch } from 'react-router-dom';
// global.History = History;
global.Link = Link;
global.NavLink = NavLink;
global.Route = Route;
global.Switch = Switch;

import * as Mui from '@material-ui/core';
import * as MuiStyles from '@material-ui/styles';
global.Mui = Mui;
global.MuiStyles = MuiStyles;

if (module.hot) { module.hot.accept(); }
