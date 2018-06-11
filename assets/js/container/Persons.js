import React, { Component } from "react"
import { connect } from "react-redux"
import { Nav } from "../components/Nav"

const _Persons = ({ persons }) => {
  return(
    <div>
      <Nav />
      <table className="table">
        <thead>
          <tr>
            <th scope="col">#</th>
            <th scope="col">Name</th>
            <th scope="col">Email Address</th>
            <th scope="col">Job Title</th>
          </tr>
        </thead>
        <tbody>
          {persons.map(function(person, i){
              return (
                <tr>
                  <th scope="row">{i + 1}</th>
                  <td>{person.first_name} {person.last_name}</td>
                  <td>{person.email_address}</td>
                  <td>{person.job_title}</td>
                </tr>
              )
          })}
        </tbody>
      </table>
    </div>
  )
}

const mapStateToProps = (state) => ({
  persons: state.persons.sort(function(a, b){
    if (a.email_address > b.email_address){
      return 1
    } else {
      return -1
    }
  })
})
const Persons = connect(mapStateToProps, null)(_Persons)

export { Persons }
