require 'gilded_rose'
require 'item'
# require 'sulfuras'
require 'backstage_pass'
require 'generalitems'

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

 describe "sell_in can has impact on the quality of item" do
   it "when sell_in has passed, Quality degrades by 2" do
     item = Item.new("bun", 0, 6)
     GildedRose.new([item]).update_quality
     expect(item.quality).to eq(4)
   end
 end

 describe "The quality of the item"
  it "quality cannot be lower than 0" do
    item = Item.new("mooncake", 4, 1)
    GildedRose.new([item]).update_quality
    expect(item.quality).to eq(0)
  end

 describe "Once the sell by date has passed" do
   it "Quality degrades twice as fast" do
     item = Item.new("mochi", 0, 4)
     GildedRose.new([item]).update_quality
     expect(item.quality).to eq(2)
   end
 end


  # describe AgedBrie do
  #   it "increases in Quality the older it gets" do
  #     item = Item.new("aged bire", 30, 6)
  #     GildedRose.new([item]).update_quality
  #     expect(item.quality).to eq(7)
  #   end
  # end
 # describe Sulfuras do
 #   it "does not decrease its quality" do
 #
 #   end
 # end

  describe BackstagePass do
    it "increases its quality by 1 if sell_in > 10" do
      item = Item.new("Backstage passes to a TAFKAL80ETC concert", 12, 21)
      GildedRose.new([item]).update_quality
      expect(item.quality).to eq(22)

    end

    it "increases its quality three times if a sell_in =< 5" do
      item = Item.new("Backstage passes to a TAFKAL80ETC concert", 4, 21)
      GildedRose.new([item]).update_quality
      expect(item.quality).to eq(24)
    end

    it "the quality can be zero if a sell_in is zero" do
      item = Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 21)
      GildedRose.new([item]).update_quality
      expect(item.quality).to eq(0)

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
  describe "Conjured items - no idea what they are..." do
    it "decreases twice faster than general tiems" do
      item = Item.new("Conjured",3, 25)
      GildedRose.new([item]).update_quality
      expect(item.quality).to eq(23)
    end

    it "decreases sell_in by 1 a day" do
      item = Item.new("Conjured",3, 25)
      GildedRose.new([item]).update_quality
      expect(item.sell_in).to eq(2)
    end

    it "quality can be 0 when sell_in is 0" do
      item = Item.new("Conjured",0, 25)
      GildedRose.new([item]).update_quality
      expect(item.quality).to eq(0)
    end

    it "sell_in can be 0 when quality is 0" do
      item = Item.new("Conjured",3, 0)
      GildedRose.new([item]).update_quality
      expect(item.sell_in).to eq(0)
    end
  end

end
