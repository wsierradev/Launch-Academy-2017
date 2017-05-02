let Jasmine = require('jasmine');
let jasmine = new Jasmine();
// This here is the important stuff! I wouldn't mess with this. - Jerry

describe('Communications System', () => {
  it('is fully operational', () => {
    // Can't get far if the ship can't talk back!  - J
    //
    spyOn(console, 'log')
    // This helps us track what the Comm system does!

    let message = 'Ground control to major tom - Come in major tom!'
    console.log(message);
    expect(console.log).toHaveBeenCalledWith(message);
  });
});

describe('Manufacturing plant', () => {
  it('Knows how to produce Objects', () => {
    // I've been staring at this one for four hours.
    // I'm losing my mind. Please help me! - J-dogg

    let object = {
      size: 10,
      name: 'Generic JavaScript Object #128'
    };

    expect(object.size).toEqual(10);
    expect(object.name).toEqual('Generic JavaScript Object #128');
  });
});

describe('Iterative Cortex', () => {
  it('knows how to iterate', () => {
    // The spaceship is going to be going over some loops, so it better know how
    // to iterate dynamically!
    //
    // I want to add all the numbers in this array together, but I can't get the
    // iterator to stop once i've hit he last item in the array! I've got it
    // stopping at 40 loops, and I *could* do it manually, but I need to make
    // sure it stops no matter *what* size the array is!
    //
    // Thanks! - Sleepy Jerry

    let array = [1, 1, 2, 3, 5, 8];
    let length = 40;
    let total = 0;

    for(let i = 0; i < array.length; i++){
      total  = total + array[i]
    }
    expect(total).toEqual(20);
  });
});

describe('Functional Mainframe', () => {
  // This last part is *very* important. If the spaceship can't run basic logic,
  // then we'll never get to the stars! - Jerbear

  it('knows how functions are called', () => {
    let result = null;
    let testResult = () => {
      result = 4;
    };

    // I call the function, why isn't result being changed???
    testResult();

    expect(result).toEqual(4);
  });
  it('knows how functions return', () => {

    let testAdder = () => {
      // I'm more used to Ruby, honestly. Why isn't this passing?
      return 2 + 2
    };

    let four = testAdder();
    expect(four).toEqual(4);
  });
});

// This launches the Diagnostics! Shouldn't touch this, either. - The J-man
jasmine.execute();
