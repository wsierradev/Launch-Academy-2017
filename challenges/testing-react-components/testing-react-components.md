## Learning Objectives
* Understand the purpose of the Enzyme library.
* Setup Enzyme with Karma and Jasmine.
* Learn to test React components with Enzyme.

## Introduction
We've used Jasmine to write and run tests for Javascript code, but how do we test React components? React testing can be tricky because many libraries have a limited ability to traverse parent/child component "trees" and to deal with asynchronous Javascript. Luckily, we can use the well-documented Enzyme library created by AirBnb. Enzyme can be used with Karma, Jasmine, and Phantom JS for feature testing. But first, some introductions.

#### Karma
[Karma][karma-docs] is a test-runner for JavaScript. It can be run from the command line and will run our test suite automatically. It can also save you time because it will automatically re-run your tests every time you make a change to the source files or test files.

#### Enzyme
[Enzyme][enzyme-docs] is a library built on top of React's [Test Utilities][react-docs-test-utils] add on. Together, they provide the ability to navigate component trees, simulate events (like clicking or scrolling), and test component lifecycle methods (like `componentDidMount`).

#### Jasmine
We've used [Jasmine][jasmine-docs] before to test our Vanilla JS code. By using `jasmine-enzyme`, we have access to all of Jasmine's built-in matchers such as `toBePresent`, `toEqual`, and `toBeDefined`.

#### PhantomJS
[PhantomJS][phantomjs-docs] is a headless browser. If we remember that JavaScript "lives" in the browser, we can think of PhantomJS as a way to test our JavaScript/JSX output from the command line instead of having to run a web browser.


## Setup
First, clone down [this
repository][testing-react-components-repository].

Navigate to the `testing-react-components` directory in your terminal and then run the following.:

```sh
npm install --save-dev jasmine-core karma karma-jasmine
```

This will install both Jasmine and Karma, and will enable Jasmine to run in the Karma test-runner.

Next, run:

```sh
npm install -g karma-cli
```
This will allow karma to run from the terminal.

We'll also need to install a json-loader by running from the command line:

```sh
npm install --save-dev json-loader
```

and adding the following to our karma to the loaders property of the webpack property of our `karma.config.js`:

```javascript
  {
    test: /\.json$/,
    include: [
      /node_modules/,
      path.resolve(__dirname, '..')
    ],
    loader: 'json-loader'
  }
```

Next, we want to install PhantomJS:
```sh
npm install --save-dev karma-phantomjs-launcher phantomjs-prebuilt
```
This command will also make sure that PhantomJS runs automatically when Karma runs.

To install enzyme, we will run the following:

```sh
npm install --save-dev enzyme react-addons-test-utils
```

This installs both the enzyme library and the [`react-addons-test-utils`][react-docs-test-utils] peer dependency. Then, navigate to the `karma.conf.js` file and add the following `externals` property to the `webpack` section:

```javascript
// karma.conf.js
...
  // webpack configuration used by karma-webpack
  webpack: {
    // generate sourcemaps
    devtool: 'eval-source-map',
    // enzyme-specific setup
    externals: {
      'cheerio': 'window',
      'react/addons': true,
      'react/lib/ExecutionEnvironment': true,
      'react/lib/ReactContext': true
    },
    module: {
      loaders: [
        // use babel-loader to transpile the test and src folders
        {
          test: /\.jsx?$/,
          exclude: /node_modules/,
          loader: 'babel'
        },
        // use isparta-loader for ES6 code coverage in the src folder
        {
          test: /\.jsx?$/,
          exclude: /(node_modules|test)/,
          loader: 'isparta'
        }
      ]
    },

    // relative path starts out at the src folder when importing modules
    resolve: {
      root: path.resolve('./src')
    }
  },
...
```

This change in our `karma.conf.js` allows us to ignore certain files when we are [using Enzyme with
Webpack][enzyme-docs-using-enzyme-with-webpack].

At this point, we are all set up to use Enzyme. However, we will also install
[`jasmine-enzyme`][npm-jasmine-enzyme] to use all of Jasmine's handy matchers in our Enzyme tests. To install we run:

```sh
$ npm install --save-dev jasmine-enzyme
```

Now that the setup is done, let's write some tests!

## Testing a React Application
The relevant files in our application are:

