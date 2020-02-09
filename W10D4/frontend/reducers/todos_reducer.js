import { RECEIVE_TODOS, RECEIVE_TODO } from "../actions/todo_actions";

const initialState = {
  1: {
    id: 1,
    title: "wash car",
    body: "with soap",
    done: false
  },
  2: {
    id: 2,
    title: "wash dog",
    body: "with shampoo",
    done: true
  }
};

const todosReducer = (state = initialState, action) => {  // state: previous app state, action: action object being dispatched
  // debugger
  Object.freeze(state);
  switch (action.type) {
    case RECEIVE_TODOS:
      let newState = {};
      action.todos.forEach( todo => {
        newState[todo.id] = todo;
      });
      return newState;
    case RECEIVE_TODO:
    // Make a new object setting a single key value pair for action.todo
    // Return a new state object by merging your previous state and your
    // new object
    let nextState = Object.assign(
      {}, 
      state, 
      { [action.todo.id]: action.todo }
      );
      return nextState;
    default:
      return state;
  }
};

export default todosReducer;


// const newTodos = [{ id: 1, title: "wash hat" }, { id: 2, title: "wash clothe" }, { id: 3, title: "wash socks" }]; 
// store.getState(); // should return default state object
// store.dispatch(receiveTodo({ id: 3, title: "New Todo" }));
// store.getState(); // should include the newly added todo
// store.dispatch(receiveTodos(newTodos));
// store.getState(); // should return only the new todos 