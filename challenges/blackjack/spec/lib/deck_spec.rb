require "spec_helper"

RSpec.describe Deck do
      let(:newDeck) {a = Deck.new}

      describe "#deck" do
        context "New deck" do
          it "creates a new deck" do
            # use `expect` to test assertions
            expect(newDeck).to be_a(Deck)
          end
        end
        context "Card Count" do
          it "expects card count to return 52" do
            # use `expect` to test assertions
            expect(newDeck.count).to eq(52)
          end
        end
      end
        # context "card contents" do
        #   it "has a card for every rank and suit" do
        # expect(newDeck).to include(Deck::SUITS)
        #     # Deck::SUITS            Deck::RANKS
        #   end
        # end
end
