const potentialDuplicates = (state = [], action) => {
  switch(action.type){
    case "UPDATE_ALL":
      return (action.payload.potential_duplicates);
    default:
      return state;
  }
}

export { potentialDuplicates };
