require_relative 'conjured'
require_relative 'sulfuras'
require_relative 'generalitems'
require_relative 'aged_brie'
require_relative 'backstage_pass'

class GildedRose

   attr_reader  :brie, :backstage, :sulfurasItem, :conjuredItem

  def initialize(items, generalitems = Generalitems.new, agedbire = AgedBrie.new, backstagepass = BackstagePass.new, conjured = Conjured.new, sulfuras = Sulfuras.new)
    @items = items
    @conjured = conjured
    @sulfuras = sulfuras
    @generalitems = generalitems
    @agedbrie = agedbire
    @backstagepass = backstagepass
    @brie = "Aged Brie"
    @backstage = "Backstage passes to a TAFKAL80ETC concert"
    @sulfurasItem = "Sulfuras, Hand of Ragnaros"
    @conjuredItem = "Conjured"

  end


  def update_quality()


    @items.each do |item|

    if item.name != @brie and item.name != @backstage and item.name != @sulfurasItem and item.name != @conjuredItem
       @generalitems.general(item)
    elsif item.name == @brie
          @agedbrie.aged_brie(item)
    elsif item.name == @backstage
          @backstagepass.backstage_pass(item)
    elsif item.name == @sulfurasItem
          @sulfuras.sulfuras(item)
    else item.name == @conjuredItem
          @conjured.conjured(item)
        end
      end
    end

  end
