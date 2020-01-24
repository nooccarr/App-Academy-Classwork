const DOMNodeCollection = require ('./dom_node_collection.js');
// entry

window.$l = (arg) => { 
  if (typeof  arg === ("string")) {         // $('li')
    return getNodesFromDom(arg);
  } else if (arg instanceof HTMLElement) {  // $(<li>)
    const eleArray = Array.from(arg);
    return new DOMNodeCollection(eleArray);
  }
};

function getNodesFromDom(arg) {
  const nodeList = document.querySelectorAll(arg);
  const nodeArray = Array.from(nodeList); 
  return new DOMNodeCollection(nodeArray);
}

// clone node  let newClone = node.cloneNode([deep])
// append child

// window.identify = (object) => {
//   switch (object.species) {
//     case "dog":
//       console.log("I am a dog!");
//       break;
//     case "cat":
//       console.log("I am a cat!");
//       break;
//     case "whale":
//       console.log("I am a whale!");
//       // break;
//   }