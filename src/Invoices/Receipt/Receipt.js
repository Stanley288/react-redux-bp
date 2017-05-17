import React from 'react'
import { Link } from 'react-router-dom'

const Receipt = props => (
  <div>
    <h1>RECEIPT PAGE</h1>
    <Link to="/invoices/terms">Another Payment</Link>
  </div>
)

export default Receipt
