// your code, here
todo = [
  "Step 1. Collect underpants",
  "Step 2. ?",
  "Step 3. PROFIT!!!",
  ]

  for (var i = 0; i <todo.length; i++){
  let listitem = document.createElement('li');
  listitem.innerHTML = todo[i];
  let mainDiv = document.getElementById('main');
  mainDiv.appendChild(listitem);
}
