import React from 'react'
import { Link } from 'react-router-dom'

const Dashboard = props => (
  <div>
    <h1>DASHBOARD PAGE</h1>
    <Link to="/invoices/terms">Back</Link>
    <Link to="/invoices/payment">Proceed</Link>
  </div>
)

export default Dashboard
