import React from 'react';
import 'babel-polyfill';
import { Router, Route, IndexRoute, browserHistory } from 'react-router';
import Assessment from '../containers/Assessment';
import Profile from '../containers/Profile';

const App = (props) => {
  return (
    <Router history={browserHistory}>
      <Route path='/programs/new' component={Assessment}>
      </Route>
      <Route path='/profile' component={Profile} />
    </Router>
  )
}

export default App
 
