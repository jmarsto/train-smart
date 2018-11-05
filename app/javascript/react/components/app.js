import React from 'react';
import 'babel-polyfill';
import { Router, Route, IndexRoute, browserHistory } from 'react-router';
import Assessment from '../containers/Assessment';
import Profile from '../containers/Profile';
import EditAssessment from '../containers/EditAssessment';

const App = (props) => {
  return (
    <Router history={browserHistory}>
      <Route path='/programs/new' component={Assessment}>
      </Route>
      <Route path='/profile' component={Profile} />
      <Route path='/edit' component={EditAssessment} />
    </Router>
  )
}

export default App
 
