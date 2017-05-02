### Introduction

![Automat by Berenice Abbott - 1936](https://s3.amazonaws.com/horizon-production/images/automat-by-berenice-abbott-1936.jpg)

In this challenge, you will be serving up classic dishes, automat-style.


### Getting Started

Open up the terminal and use the following commands to get started.

```no-highlight
$ cd ~/challenges       # for Mac/Linux
$ cd %HOME%/challenges  # for Windows
$ et get automat-js
```

Open the automat-js project folder in your editor.

Open the automat-js/index.html file in your browser.


### Instructions

#### Part 1 - Add Food Items to your Automat

Create an array in JavaScript to store the dishes your Automat will serve.

Here's a list of dishes inspired by the
[Horn & Hardart](http://dinersjournal.blogs.nytimes.com/2012/12/17/the-automat-may-be-long-gone-but-its-recipes-are-in-demand/)
chain of Automats.

* Chicken Pot Pie
* Baked Beans
* Macaroni and Cheese
* Burgundy Sauce with Beef and Noodles
* Creamed Spinach
* Pumpkin Pie
* Strawberry Shortcake

Next, use your knowledge of **iteration** to place each one of these items into
the `div#main` element within the page.

![Automat.js](https://s3.amazonaws.com/horizon-production/images/automat-js.png)

**Hint:** Wrap the text you insert into the page with `div` tags with a class of `food-item`, in order to get the appropriate styling.

```no-highlight
<div class="food-item">Chicken Pot Pie</div>
```


#### Part 2 - Refactor Your Automat

Another way to create an HTML page element, is via the `document.createElement()`
function. The benefit of this method over string concatenation, is that we have
more control over the individual page elements.

To create an individual `div` element with a class of `food-item`:

```no-highlight
let foodItemDiv = document.createElement('div');
foodItemDiv.className = 'food-item';
foodItemDiv.innerHTML = 'Chicken Pot Pie';
```

Then, we can use the `appendChild()` function to add it to the page.

```no-highlight
let mainDiv = document.getElementById('main');
mainDiv.appendChild(foodItemDiv);
```

Refactor your code to use the `document.createElement()` and `appendChild()`
functions.


#### Part 3 - Open the Automat for Business!

![Automat.js](https://s3.amazonaws.com/horizon-production/images/automat-js-open.png)

Add an **event listener** to each `foodItemDiv`, so that when a user clicks it,
the `.hidden` class is applied to the `div`.

To add a new class to a div, simply add to the `.className` property.

```no-highlight
foodItemDiv.className += ' hidden';
```

**Note:** The leading space is important!


### Submitting Your Code

Once you have completed this challenge, use the `et` command to submit your code
from this project's folder.

```no-highlight
$ cd ~/challenges/automat-js       # for Mac/Linux
$ cd %HOME%/challenges/automat-js  # for Windows
$ et submit
```