```javascript
// main.js
import 'babel-polyfill';
import './main.scss';
import React from 'react';
import ReactDOM from 'react-dom';
import ElephantContainer from './components/ElephantContainer';

ReactDOM.render(
  <ElephantContainer />,
  document.getElementById('app')
);
```

```javascript
// src/components/ElephantContainer.js
import React, { Component } from 'react';
import Elephant from './Elephant';

class ElephantContainer extends Component {
  constructor(props) {
    super(props);
    this.state = { babyElephant: false };
    this.handleClick = this.handleClick.bind(this);
  }

  handleClick() {
    let nextBabyElephant = !this.state.babyElephant;
    this.setState({ babyElephant: nextBabyElephant });
  }

  render() {
    let image, text;

    if (this.state.babyElephant) {
      image = 'http://akns-images.eonline.com/eol_images/Entire_Site/201438/rs_560x415-140408154504-1024.baby-elephant-grass.ls.4814.jpg';
      text = 'Look at the baby elephant!';
    } else {
      image = 'https://animalcorner.co.uk/wp-content/uploads/2015/02/elephant-1.jpg';
      text = 'that\'s a big elephant';
    }

    return (
      <div>
        <Elephant
          image={image}
          onClick={this.handleClick}
          text={text}
        />
      </div>
    );
  }
}

export default ElephantContainer;
```

```javascript
// src/components/Elephant.js
import React from 'react';

const Elephant = props => {
  const { image, onClick, text } = props;

  return (
    <div onClick={onClick} className="center">
      <img src={image} height="400" width="600" />
      <h1>{text}</h1>
    </div>
  );
};

export default Elephant;

```

When the page loads, we see the initial state of our application:

![Testing React Components 1][testing-react-components-1]

Clicking on the elephant changes the state of our application to `babyElephant: true`, and changes the image and text to:

![Testing React Components 2][testing-react-components-2]

If we click on the elephant again, we go back to the initial state:

![Testing React Components 1][testing-react-components-1]

To recap, our component tree exists of an `ElephantContainer` which has a method to change the state of `babyElephant` from `false` to `true` and back. It also sets the `image` and `text` properties appropriately. The `ElephantContainer` then renders the `Elephant` presentational component, which has the event listener for the `handleClick` function.




### Testing Presentational React Components

This application is untested, so let's start to fix that by first writing a test
for `Elephant` component, which simply returns a `<div>` with `image`, `text`, and `onClick` properties.

```javascript
// src/components/Elephant.js
import React from 'react';

const Elephant = props => {

  return (
    <div onClick={props.onClick} className="center">
      <img src={props.image} height="400" width="600" />
      <h1>{props.text}</h1>
    </div>
  );
};

export default Elephant;

```

We begin with the following test:

```javascript
// test/components/Elephant.js
import Elephant from 'components/Elephant';
import { mount } from 'enzyme';
import React from 'react';

describe('Elephant', () => {
  let image,
      onClick,
      text,
      wrapper;

  beforeEach(() => {
    wrapper = mount(
      <Elephant
        image="http://fakeurl.com/elephant"
        text="I am an Elephant!"
      />
    );
  });

  it('should render an h1 tag', () => {
    expect(wrapper.find('h1').length).toEqual(1);
  });

  it('should render an h1 tag with the text property value', () => {
    expect(wrapper.find('h1').text()).toBe('I am an Elephant!');
  });
});
```

We import the `mount` method from the Enzyme library. This method takes in a
`ReactElement` which represents a component and returns a `ReactWrapper`
object. The `mount` method essentially puts our React Element on the DOM, which in this case will be our PhantomJS headless browser. We can actually run our test files from the command line:

```sh
karma start
```

Our test asserting the presence of a rendered `h1` element works, but it does
not read well. We can use the `jasmine-enzyme` library that we installed so we
can use matchers that will increase the readability of our tests. We make the
following changes to our test:

```javascript
// test/components/Elephant.js
import Elephant from 'components/Elephant';
import { mount } from 'enzyme';
import jasmineEnzyme from 'jasmine-enzyme';
import React from 'react';

describe('Elephant', () => {
  ...

  beforeEach(() => {
    jasmineEnzyme();
    ...
  });

  it('should render an h1 tag', () => {
    expect(wrapper.find('h1')).toBePresent();
  });

  ...
});
```

