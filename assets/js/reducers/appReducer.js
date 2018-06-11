import { combineReducers } from 'redux'
import { persons } from "./personsReducer";
import { potentialDuplicates } from "./potentialDuplicateReducer"
import { frequencyAnalysis } from "./frequencyAnalysisReducer"

const appReducer = combineReducers({
  persons,
  potentialDuplicates,
  frequencyAnalysis
})

export { appReducer };
