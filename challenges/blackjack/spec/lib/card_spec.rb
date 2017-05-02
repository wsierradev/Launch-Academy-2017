require "spec_helper"

RSpec.describe Card do
    let(:card) {Card.new("A","♦")}
    let(:card_two) {Card.new("K","♦")}

    describe "New card" do
      context "New card" do
        it "expects Ace card to return true" do
          # use `expect` to test assertions
          expect(card).to be_a(Card)
        end
      end
    end


    describe "#is_ace?" do
      context "Ace Card" do
        it "expects Ace card to return true" do
          # use `expect` to test assertions
          expect(card.is_ace?).to eq(true)
        end
      end
      context "King Card" do
         it "expects King card to return false" do
           expect(card_two.is_ace?).to eq(false)
         end
       end
     end
    describe "#is_ace?" do
      context "Ace Card" do
        it "expects Ace card to return true" do
           expect(card_two.is_face_card?).to eq(true)
        end
      end
         context "King Card" do
            it "expects King card to return false" do
              expect(card.is_face_card?).to eq(false)
            end
          end
    end
end
