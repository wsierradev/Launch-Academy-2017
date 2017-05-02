// your code, here
function job(length1, length2, length3) {
length3 = length3 / 12
feet = length1 * length2 * length3
if (feet <= 49) {
  price = 20
} else if (feet > 49 && feet < 150) {
  price = 50
} else if (feet > 150 && feet <= 299) {
  price = 100
} else {
  price = 150
}
console.log("Cubic Feet: $" + Math.round(feet));
console.log("Quote Price: $" + price);
}
job(8,20,8)
