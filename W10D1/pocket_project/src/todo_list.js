

let todos = [];
if (localStorage.getItem("todo")){
  // debugger
  const stringTodo = localStorage.getItem("todo");
  todos = JSON.parse(stringTodo);
  populateList(todos);
}

var ulEl = document.getElementsByClassName('todos')[0];
let formEl = document.getElementsByClassName('add-todo-form')[0];

formEl.addEventListener('submit', e =>{
  e.preventDefault();

  const addTodo  = document.getElementsByName("add-todo")[0];
  let newInput = addTodo.value;
  let todoObject = {
    text: newInput,
    done: false
  };
  todos.push(todoObject);
  addTodo.value = "";
  
  while (ulEl.firstChild) {
    ulEl.removeChild(ulEl.firstChild);
  }

  localStorage.setItem("todo", JSON.stringify(todos));
  populateList(todos);
});

function populateList(arrOfTodos){
  // debugger
  arrOfTodos.forEach(element =>{
    const label = document.createElement('label');
    label.innerHTML = element.text;

    var checkBox = document.createElement("INPUT");
    checkBox.setAttribute("type", "checkbox");
    
    // debugger
    if (checkBox.dataset.done !== undefined){
      // debugger
      checkBox.checked = (checkBox.dataset.done === 'true');
    }

    label.appendChild(checkBox);

    const liTag = document.createElement('li');
    liTag.appendChild(label);

    let ulEl2 = document.getElementsByClassName('todos')[0];
    ulEl2.appendChild(liTag);

  });
}

ulEl.addEventListener("click", (e) =>{
  // debugger
  let inputEle = e.target;
  if (inputEle.dataset.done === undefined){
    inputEle.dataset.done = true;
    debugger
    // how do we update our todos array, so that when we refresh the page
    // we get things to stay checked
  } else {
    inputEle.dataset.done = false;
  }

});
