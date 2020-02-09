export const RECEIVE_TODOS = "RECEIVE_TODOS"; // populates the store
export const RECEIVE_TODO = "RECEIVE_TODO";   // either add or update a single todo in the store

export const receiveTodos = (todos) => ({ 
  type: RECEIVE_TODOS, 
  todos: todos 
});

export const receiveTodo = (todo) => ({
  type: RECEIVE_TODO,
  todo: todo
});
