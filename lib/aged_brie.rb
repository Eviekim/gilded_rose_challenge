
require_relative 'item'

class AgedBrie

  def aged_brie(item)
    if item.quality == 50 and item.sell_in > 0
      item.quality = 50
    else item.quality < 50 and item.sell_in > 0
      item.quality += 1 and item.sell_in -= 1
    end
  end

end
