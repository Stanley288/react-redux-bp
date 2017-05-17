import React from 'react'
import { Link } from 'react-router-dom'

const Payment = props => (
  <div>
    <h1>PAYMENT PAGE</h1>
    <Link to="/invoices/dashboard">Back</Link>
    <Link to="/invoices/receipt">Pay</Link>
  </div>
)

export default Payment
