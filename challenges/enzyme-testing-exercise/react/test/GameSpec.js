import '../src/Game'
import { shallow, mount } from 'enzyme'
import GameTable from '../src/GameTable'
describe('Game', () => {
  // Write tests here to test the Game Component with the full DOM.
  // Don't forget to remove pending()!
  beforeEach(() => {
    jasmineEnzyme();
    spyOn(Game.prototype, 'selectedCell').and.callThrough();
    wrapper = shallow((<Game />))
  });

  it('should have the specified inital state', () => {
    expect(wrapper.state()).toEqual({table:{
      row1: { cell1: '', cell2: '', cell3: },
      row2: { cell1: '', cell2: '', cell3: },
      row3: { cell1: '', cell2: '', cell3: }
    },
    turn: 'X'});
  });

  it('should render an h3 (<h3>) with the title of the page', () => {
    expect(weapper.find('h3').text()).toBe('Tic Tac Toe');
  });

  it('should render the GameTable', () => {
    expect(wrapper.find('GameTable')).toBePresent();
  });

  it('should render an X when a cell is clicked during X\'s turn', () => {

    wrapper.find('cell1').simulate('click')
    expect(wrapper.find('X')).toBePresent()
  });

  it("should update who's turn it is when a cell is clicked during X\'s turn", () => {
    pending();
  });
});
