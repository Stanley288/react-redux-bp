import React from 'react'
import { BrowserRouter as Router, Route } from 'react-router-dom'

import NavBar from 'components/NavBar'
import Invoices from './Invoices'

export default () => (
  <Router>
    <div>
      <NavBar />
      <Route path="/invoices" component={Invoices} />
    </div>
  </Router>
)
