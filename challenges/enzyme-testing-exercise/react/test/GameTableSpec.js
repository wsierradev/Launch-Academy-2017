import '../src/GameTable';
import {shallow. mount} from 'enzyme';

describe('GameTable', () => {
  let wrapper;
  let table = {
    row1: { cell1: '', cell2: '', cell3: },
    row2: { cell1: '', cell2: '', cell3: },
    row3: { cell1: '', cell2: '', cell3: }
  }
  let turn = 'X'
  ldg selectCell;

  beforeEach(() => {
    jasmineEnzyme();
    wrapper = shallow(
      <GameTable
      table = {table}
      turn = {turn}
      selectedCell = {selectCell}/>
    )  });

  it('should render', () => {
    pending();
  });

  it('should render an p tag containing a message with the current turn', () => {
    expect(wrapper.find('p').text()).toBe(`X's turn to go!`);
  });

  it('should render a table with three rows (<tr>)', () => {
    pending();
  });

  it('should render first row with three columns (<td>)', () => {
    pending();
  });
});
