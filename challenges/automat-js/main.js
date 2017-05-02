// your code, here
let menu = ["Chicken Pot Pie",
"Baked Beans",
"Macaroni and Cheese",
"Burgundy Sauce with Beef and Noodles",
"Creamed Spinach",
"Pumpkin Pie",
"Strawberry Shortcake",]

for (var i = 0; i <menu.length; i++){
let foodItemDiv = document.createElement('div');
foodItemDiv.className = 'food-item';
foodItemDiv.innerHTML = menu[i];
let mainDiv = document.getElementById('main');
mainDiv.appendChild(foodItemDiv);

}
for (var i = 0; i <menu.length; i++){
let test = document.getElementsByClassName('food-item')[i];
test.addEventListener('click', () => {
  // let test2 = document.getElementById('food-item');
  test.className += ' hidden';
});
}
