removeWithoutCopy = (arr, item) => {
  for (var i = 0; i < arr.length; i++) {
    if (arr[i] == item) {
      arr.splice(i, 1);
      i--;
    }
  };
  return arr;
};

append = (arr, item) => {
  arr.push(item);
  return arr;
};

truncate = (arr) => {
  arr.pop();
  return arr;
};

prepend = (arr, item) => {
  arr.unshift(item);
  return arr;
};

curtail = (arr) => {
  arr.shift();
  return arr;
};

concat = (arr1, arr2) => {
  for(var i = 0; i < arr2.length; i++) {
    arr1.push(arr2[i]);
  }
  return arr1;
};

insert = (arr, item) => {
  arr.splice(0, item);
  return arr;
}

count = (arr, item) => {
  var count = 0;
  for (var i = 0; i < arr.length; i++) {
    if (arr[i] == item) {
      count ++;
    }
  };
    return count;
};

duplicates = (arr) => {
  var duplicates = [];
  for (var i = 0; i < arr.length; i++) {
    if (arr.indexOf(arr[i], i + 1) > -1) {
      if (!duplicates.includes(arr[i])) {
        duplicates.push(arr[i]);
      }
    }
  };
  return duplicates;
};

square = (arr) => {

};

findAllOccurrences = (arr, item) => {

};
