import React, { Component } from "react"
import { connect } from "react-redux"
import { Nav } from "../components/Nav"

const _PotentialDuplicates = ({ potentialDuplicates }) => {
  return(
    <div>
      <Nav />
      <table class="table">
        <thead>
          <tr>
            <th scope="col">#</th>
            <th scope="col">A</th>
            <th scope="col">B</th>
          </tr>
        </thead>
        <tbody>
          {potentialDuplicates.map(function(row, i){
              return (
                <tr>
                  <th scope="row">{i + 1}</th>
                  <td>{row.first}</td>
                  <td>{row.second}</td>
                </tr>
              )
          })}
        </tbody>
      </table>
    </div>
  )
}

const mapStateToProps = (state) => ({
  potentialDuplicates: state.potentialDuplicates
});
const PotentialDuplicates = connect(mapStateToProps, null)(_PotentialDuplicates)

export { PotentialDuplicates }
