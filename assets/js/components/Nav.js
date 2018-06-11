import React, { Component } from "react"
import { connect } from "react-redux"
import {  NavLink } from "react-router-dom";

const Nav = ({ persons }) => {
  return(
    <div className="btn-group btn-group-toggle" data-toggle="buttons">
      <NavLink exact to="/" activeClassName="active" className="btn btn-primary">
        Persons
      </NavLink>
      <NavLink to="/frequency" activeClassName="active" className="btn btn-primary">
        Letter Frequency Analysis
      </NavLink>
      <NavLink to="/duplicates" activeClassName="active" className="btn btn-primary">
        Possible Duplicate Emails
      </NavLink>
    </div>
  )
}

export { Nav }
