const persons = (state = [], action) => {
  switch(action.type){
    case "UPDATE_ALL":
      return (action.payload.persons);
    default:
      return state;
  }
}

export { persons };
