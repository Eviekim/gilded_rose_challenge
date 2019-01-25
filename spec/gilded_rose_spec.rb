require 'gilded_rose'
require 'item'
require 'sulfuras'

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

 # describe Sulfuras do
 #   it "does not decrease its quality" do
 #
 #   end
 # end

  describe backstage_pass do
    it "increases its quality by 1 if sell_in > 10" do
      item = Item.new("Backstage passes to a TAFKAL80ETC concert", 12, 21)
      GildedRose.new([item]).update_quality
      expect(item.quality).to eq(30)

      expect(item.quality).to eq(33)
    end

    it "increases its quality three times if a sell_in =< 5" do
      item = Item.new("Backstage passes to a TAFKAL80ETC concert", 4, 21)
      GildedRose.new([item]).update_quality
      expect(item.quality).to eq(30)
    end

    it "the quality can be zero if a sell_in is zero" do
      item = Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 21)
      GildedRose.new([item]).update_quality
      expect(item.quality).to eq(0)

      expect(item.quality).to eq(50)
    end

    it "increases its quality to 50 when it is at 49" do
      item = Item.new("Backstage passes to a TAFKAL80ETC concert", 12, 49)

      GildedRose.new([item]).update_quality
      expect(item.quality).to eq(50)
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
