import React from 'react'
import { StyleRoot } from 'radium'

const styles = {
  root: {
    display: 'flex',
    justifyContent: 'space-between',
    alignItems: 'center',
    height: 64,
    padding: '0 18px',
    boxShadow: '0 2px 4px 0 rgba(68, 68, 68, 0.35)',
  },
  search: {
    display: 'flex',
    justifyContent: 'space-between',
    alignItems: 'center',
  },
  minimized: {
    '@media (max-width: 320px)': {
      display: 'none',
    },
  },
}

const NavBar = props => (
  <StyleRoot>
    <div style={styles.root}>
      <div style={styles.search}>
        <div>MYSURREY PORTAL</div>
        <div style={[styles.minimized]}><input type="text" placeholder="Search for services" /></div>
      </div>
      <div style={styles.search}>
        <div>Home</div>
        <div>Notifications</div>
        <div>Profile</div>
      </div>
    </div>
  </StyleRoot>
)

export default NavBar
