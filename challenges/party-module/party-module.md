## Introduction

Do you hear that noise? The rumbling of fun in the distance, the carefree destruction of our free time and supply of intoxicants...


## It's Party Time.

In the associated `code.rb` file, we've defined a `module`, `PartyGoer`, that we're going to use to define the behavior of the people invited to the party! When each guest comes in, we're going to include this module in them, and pass its methods on!


Our parties have simple rules:

- Party goers should be able to `#drink`, `#sing`, and `#cause_havoc`.
- `#drink` returns `true` until you try to have a fourth drink, after which it returns `false`.
- `#sing` should always return a string.
- While we don't have any *explicit* ways to create havoc, calling `#cause_havoc` should print out the chorus to your favorite [party anthem](https://www.google.com/search?q=party+rock+anthem+lyrics). Or, you could utilize the `say` command coupled with a [`system` call](https://ruby-doc.org/core/Kernel.html#method-i-system) to chant "Party party party!" (Mac OS, only).
- The `PartyGoer` module should have an `invited?` method. When the `Launcher` class includes the `PartyGoer` module, `invited?` should be a class method in the `Launcher` class that returns `true`.
- As a "stretch goal", write unit tests for your module.
