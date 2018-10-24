import React from 'react'
import 'babel-polyfill';
import { Router, Route, IndexRoute, browserHistory } from 'react-router';

const App = (props) => {
  return (
    <Router history={browserHistory}>
    </Router>
  )
}

export default App
 
