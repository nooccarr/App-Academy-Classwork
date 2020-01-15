
let fake_array = [5, 2, 6, 8, 1];
let double = function (el) {
    console.log(el * 2);
};

Array.prototype.myEach = function (callback) {
    for (let i = 0; i < this.length; i++) {
        el = this[i];
        callback(el);
    }
};

// fake_array.forEach(double);
// fake_array.myEach(double);

Array.prototype.myMap = function (callback) {
    let new_array = [];
    let append_to_new_arr = function (el) {
        new_array.push(callback(el));
    };
    this.myEach(append_to_new_arr);
    return new_array;
};

// let doubleFunc = function (el) {
//     return el * 2;
// };
// let quadFunc = function (el) {
//     return el * 4;
// };

// console.log(fake_array.myMap(doubleFunc));
// console.log(fake_array.myMap(quadFunc));

// // DEMO AREA
// this => [5, 2, 6, 8, 1];

// fake_array.myMap = function (outter_callback: quad_func)
//     let new_array = []
// let append_to_new_arr = function (el) { // what calling htis method would do
//     // new_array.push(outter_callback(el))
//     new_array.push(el * 4);
// };
// this.myEach(each_callback: append_to_new_arr)
// for (let i = 0; i < this.length; i++) {
//     el = this[i];
//     // each_callback(el);
//     // append_to_new_arr(el);
//     new_array.push(quad_func(el));
// }

Array.prototype.myReduce = function(outter_callback, acc){
    arr = this;
    if(acc === undefined){
        acc = this[0];
        arr = this.slice(1, this.length);
    }
    let inner_callback = function (el) {
        acc = outter_callback(acc, el);
    }
    arr.myEach(inner_callback);
    return acc;
};
// without initialValue
console.log([5,7,9,1,20].myReduce(function (acc, el) {
    return acc * el;
})); // => 6

// with initialValue
console.log([5, 7, 9, 1, 20].myReduce(function (acc, el) {
    return acc - el;
}, 25)); // => 31