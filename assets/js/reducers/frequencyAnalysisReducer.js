const frequencyAnalysis = (state = [], action) => {
  switch(action.type){
    case "UPDATE_ALL":
      return (action.payload.frequency_analysis);
    default:
      return state;
  }
}

export { frequencyAnalysis };
