## Apply your understanding of fetch and JQuery
Now that you have become familiar with some of the utility of fetch, update the following from the code example in [ES6 Fetch API](https://learn.launchacademy.com/lessons/es6-fetch-api) reading to append new list items of the books data received from the fetch and append a list element with each book name to the unordered list on the index page.  JQuery  has already been loaded into the layout script so feel free to use jQuery to append to the page.

```javascript
// app.js
// change the following code to append list elements for each book
fetch('http://localhost:4567/books.json')
  .then(response => {
    if (response.ok) {
      return response;
    } else {
      let errorMessage = `${response.status} (${response.statusText})`,
          error = new Error(errorMessage);
      throw(error);
    }
  })
  .then(response => response.text())
  .then(body => {
    console.log(body);
    let bodyParsed = JSON.parse(body);
    console.log(bodyParsed);
  })
  .catch(error => console.error(`Error in fetch: ${error.message}`));
```
