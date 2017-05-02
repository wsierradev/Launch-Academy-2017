### Introduction

Winter is coming.

At the slightest hint of snow in the Northeast United States, the demand for
milk, bread, and eggs, skyrockets. Grocery store shelves are left barren of
these key ingredients.  

We can only assume that the
[French Toast Alert level](http://www.universalhub.com/french-toast)
is on the rise.


### Getting Started

Open up the terminal and use the following instructions to get started.

```no-highlight
$ cd ~/challenges       # for Mac/Linux
$ cd %HOME%/challenges  # for Windows
$ et get french-toast-expedition
```

Open the `french-toast-expedition` project folder in your editor.

Open the `french-toast-expedition/index.html` file in your browser.

In the browser, open up the JavaScript console. You will be saving your
code in `main.js`. Then, you can refresh the page in order to see your changes.


### Elevated Conditions

Let's get to the grocery store before there's nothing left!

Write some JavaScript code to calculate the cost of purchasing the following:

* A loaf of bread: $1.99
* A gallon of milk: $3.89
* One dozen eggs: $2.29

Output the total to the JavaScript Console.

{% show_hint %}
Use variables to store the numerical prices for each item. Then, add up the
variables and `console.log` the results.
{% endshow_hint %}

{% show_solution %}
```no-highlight
let bread = 1.99;
let milk = 3.89;
let eggs = 2.29;
let total = bread + milk + eggs;
console.log(total);
```
{% endshow_solution %}


### Severe Conditions!

We have a [Nor'easter](https://en.wikipedia.org/wiki/Nor%27easter) sweeping
through that's going to leave us under three-stories of snow!

Our precious French Toast ingredients are now three times the original price!
Nothing will stop us from making our beloved french toast!

Write some JavaScript code to calculate the cost of purchasing French Toast
ingredients at 3x the market rate.

{% show_hint %}
Reuse the variables from before to make your calculation.
{% endshow_hint %}

{% show_solution %}
```no-highlight
let severeTotal = 3 * total;
console.log(severeTotal);
```
{% endshow_solution %}


### Submitting Your Code

Once you have completed this exercise, use the `et` command to submit your code
from this project's folder.

```no-highlight
$ cd ~/challenges/french-toast-expedition       # for Mac/Linux
$ cd %HOME%/challenges/french-toast-expedition  # for Windows
$ et submit
```
