/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./src/index.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./src/clock.js":
/*!**********************!*\
  !*** ./src/clock.js ***!
  \**********************/
/*! no exports provided */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony import */ var _warmup__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./warmup */ \"./src/warmup.js\");\n\n\nclass Clock {\n  constructor() {\n    // 1. Create a Date object.\n    const currentTime = new Date();\n\n    // 2. Store the hour, minute, and second.\n    this.hours = currentTime.getHours();\n    this.minutes = currentTime.getMinutes();\n    this.seconds = currentTime.getSeconds();\n\n    // 3. Call printTime.\n    this.printTime();\n\n    // 4. Schedule the tick at 1 second intervals.\n    setInterval(this._tick.bind(this), 1000);\n  }\n  \n  printTime() {\n    // Format the time in HH:MM:SS\n    const timeString = [this.hours, this.minutes, this.seconds].join(\":\");\n    \n    // Use console.log to print it.\n    // console.log(timeString);\n    Object(_warmup__WEBPACK_IMPORTED_MODULE_0__[\"htmlGenerator\"])(timeString, clockElement);\n    // return timeString;\n  }\n  \n  _tick() {\n    // 1. Increment the time by one second.\n    this._incrementSeconds();\n    \n    // 2. Call printTime.\n    this.printTime();\n  }\n  \n  _incrementSeconds() {\n    // 1. Increment the time by one second.\n    this.seconds += 1;\n    if (this.seconds === 60) {\n      this.seconds = 0;\n      this._incrementMinutes();\n    }\n  }\n  \n  _incrementMinutes() {\n    this.minutes += 1;\n    if (this.minutes === 60) {\n      this.minutes = 0;\n      this._incrementHours();\n    }\n  }\n  \n  _incrementHours() {\n    this.hours = (this.hours + 1) % 24;\n  }\n}\n\n\nvar clockElement = document.getElementById('clock');\nconst clock = new Clock();\n\n\n//# sourceURL=webpack:///./src/clock.js?");

/***/ }),

/***/ "./src/drop_down.js":
/*!**************************!*\
  !*** ./src/drop_down.js ***!
  \**************************/
