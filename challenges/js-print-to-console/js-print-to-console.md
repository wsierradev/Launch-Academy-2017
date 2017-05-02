### Introduction

Your `challenges` folder will soon become a valuable resource. It will contain
examples of all the JavaScript programming concepts you have learned!

To that end, let's document how to **write to the console in JavaScript**.

This is a useful task when debugging your code. You can print out values of your
variables, and test that your code is working the way you expect.


### Getting Started

Open up the terminal and use the following instructions to get started.

```no-highlight
$ cd ~/challenges       # for Mac/Linux
$ cd %HOME%/challenges  # for Windows
$ et get js-print-to-console
```

Open the `js-print-to-console` **project folder** in your editor.

Open the `js-print-to-console/index.html` file in your browser.

In the browser, open up the JavaScript console. You will be saving your
code in `main.js`. Then, you can refresh the page in order to see your changes.


### Instructions

![Image of the expected output](https://s3.amazonaws.com/horizon-production/images/js-print-to-console.png)

You have been provided with two empty files:

* `index.html`
* `main.js`

The `index.html` file needs to contain some boilerplate HTML code, as well as a
`<script>` tag, to load the `main.js` JavaScript file.

```html
<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <title>JavaScript</title>
    <link href="style.css" rel="stylesheet">
    <script src="main.js" defer></script>
  </head>

  <body>
    <h1>console.log()</h1>
    <p>
      The <code>console.log()</code> command will print the contents of a
      variable to the JavaScript Console.
    </p>
  </body>
</html>
```

The `main.js` file should contain our code example. Use `console.log()` to print
the number `42` to the console. Test that your code is working by refreshing
the browser window.

{% show_solution %}
```no-highlight
let theAnswer = 42;
console.log(theAnswer);
```
{% endshow_solution %}


Next, add some code to print your name to the console.

{% show_solution %}
```no-highlight
let name = 'Richard';
console.log(name);
```
{% endshow_solution %}


### Submitting Your Code

Once you have completed this exercise, use the `et` command to submit your code
from this project's folder.

```no-highlight
$ cd ~/challenges/js-print-to-console       # for Mac/Linux
$ cd %HOME%/challenges/js-print-to-console  # for Windows
$ et submit
```