Here we imported the `jasmine-enzyme` library, and invoked the `jasmineEnzyme`
function before each of our tests. This allows us to use the [`toBePresent`
matcher][jasmine-enzyme-tobepresent] which asserts for the presence of at least
one node (another name for a React HTML element) in the wrapper.

We can also test that the `Elephant` has certain `props`:

```javascript
// test/components/Elephant.js
...

describe('Elephant', () => {
  ...

  beforeEach(() => {
    jasmineEnzyme();
    wrapper = mount(
      <Elephant
        image="http://fakeurl.com/elephant"
        text="I am an Elephant!"
      />
    );
  });

  ...

  it('should render an img tag with the specific props', () => {
    expect(wrapper.find('img').props()).toEqual({
      src: 'http://fakeurl.com/elephant',
      height: '400',
      width: '600'
    });
  });
});
```

The [`props` method][enzyme-docs-full-rendering-api-props] can only be called on the wrapper of a single `ReactElement`,
and it will return the `props` of the `ReactElement`.

Awesome, but we have a dynamic web application to test. How do we test that the `Elephant` component displays the correct image and text depending on the state of the `ElephantContainer`?

### Testing Our Container Component
The code for our `ElephantContainer` is shown again here:

```javascript
// src/components/ElephantContainer.js
import React, { Component } from 'react';
import Elephant from './Elephant';

class ElephantContainer extends Component {
  constructor(props) {
    super(props);
    this.state = { babyElephant: false };
    this.handleClick = this.handleClick.bind(this);
  }

  handleClick() {
    let nextBabyElephant = !this.state.babyElephant;
    this.setState({ babyElephant: nextBabyElephant });
  }

  render() {
    let image, text;

    if (this.state.babyElephant) {
      image = 'http://akns-images.eonline.com/eol_images/Entire_Site/201438/rs_560x415-140408154504-1024.baby-elephant-grass.ls.4814.jpg';
      text = 'Look at the baby elephant!';
    } else {
      image = 'https://animalcorner.co.uk/wp-content/uploads/2015/02/elephant-1.jpg';
      text = 'that\'s a big elephant';
    }

    return (
      <div>
        <Elephant
          image={image}
          onClick={this.handleClick}
          text={text}
        />
      </div>
    );
  }
}

export default ElephantContainer;
```

Let's first write a few tests to assert the initial state of our component
and that we are rendering an `Elephant` component with the correct props:

```javascript
// test/components/ElephantContainer.js
import ElephantContainer from 'components/ElephantContainer';
import Elephant from 'components/Elephant';
import { mount } from 'enzyme';
import jasmineEnzyme from 'jasmine-enzyme';
import React from 'react';

describe('ElephantContainer', () => {
  let wrapper;

  beforeEach(() => {
    jasmineEnzyme();
    wrapper = mount(<ElephantContainer />);
  });

  it('should should have the specified inital state', () => {
    expect(wrapper.state()).toEqual({ babyElephant: false });
  });

  it('should render an Elephant Component', () => {
    expect(wrapper.find(Elephant)).toBePresent();
  });

  it('should render the Elephant Component with specific props when babyElephant is false', () => {
    expect(wrapper.find(Elephant).props()).toEqual({
      image: 'https://animalcorner.co.uk/wp-content/uploads/2015/02/elephant-1.jpg',
      onClick: jasmine.any(Function),
      text: 'that\'s a big elephant'
    });
  });
});
```

Here we use the [`state` method][enzyme-docs-full-rendering-api-state] to get
the current state of our wrapper, and assert that it matches the initial state.
In the second test, we are passing in the Elephant component to the `find` method to make sure the component is rendering. In the last test
we are asserting the props that are passed to the `Elephant` component when `babyElephant` is false are the ones we expect.

Great, but the `ElephantContainer` will pass
different props to the `Elephant` component when its state changes, so how do we
test that? We can test this by using the [`setState`
method][enzyme-docs-full-rendering-api-setstate] like so:

