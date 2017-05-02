# grocery-list-js

## Instructions

In this challenge, you will build a Grocery List app utilizing HTML and JavaScript.

### Getting Set Up

```no-highlight
$ et get grocery-list-js
$ cd grocery-list-js
$ bundle
$ ruby app.rb
```

Open the following link in the browser <http://localhost:4567/SpecRunner.html>.

You will see a number of failing tests in your browser. Write code to make the
test suite pass.

![GroceryList.js Jasmine Specs](https://s3.amazonaws.com/horizon-production/images/grocery-list-js-specs.png)

## Meeting Expectations Requirements

* Edit the `public/js/GroceryItem.js` and `public/js/GroceryList.js` files to make the test suite green.
* **DO NOT** modify the code in the `public/js/spec` folder.
* All tests must pass.

### Tips

* Focus on one failing test at a time, starting from the top, and working down.
* Look at how the test is calling your JavaScript classes. The failing tests will
  tell you which file and line number to look at.
* **DO NOT** start the requirements necessary to Exceed Expectations until you
  have completed the requirements necessary to Meet Expectations.

## Exceeding Expectations Requirements

Open the following link in the browser <http://localhost:4567/groceries>.

Here you will see a form for groceries, but no groceries will appear, and
submitting a grocery will not actually create a grocery.

`app.rb` contains API endpoints to get groceries and post a new
grocery. In `public/js/main.js`, write javascript code that
**MUST** do the following:

### Part 1
* Use fetch or AJAX to retrieve groceries from `app.rb`.
* Create a `GroceryItem` and `GroceryList` objects with the retrieved data.
* Insert the HTML representation of the `GroceryList` into the main div on the page.

### Part 2
* Within the document.ready function, create an eventListener for
the `Add` button for a new grocery.
* When the button is clicked, a request should be sent using fetch
or AJAX to post a grocery through the server.
* After the grocery is successfully posted, append the grocery list
on the page and clear the forms of any existing values.
