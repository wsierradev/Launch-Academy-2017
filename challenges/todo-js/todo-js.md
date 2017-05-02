## Instructions

In this challenge, you will build a ToDo list app using HTML and JavaScript.

### Getting Set Up

```no-highlight
$ cd ~/challenges       # for Mac/Linux
$ cd %HOME%/challenges  # for Windows
$ et get todo-js
```

Open the `todo-js` **project folder** in your editor.

Open the `todo-js/index.html` file in your browser.

## Meeting Expectations Requirements

In `main.js`, create an array that will hold your ToDo list items. Populate your
list with a few items of your choosing. If you are feeling uninspired, here's a
list.

* Write some JavaScript
* Submit System Check
* Take a Break

Use this array to build a HTML unordered list, and insert it into the page. A
`ul` element with an id of `todo-list` has been provided.

### Tips

* **DO NOT** start the requirements necessary to Exceed Expectations until you have completed the requirements necessary to Meet Expectations.
* Submit your code with `et submit` before attempting the Exceeding Expectations Requirements.

## Exceeding Expectations Requirements

```no-highlight
As a ToDo.js user
I want to add items to my list
So that I can keep track of all the things I need to do.
```

Your write some HTML and JavaScript to satisfy the following requirements:

* Create a text field for entering in a todo list item.
* When the user presses the `Enter` or `Return` key, add the item to the page.
  Then, clear the text field.

The following block of code will detect when the `Enter` key is pressed within an
input field with an id of `new-todo-item`.

```no-highlight
let inputTodoItem = document.getElementById('new-todo-item');
inputTodoItem.addEventListener('keyup', (event) => {
  if (event.keyCode == 13) {
    event.preventDefault();
    // add inputTodoItem.value to the unordered list
  }
});
```

### Submitting Your Code

Once you have completed this challenge, use the `et` command to submit your code
from this project's folder.

```no-highlight
$ cd ~/challenges/todo-js       # for Mac/Linux
$ cd %HOME%/challenges/todo-js  # for Windows
$ et submit
```
