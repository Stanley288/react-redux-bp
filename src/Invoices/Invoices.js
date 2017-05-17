import React from 'react'
import { Route, Redirect } from 'react-router-dom'

import Terms from './Terms'
import Dashboard from './Dashboard'
import Payment from './Payment'
import Receipt from './Receipt'

const Invoices = props => (
  <div>
    <h3>INVOICES</h3>
    <Redirect from="/invoices" to="invoices/terms" />
    <Route path="invoices/terms" component={Terms} />
    <Route path="invoices/dashboard" component={Dashboard} />
    <Route path="invoices/payment" component={Payment} />
    <Route path="invoices/receipt" component={Receipt} />
  </div>
)

export default Invoices
