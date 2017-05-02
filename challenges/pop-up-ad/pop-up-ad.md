You have sold your soul by taking a job to create a pop-up ad in React.
The pop-up ad design is the following:

![Pop-up_ad_root_image][pop-up_ad_root_image]

Your job is to set up React in your application and render the pop-up ad to the page! Don't worry too much about the styling before you get the required functionality working.

## Setup
From your challenges directory, run the following

```sh
$ et get pop-up-ad
$ cd pop-up-ad
$ npm install
$ webpack-dev-server
```
This will run a Webpack Dev Server with Babel.
If you go to [localhost:8080](localhost:8080), there will be nothing displayed on the page and there should be no errors in your console.

## Part 1
1) Enable your application to use React.

2) Create a React component class to render the HTML elements needed for the ad. You may modify `index.html` to add a `div` element which React will utilize. Your component should be structured something like this:
```js
// Popup.js
import React from 'react';

class Popup extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return(
      <div>
      </div>
    );
  }
};

export default Popup;
```

3) When you click on the [close icon][fa-times] at the top-right of the ad, you should see a [confirm][mdn-confirm] box with the text "Are you sure?". Choosing "OK" or "Cancel" does not do anything because ads are annoying and never go away no matter how hard you try to get rid of them.

React has a slightly different way of [handling events][react-eventhandlers] than regular Javascript. Use React event handlers for the close button and the form submission.

4) For now, submitting the form should [cancel][mdn-preventdefault] the submission event and output "Form Submitted" to the console in your Chrome Developer Tools. One day you will update this event handler to send the email to a server which spams gullible people for eternity, but today is not that day.


## Part 2
1) We want to make sure people take the time to read the ad, so we're going to make it even harder to close. Modify the ad component to store how many times the user has clicked the close button in its `state`, and make it so the user has to click on it three times before the confirm box shows up. The ad still shouldn't close no matter what the user does.

2) The ad has been wildly successful, and your company wants to make more of them to capitalize on the popularity of other artists. Refactor your ad component so that you can pass it the name of an artist or show as part of `props`, and have it display that instead of "Taylor Swift". Modify your `main.js` file to pass in a different name to your component.

## Optional
You are a professional front-end developer, so make sure your ad visually matches the design even though it's horrible.

## Pro Tips
* [Foundation][foundation] and [Font Awesome][font-awesome] are available for you to use via a CDN.
* Remember to bind `this` for your event handlers. If you're getting an error that looks something like this: `Cannot read property 'state' of null`, that's probably why.

[fa-times]: http://fortawesome.github.io/Font-Awesome/icon/times/
[font-awesome]: http://fortawesome.github.io/Font-Awesome/
[foundation]: http://foundation.zurb.com/
[mdn-confirm]: https://developer.mozilla.org/en-US/docs/Web/API/Window/confirm
[mdn-preventdefault]: https://developer.mozilla.org/en-US/docs/Web/API/Event/preventDefault
[react-eventhandlers]: https://facebook.github.io/react/docs/handling-events.html
[pop-up_ad_root_image]: https://s3.amazonaws.com/horizon-production/images/pop-up_ad_root.png
