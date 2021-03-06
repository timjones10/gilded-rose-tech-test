require_relative 'item'

class GildedRose

  def initialize(items)
    @items = items
  end

#   def update_quality()
#     @items.each do |item|
#       if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
#         if item.quality > 0
#           if item.name != "Sulfuras, Hand of Ragnaros"
#             item.quality = item.quality - 1
#           end
#         end
#       else
#         if item.quality < 50
#           item.quality = item.quality + 1
#           if item.name == "Backstage passes to a TAFKAL80ETC concert"
#             if item.sell_in < 11
#               if item.quality < 50
#                 item.quality = item.quality + 1
#               end
#             end
#             if item.sell_in < 6
#               if item.quality < 50
#                 item.quality = item.quality + 1
#               end
#             end
#           end
#         end
#       end
#       if item.name != "Sulfuras, Hand of Ragnaros"
#         item.sell_in = item.sell_in - 1
#       end
#       if item.sell_in < 0
#         if item.name != "Aged Brie"
#           if item.name != "Backstage passes to a TAFKAL80ETC concert"
#             if item.quality > 0
#               if item.name != "Sulfuras, Hand of Ragnaros"
#                 item.quality = item.quality - 1
#               end
#             end
#           else
#             item.quality = item.quality - item.quality
#           end
#         else
#           if item.quality < 50
#             item.quality = item.quality + 1
#           end
#         end
#       end
#     end
#   end
# end

  def update_quality()
    @items.each do |item|
       if item.name == "Aged Brie"
         update_quality_Aged_Brie(item)
       elsif item.name == "Sulfuras, Hand of Ragnaros"
           update_quality_Sulfuras(item)
         elsif item.name == "Backstage passes to a TAFKAL80ETC concert"
             update_quality_Backstage(item)
           else
          update_quality_normal(item)
      end
    end
  end

  def update_quality_Aged_Brie(item)
      item.sell_in -= 1
      return if item.quality >= 50
      item.sell_in <= -1 ? item.quality += 2 : item.quality += 1
  end

  def update_quality_Sulfuras(item)
  end

  def update_quality_normal(item)
      item.sell_in -= 1
      return if item.quality == 0
      return if item.quality >= 50
      item.sell_in <= -1 ? item.quality -= 2 : item.quality -= 1
  end
  def update_quality_Backstage(item)
      item.sell_in -= 1
      return if item.quality == 0
      if item.sell_in > 10
        item.quality += 1
      elsif item.sell_in > 5
        item.quality += 2
      elsif item.sell_in > 0
        item.quality += 3
      else
        item.quality = 0
      end
      if item.quality >= 50
        item.quality == 50
      end
  end

end
