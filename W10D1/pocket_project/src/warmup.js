
const partyHeader = document.getElementById('party');

//// import { htmlGenerator } from "./warmup"; DO THIS WAY TO IMPORT
export const htmlGenerator = (string, htmlElement) => {
  while (htmlElement.firstChild){
    htmlElement.removeChild(htmlElement.firstChild);
  }


  var node = document.createElement('p');
  node.innerHTML = string;
  htmlElement.appendChild(node);
};


//import warmUp from "./warmup"; DO THIS WAY TO IMPORT
// export default function (string, htmlElement) {
//   var node = document.createElement('p');
//   node.innerHTML = string;
//   htmlElement.appendChild(node);
// }

htmlGenerator('Party Time.', partyHeader);
