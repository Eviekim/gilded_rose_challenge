require_relative 'conjured'
require_relative 'sulfuras'
require_relative 'generalitems'
require_relative 'aged_brie'
require_relative 'backstagepass'

class GildedRose

  # attr_reader  :brie, :backstage, :sulfuras_item, :conjured_item, :items,
  #              :generalitems, :agedbrie, :backstagepass, :conjured, :sulfuras

  def initialize(items)
    @items = items
    @conjured = conjured
    @sulfuras = sulfuras
    @generalitems = generalitems
    @agedbrie = agedbrie
    @backstagepass = backstagepass

    conjured = Conjured.new
    sulfuras = Sulfuras.new
    generalitems = Generalitems.new
    agedbrie = AgedBrie.new
    backstagepass = BackStagePass.new
  end


  def update_quality()
    brie = "Aged Brie"
    backstage = "Backstage passes to a TAFKAL80ETC concert"
    sulfuras = "Sulfuras, Hand of Ragnaros"
    conjured = "Conjured"

    @items.each do |item|

    if item.name != brie and item.name != backstage and item.name != sulfuras and item.name != conjured
       @generalitems.general(item)
    elsif item.name == brie
          @agedbrie.aged_brie(item)
    elsif item.name == backstage
          @backstagepass.backstage_pass(item)
    elsif item.name == sulfuras
          @sulfuras.sulfuras(item)
    else item.name == conjured
          @conjured.conjured(item)
        end
      end
    end

  end
