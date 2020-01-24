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

/***/ "./src/dom_node_collection.js":
/*!************************************!*\
  !*** ./src/dom_node_collection.js ***!
  \************************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("class DOMNodeCollection {\n  constructor(nodes) {\n    this.nodes = nodes;\n  }\n\n  html(args) {\n    if (typeof args === \"undefined\") {\n      const innerHtml = this[0].innerHTML; \n      return innerHtml;                         // set innerHTML on first node in the array if no argument received \n  } else {\n      for (let i = 0; i < this.nodes.length; i++) {    // iterating through nodes\n        debugger;\n        this.nodes[i].innerHTML = args;\n        // this.nodes = (this[i].innerHTML);     // setting innerHTML of each node \n      }\n    }\n\n    return this.nodes.innerHTML;\n  }                   \n\n  empty() {\n    this.html(\"\");\n  }\n\n  append(args) {\n    if (this.nodes.length === 0) return;\n\n    // if !(args instanceof HTMLElement) &&\n    if (typeof args === 'object' &&\n      !(args instanceof DOMNodeCollection)) {\n        args = $l(args);\n      }\n    if (typeof args === \"string\") { \n      this.each((node) => {\n        node.innerHTML += args;\n      });\n    }\n  }\n}\n\n\nmodule.exports = DOMNodeCollection;\n\n//# sourceURL=webpack:///./src/dom_node_collection.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const DOMNodeCollection = __webpack_require__ (/*! ./dom_node_collection.js */ \"./src/dom_node_collection.js\");\n// entry\n\nwindow.$l = (arg) => { \n  if (typeof  arg === (\"string\")) {         // $('li')\n    return getNodesFromDom(arg);\n  } else if (arg instanceof HTMLElement) {  // $(<li>)\n    const eleArray = Array.from(arg);\n    return new DOMNodeCollection(eleArray);\n  }\n};\n\nfunction getNodesFromDom(arg) {\n  const nodeList = document.querySelectorAll(arg);\n  const nodeArray = Array.from(nodeList); \n  return new DOMNodeCollection(nodeArray);\n}\n\n// clone node  let newClone = node.cloneNode([deep])\n// append child\n\n// window.identify = (object) => {\n//   switch (object.species) {\n//     case \"dog\":\n//       console.log(\"I am a dog!\");\n//       break;\n//     case \"cat\":\n//       console.log(\"I am a cat!\");\n//       break;\n//     case \"whale\":\n//       console.log(\"I am a whale!\");\n//       // break;\n//   }\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ })

/******/ });