```javascript
// test/components/ElephantContainer.js
import ElephantContainer from 'components/ElephantContainer';
import Elephant from 'components/Elephant';
import { mount } from 'enzyme';
import jasmineEnzyme from 'jasmine-enzyme';
import React from 'react';

describe('ElephantContainer', () => {
  ...

  it('should render the Elephant Component with specific props when babyElephant is true', () => {
    wrapper.setState({ babyElephant: true });
    expect(wrapper.find(Elephant).props()).toEqual({
      image: 'http://akns-images.eonline.com/eol_images/Entire_Site/201438/rs_560x415-140408154504-1024.baby-elephant-grass.ls.4814.jpg',
      onClick: jasmine.any(Function),
      text: 'Look at the baby elephant!';
    });
  });
});
```

In this spec, we just change the state of the wrapper, and assert that the
appropriate props are now passed. We can now be confident that our `ElephantContainer` is passing the correct props to our `Elephant` component, and that our `Elephant` component is showing us the expected picture and test!


## Cleaning Up the Test Suite
Currently, we have to import the same packages in every test file and execute
`jasmineEnzyme` in a `beforeEach` function if we want to use `jasmine-enzyme`
matchers. Luckily, we can modify our `test/testHelper.js` file so we do not have
to do this for every test file. We make the following changes:

```javascript
// test/testHelper.js
import { mount } from 'enzyme';
import jasmineEnzyme from 'jasmine-enzyme';
import React from 'react';

Object.assign(global, {
  mount,
  jasmineEnzyme,
  React
});

beforeEach(() => {
  jasmineEnzyme();
});

// function to require all modules for a given context
let requireAll = requireContext => {
  requireContext.keys().forEach(requireContext);
};

// require all js files except testHelper.js in the test folder
requireAll(require.context('./', true, /^((?!testHelper).)*\.jsx?$/));

// require all js files except main.js in the src folder
requireAll(require.context('../src/', true, /^((?!main).)*\.jsx?$/));

// output to the browser's console when the tests run
console.info(`TESTS RAN AT ${new Date().toLocaleTimeString()}`);
```

Now we change our test files from this:

```javascript
// test/components/Elephant.js
import Elephant from 'components/Elephant';
import { mount } from 'enzyme';
import jasmineEnzyme from 'jasmine-enzyme';
import React from 'react';

describe('Elephant', () => {
  let image,
      onClick,
      text,
      wrapper;

  beforeEach(() => {
    jasmineEnzyme();
    wrapper = mount(
      <Elephant
        image="http://fakeurl.com/elephant"
        text="I am a Elephant!"
      />
    );
  });

  it('should render an h1 tag', () => {
  ...
  });
});
```

```javascript
// test/components/ElephantContainer.js
import ElephantContainer from 'components/ElephantContainer';
import Elephant from 'components/Elephant';
import { mount } from 'enzyme';
import jasmineEnzyme from 'jasmine-enzyme';
import React from 'react';

describe('ElephantContainer', () => {
  let wrapper;

  beforeEach(() => {
    jasmineEnzyme();
  });

  ...
});
```

to this:

```javascript
// test/components/Elephant.js
import Elephant from 'components/Elephant';

describe('Elephant', () => {
  let image,
      text,
      wrapper;

  beforeEach(() => {
    wrapper = mount(
      <Elephant
        image="http://fakeurl.com/elephant"
        text="I am a Elephant!"
      />
    );
  });

  it('should render an h1 tag', () => {
  ...
  });
});
```

```javascript
// test/components/ElephantContainer.js
import ElephantContainer from 'components/ElephantContainer';
import Elephant from 'components/Elephant';

describe('ElephantContainer', () => {
  let wrapper;
  ...

});
```

Nice!

## Final Files
For convenience, here are the final test files that were written in this article:

```javascript
// test/components/Elephant.js
import Elephant from 'components/Elephant';

describe('Elephant', () => {
  let image,
      text,
      wrapper;

  beforeEach(() => {
    wrapper = mount(
      <Elephant
        image="http://fakeurl.com/elephant"
        onClick={onClick}
        text="I am an Elephant!"
      />
    );
  });

  it('should render an h1 tag', () => {
    expect(wrapper.find('h1')).toBePresent();
  });

  it('should render an h1 tag with the text property value', () => {
    expect(wrapper.find('h1').text()).toBe('I am an Elephant!');
  });

  it('should render an img tag with the specific props', () => {
    expect(wrapper.find('img').props()).toEqual({
      src: 'http://fakeurl.com/elephant',
      height: '400',
      width: '600'
    });
  });
});

```

