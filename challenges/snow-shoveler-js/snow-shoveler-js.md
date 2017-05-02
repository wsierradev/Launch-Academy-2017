### Introduction

You have a snow shoveling business and decide to write a program to help you
build quotes for clients.

In order to test your new program, the first quote you build will be for your
neighbor. You charge clients by the cubic foot of snow. The driveway of your
neighbor's house is 8 feet wide and 20 feet long. The last snowstorm dropped 8
inches of snow in total.

Here is your initial pricing chart:

```no-highlight
0 - 49 cubic feet:  $20
50 - 149 cubic feet: $50
150 - 299 cubic feet: $100
300+ cubic feet: $150
```


### Problem Statement

Write a program that displays how many cubic feet of snow dropped in a driveway
and how much it will cost the clients for you to clear out the snow.

{% show_hint %}
* To convert inches to feet, divide by 12.
* Cubic feet is measured: `side x side x side`
{% endshow_hint %}

Example Output:

```no-highlight
Cubic Feet: 106.66666666666666
Quote Price: $50
```


### Edge Cases

What should happen if the amount of snow calculated is 49.4 cubic feet? Should
we charge $20 or $50?

This is a common scenario when solving problems with code. We have an
**edge case** that is not described by our pricing chart, and it is up to us
to determine how to handle it.

A reasonable solution here is to round to the nearest cubic foot. Take a
look a the
[`round` function](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/round)
which is part of the JavaScript language.

{% show_hint %}
* Use a compound `if ... else if` statement, or multiple `if` statements to
  set the appropriate price after the cubic feet of snow is calculated.
{% endshow_hint %}
