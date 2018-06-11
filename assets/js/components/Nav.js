import React, { Component } from "react"
import { connect } from "react-redux"
import {  Link } from "react-router-dom";

const Nav = ({ persons }) => {
  return(
    <div className="btn-group btn-group-toggle" data-toggle="buttons">
      <Link to="/" >
        <button className="btn btn-primary">Persons</button>
      </Link>
      <Link to="/frequency" >
        <button className="btn btn-primary">Letter Frequency Analysis</button>
      </Link>
      <Link to="/duplicates" >
        <button className="btn btn-primary">Possible Duplicate Emails</button>
      </Link>
    </div>
  )
}

export { Nav }
