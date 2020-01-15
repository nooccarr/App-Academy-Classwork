Array.prototype.uniq = function(){
    let new_array = [];
    for(let i = 0; i < this.length; i++){
        if(!new_array.includes(this[i])){
            new_array.push(this[i]);
        }
    }
    return new_array;
};
// let cat = [1,5,3,1,2,1,1,3,6];
// console.log(cat.uniq()); // [1,2,3]


Array.prototype.twoSum = function() {
    let new_array = [];
    for(let i = 0; i < this.length; i++) {
        for(let j = i + 1; j < this.length; j++) {
            if(this[i] + this[j] == 0) {
                new_array.push([i, j]); 
            }
        }
    }
    return new_array;
};

// let list = [2, 5, 8, -1, 4, 6, -4, -2, -5];
// console.log(list.twoSum());


Array.prototype.transpose = function(){
    let new_array=[];
    for (let i = 0; i < this[0].length; i++) { // 0, 1, 2, 3
        // new_array[i] = []
        let temp_array = []
        for (let j = 0; j < this.length; j++) { // 0, 1, 2
            // new_array[i].push(this[j][i]);
            temp_array.push( this[j][i] );
        }
        new_array.push(temp_array)
    }
    return new_array;
};
// let matrix = [[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12]] // [[1,5,9],[2,6,10],[3,7,11],[4,8,12]]
// console.log(matrix.transpose());

// new_array = [[1, 5, 9], [2,6,10]]