```javascript
// test/components/ElephantContainer.js
import ElephantContainer from 'components/ElephantContainer';
import Elephant from 'components/Elephant';

describe('ElephantContainer', () => {
  let wrapper;

  beforeEach(() => {
    wrapper = mount(<ElephantContainer />);
  });

  it('should have the specified initial state', () => {
    expect(wrapper.state()).toEqual({ babyElephant: false });
  })

  it('should render an Elephant Component', () => {
    expect(wrapper.find(Elephant)).toBePresent();
  });

  it('should render the Elephant Component with specific props when babyElephant is false', () => {
    expect(wrapper.find(Elephant).props()).toEqual({
      image: "https://animalcorner.co.uk/wp-content/uploads/2015/02/elephant-1.jpg",
      onClick: jasmine.any(Function),
      text: 'that\'s a big elephant'
    });
  });

  it('should render the Elephant Component with specific props when babyElephant is true', () => {
    wrapper.setState({ babyElephant: true });
    expect(wrapper.find(Elephant).props()).toEqual({
      image: "http://akns-images.eonline.com/eol_images/Entire_Site/201438/rs_560x415-140408154504-1024.baby-elephant-grass.ls.4814.jpg",
      onClick: jasmine.any(Function),
      text: "Look at the baby elephant!"
    })
  })

  it('should render the tree of the Elephant component', () => {
    let pageText = wrapper.text();

    expect(pageText).toMatch('that\'s a big elephant');
  });
});

```

## Summary
Front-end applications tend to grow in complexity quite quickly as user
interfaces become more interactive and the size of your application state
increases. Testing your React application will allow you to better handle this
complexity because they will inform you if new features have broken any existing ones. In this article, we introduced the Enzyme testing library, which has
an intuitive and flexible API that makes it easy to test React components. By
using Enzyme, you will have the ability to develop new features in the
application via Test-Driven Development and increase the maintainability of your
React application.

## Additional Resources
* [Enzyme Docs][enzyme-docs]
* [Enzyme Docs: Shallow Rendering API][enzyme-docs-shallow-rendering-api]
* [Enzyme Docs: Full Rendering API][enzyme-docs-full-rendering-api]
* [Jasmine Enzyme Docs][npm-jasmine-enzyme]
* [React Docs: Test Utilities][react-docs-test-utils]

[karma-docs]:https://karma-runner.github.io/0.13/index.html
[jasmine-docs]:https://jasmine.github.io/2.4/introduction.html
[phantomjs-docs]:http://phantomjs.org/
[enzyme-docs]: https://github.com/airbnb/enzyme
[enzyme-docs-full-rendering-api]: https://github.com/airbnb/enzyme/blob/master/docs/api/mount.md
[enzyme-docs-shallow-rendering-api]: https://github.com/airbnb/enzyme/blob/master/docs/api/shallow.md
[enzyme-docs-full-rendering-api-find]: http://airbnb.io/enzyme/docs/api/ReactWrapper/find.html
[enzyme-docs-full-rendering-api-props]: http://airbnb.io/enzyme/docs/api/ReactWrapper/props.html
[enzyme-docs-full-rendering-api-simulate]: http://airbnb.io/enzyme/docs/api/ReactWrapper/simulate.html
[enzyme-docs-full-rendering-api-setstate]: http://airbnb.io/enzyme/docs/api/ReactWrapper/setState.html
[enzyme-docs-full-rendering-api-state]: http://airbnb.io/enzyme/docs/api/ReactWrapper/state.html
[enzyme-docs-using-enzyme-with-webpack]: https://github.com/airbnb/enzyme/blob/master/docs/guides/webpack.md
[jasmine-docs-createspy]: http://jasmine.github.io/2.4/introduction.html#section-Spies:_<code>createSpy</code>
[jasmine-enzyme-tobepresent]: https://www.npmjs.com/package/jasmine-enzyme#tobepresent
[npm-jasmine-enzyme]: https://www.npmjs.com/package/jasmine-enzyme
[react-docs-test-utils]: https://facebook.github.io/react/docs/test-utils.html
[testing-react-components-repository]: https://github.com/amandabeiner/testing-react-components
[testing-react-components-1]: https://s3.amazonaws.com/horizon-production/images/testing-react-components-big-elephant.png
[testing-react-components-2]: https://s3.amazonaws.com/horizon-production/images/testing-react-components-baby-elephant.png
