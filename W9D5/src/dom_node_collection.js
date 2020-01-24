class DOMNodeCollection {
  constructor(nodes) {
    this.nodes = nodes;
  }

  html(args) {
    if (typeof args === "undefined") {
      const innerHtml = this[0].innerHTML; 
      return innerHtml;                         // set innerHTML on first node in the array if no argument received 
  } else {
      for (let i = 0; i < this.nodes.length; i++) {    // iterating through nodes
        debugger;
        this.nodes[i].innerHTML = args;
        // this.nodes = (this[i].innerHTML);     // setting innerHTML of each node 
      }
    }

    return this.nodes.innerHTML;
  }                   

  empty() {
    this.html("");
  }

  append(args) {
    if (this.nodes.length === 0) return;

    // if !(args instanceof HTMLElement) &&
    if (typeof args === 'object' &&
      !(args instanceof DOMNodeCollection)) {
        args = $l(args);
      }
    if (typeof args === "string") { 
      this.each((node) => {
        node.innerHTML += args;
      });
    }
  }
}


module.exports = DOMNodeCollection;