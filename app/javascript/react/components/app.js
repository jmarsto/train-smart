import React from 'react'
import 'babel-polyfill';
import { Router, Route, IndexRoute, browserHistory } from 'react-router';
import Landing from '../containers/Landing'

const App = (props) => {
  return (
    <Router history={browserHistory}>
      <Route path='/' component={Landing} />
    </Router>
  )
}

export default App
