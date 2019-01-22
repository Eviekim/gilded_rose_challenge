

class GildedRose

  # attr_reader :brie, :backstage, :sulfuras_item, :conjured_item, :items,
  #             :generalitems, :agedbrie, :backstagepass, :conjured, :sulfuras

  def initialize(items)
    @items = items
  end

  def general(item)
    if item.quality == 0 and item.sell_in > 0
      item.sell_in -= 1
    elsif item.quality > 0 and item.sell_in > 0
      item.quality -= 1 and item.sell_in -= 1
    elsif item.quality > 0 and item.sell_in = 0
      item.quality -= 2
    end
  end

  def aged_brie(item)
    if item.quality == 50 and item.sell_in > 0
      item.sell_in -= 1
    elsif item.quality == 49 and item.sell_in > 0
      item.quality += 1 and item.sell_in -= 1
    elsif item.quality < 49 and item.sell_in == 0
      item.quality += 2
    else item.quality < 50 and item.sell_in == 0
      item.quality += 1
    end
  end

  def sulfuras(item)
  item.quality = item.quality and item.sell_in = item.sell_in
  end

 def backstage_pass(item)
   if item.sell_in == 0
    item.quality = 0
   elsif item.quality == 50 and item.sell_in > 0
    item.sell_in -= 1
   elsif item.quality < 50 and item.sell_in > 10
    item.quality += 1 and item.sell_in -= 1
   elsif item.quality < 48 and item.sell_in < 6
    item.quality += 3 and item.sell_in -= 1
   else item.quality < 50 and item.sell_in < 11
    item.quality += 2 and item.sell_in -= 1
   end
end

  def update_quality()
    brie = "Aged Brie"
    backstage = "Backstage passes to a TAFKAL80ETC concert"
    sulfuras = "Sulfuras, Hand of Ragnaros"


    @items.each do |item|

    if item.name != brie and item.name != backstage and item.name != sulfuras
       general(item)
    elsif item.name == brie
          aged_brie(item)
    elsif item.name == backstage
          backstage_pass(item)
    else item.name == sulfuras
          sulfuras(item)
        end
      end
    end

  end
      # # first!!!
      # if item.name != bire and item.name != backstage
      #   if item.quality > 0 and item.name != sulfuras
      #       item.quality = item.quality - 1
      #     end
      #
      # else
      #   if item.quality < 50
      #     item.quality = item.quality + 1
      #
      # # second!!!
      # if item.name == backstage
      #       if item.sell_in < 11
      #         if item.quality < 50
      #           item.quality = item.quality + 1
      #         end
      #       end
      #     end