/*! exports provided: dogLinkCreator, attachDogLinks */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"dogLinkCreator\", function() { return dogLinkCreator; });\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"attachDogLinks\", function() { return attachDogLinks; });\n\nconst dogs = {\n  \"Corgi\": \"https://www.akc.org/dog-breeds/cardigan-welsh-corgi/\",\n  \"Australian Shepherd\": \"https://www.akc.org/dog-breeds/australian-shepherd/\",\n  \"Affenpinscher\": \"https://www.akc.org/dog-breeds/affenpinscher/\",\n  \"American Staffordshire Terrier\": \"https://www.akc.org/dog-breeds/american-staffordshire-terrier/\",\n  \"Tosa\": \"https://www.akc.org/dog-breeds/tosa/\",\n  \"Labrador Retriever\": \"https://www.akc.org/dog-breeds/labrador-retriever/\",\n  \"French Bulldog\": \"https://www.akc.org/dog-breeds/french-bulldog/\" \n};\n\nconst dogLinkCreator =  (pojo) => {\n  let result = [];\n  const keys = Object.keys(pojo); // => [\"Corgi\", \"Austrilian Sheperd\"...]\n\n  keys.forEach((element) => {\n    const ele = document.createElement('a');\n    ele.innerHTML = element;\n    ele.href = pojo[element];\n\n    const li = document.createElement('li');\n    li.classList.add(\"dog-link\");\n    li.appendChild(ele);\n    result.push(li);\n\n  });\n\n  return result;\n};\n\nconst attachDogLinks = (doglist) => {\n  const dogLinks = dogLinkCreator(doglist);\n  const ulDropDown = document.getElementsByClassName(\"drop-down-dog-list\");\n  dogLinks.forEach((element)=>{\n    ulDropDown[0].appendChild(element);\n  });\n\n};\n\nattachDogLinks(dogs);\n\nfunction handleEnter () {\n  // let li = document.getElementsByTagName('li');\n  let li = document.querySelectorAll(\"ul.drop-down-dog-list li\");\n  // debugger\n  // li.classList.remove('dog-link');\n  Array.from(li).forEach((ele1)=>{\n    ele1.classList.remove(\"dog-link\");\n  });\n  \n}\n\nfunction handleLeave () {\n  let li = document.querySelectorAll(\"ul.drop-down-dog-list li\");\n  Array.from(li).forEach((ele2) => {\n    ele2.classList.add(\"dog-link\");\n  });\n}\nlet tag = document.getElementsByTagName('nav');\ntag[0].addEventListener('mouseenter', handleEnter.bind(undefined));\ntag[0].addEventListener('mouseleave', handleLeave.bind(undefined));\n\n//# sourceURL=webpack:///./src/drop_down.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no exports provided */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony import */ var _warmup__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./warmup */ \"./src/warmup.js\");\n/* harmony import */ var _clock__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./clock */ \"./src/clock.js\");\n/* harmony import */ var _drop_down__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./drop_down */ \"./src/drop_down.js\");\n/* harmony import */ var _todo_list__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ./todo_list */ \"./src/todo_list.js\");\n/* harmony import */ var _todo_list__WEBPACK_IMPORTED_MODULE_3___default = /*#__PURE__*/__webpack_require__.n(_todo_list__WEBPACK_IMPORTED_MODULE_3__);\n\n\n// how to use the warmUp function\n// const partyHeader = document.getElementById('party');\n// htmlGenerator('Party Timeasdasdasd.', partyHeader);\n\n// window.htmlGenerator = htmlGenerator;\n// debugger\n\n\n\n\nwindow.htmlGenerator = _warmup__WEBPACK_IMPORTED_MODULE_0__[\"htmlGenerator\"];\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/todo_list.js":
/*!**************************!*\
  !*** ./src/todo_list.js ***!
  \**************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("\n\nlet todos = [];\nif (localStorage.getItem(\"todo\")){\n  // debugger\n  const stringTodo = localStorage.getItem(\"todo\");\n  todos = JSON.parse(stringTodo);\n  populateList(todos);\n}\n\nvar ulEl = document.getElementsByClassName('todos')[0];\nlet formEl = document.getElementsByClassName('add-todo-form')[0];\n\nformEl.addEventListener('submit', e =>{\n  e.preventDefault();\n\n  const addTodo  = document.getElementsByName(\"add-todo\")[0];\n  let newInput = addTodo.value;\n  let todoObject = {\n    text: newInput,\n    done: false\n  };\n  todos.push(todoObject);\n  addTodo.value = \"\";\n  \n  while (ulEl.firstChild) {\n    ulEl.removeChild(ulEl.firstChild);\n  }\n\n  localStorage.setItem(\"todo\", JSON.stringify(todos));\n  populateList(todos);\n});\n\nfunction populateList(arrOfTodos){\n  // debugger\n  arrOfTodos.forEach(element =>{\n    const label = document.createElement('label');\n    label.innerHTML = element.text;\n\n    var checkBox = document.createElement(\"INPUT\");\n    checkBox.setAttribute(\"type\", \"checkbox\");\n    \n    // debugger\n    if (checkBox.dataset.done !== undefined){\n      // debugger\n      checkBox.checked = (checkBox.dataset.done === 'true');\n    }\n\n    label.appendChild(checkBox);\n\n    const liTag = document.createElement('li');\n    liTag.appendChild(label);\n\n    let ulEl2 = document.getElementsByClassName('todos')[0];\n    ulEl2.appendChild(liTag);\n\n  });\n}\n\nulEl.addEventListener(\"click\", (e) =>{\n  // debugger\n  let inputEle = e.target;\n  if (inputEle.dataset.done === undefined){\n    inputEle.dataset.done = true;\n    debugger\n    // how do we update our todos array, so that when we refresh the page\n    // we get things to stay checked\n  } else {\n    inputEle.dataset.done = false;\n  }\n\n});\n\n\n//# sourceURL=webpack:///./src/todo_list.js?");

/***/ }),

/***/ "./src/warmup.js":
/*!***********************!*\
  !*** ./src/warmup.js ***!
  \***********************/
/*! exports provided: htmlGenerator */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"htmlGenerator\", function() { return htmlGenerator; });\n\nconst partyHeader = document.getElementById('party');\n\n//// import { htmlGenerator } from \"./warmup\"; DO THIS WAY TO IMPORT\nconst htmlGenerator = (string, htmlElement) => {\n  while (htmlElement.firstChild){\n    htmlElement.removeChild(htmlElement.firstChild);\n  }\n\n\n  var node = document.createElement('p');\n  node.innerHTML = string;\n  htmlElement.appendChild(node);\n};\n\n\n//import warmUp from \"./warmup\"; DO THIS WAY TO IMPORT\n// export default function (string, htmlElement) {\n//   var node = document.createElement('p');\n//   node.innerHTML = string;\n//   htmlElement.appendChild(node);\n// }\n\nhtmlGenerator('Party Time.', partyHeader);\n\n\n//# sourceURL=webpack:///./src/warmup.js?");

/***/ })

/******/ });