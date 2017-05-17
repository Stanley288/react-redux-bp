import React from 'react'
import Helmet from 'react-helmet'
import ApolloClient, { createNetworkInterface } from 'apollo-client'
import { ApolloProvider } from 'react-apollo'
import { Provider } from 'react-redux'

import Routes from './routes'

// Base stylesheets
import './normalize.css'
import './app.css'

// Setup Apollo client
const createClient = () => (
  new ApolloClient({
    networkInterface: createNetworkInterface({
      uri: `${process.env.MYSURREY_API}/graphql`,
    }),
  })
)

function App(props) {
  // TODO: try to change order of providers for performance?
  return (
    <ApolloProvider client={createClient()}>
      <Provider store={props.store}>
        <div>
          <Helmet
            titleTemplate="%s | MySurrey"
            meta={[
              { charset: 'utf-8' },
              {
                'http-equiv': 'X-UA-Compatible',
                content: 'IE=edge',
              },
              {
                name: 'viewport',
                content: 'width=device-width, initial-scale=1',
              },
            ]}
          />

          <Routes />
        </div>
      </Provider>
    </ApolloProvider>
  )
}

App.propTypes = {
  store: React.PropTypes.object.isRequired, // eslint-disable-line
}

export default App
