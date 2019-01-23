require 'gilded_rose'
require 'item'

describe GildedRose do

  describe "having a new item" do
    it "has a name and it cannot be changed" do
      item = Item.new("lemonade", 1, 1)
      expect(item.name).to eq "lemonade"
    end

    it "has a sell_in" do
      item = Item.new("cake", 3, 9)
      expect(item.sell_in).to eq(3)
    end

    it "has a quality" do
      item = Item.new("tea", 2, 30)
      expect(item.quality).to eq(30)
    end
  end

  describe "#update" do
    it "update a sell_in" do
      item = Item.new("katsu wrap", 7, 15)
      GildedRose.new([item]).update_quality
      expect(item.quality).to eq(14)
    end

    it "update a quality" do
      item = Item.new("coffee", 4, 12)
      GildedRose.new([item]).update_quality
      expect(item.quality).to eq(11)
    end

  end




  # describe "#update_quality" do
  #   it "does not change the name" do
  #     items = [Item.new("foo", 0, 0)]
  #     GildedRose.new(items).update_quality()
  #     expect(items[0].name).to eq "fixme"
  #   end
  # end

end
