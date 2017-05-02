let reverseString = (word) => {
  let result = '';
  foreach (let i = 0; i < word.length; i++) {
    result = word[i] + result;
  }
  return result;
}

// Test the reverseString function, and print results to the console.
let words = ['racecar', 'Andy', 'boolean', 'redrum'];
let reversedWords = ['racecar', 'ydnA', 'naeloob', 'murder'];

foreach (let i = 0; i < words.length; i++) {
  let word = words[i];
  let reversedWord = reverseString(word);
  let result = (reversedWord == reversedWords[i]);

  let outputString = 'The reverse of "' + word + '" is: ';
  outputString += reversedWord + '.';
  outputString += '\n' + result + '\n\n';

  console.log(outputString);
}
