import React, { Component } from "react"
import { connect } from "react-redux"

const _FrequencyAnalysis = ({ frequencyAnalysis }) => {
  return(
    <div>
      <table class="table">
        <thead>
          <tr>
            <th scope="col">#</th>
            <th scope="col">Letter</th>
            <th scope="col">Count</th>
          </tr>
        </thead>
        <tbody>
          {frequencyAnalysis.map(function(row, i){
              return (
                <tr>
                  <th scope="row">{i + 1}</th>
                  <td>{row[0]}</td>
                  <td>{row[1]}</td>
                </tr>
              )
          })}
        </tbody>
      </table>
    </div>
  )
}

const mapStateToProps = (state) => ({
  frequencyAnalysis: state.frequencyAnalysis
});
const FrequencyAnalysis = connect(mapStateToProps, null)(_FrequencyAnalysis)

export { FrequencyAnalysis }
