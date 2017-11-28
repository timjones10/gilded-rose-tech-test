require './lib/gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end
  end

  describe "#update_quality" do
    it "does not allow a quality of below 0" do
      items = [Item.new("Normal", 5, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 0
    end
  end

  describe "update_quality" do
    it "Sell in reduces by 1 every day" do
      items = [Item.new("Normal", 2, 2)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 1
    end
  end

  describe "update_quality" do
    it "quality degrades twice as fast once sell by date has passed" do
      items = [Item.new("Normal", 0, 2)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 0
    end
  end

  describe "update_quality" do
    it "The quality of an item is never more than 50" do
      items = [Item.new("Aged Brie", 1, 50)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 50
    end
  end

  describe "update_quality" do
    it "Aged Brie increases in Quality the older it gets" do
      items = [Item.new("Aged Brie", 1, 1)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 2
    end
  end

  describe "update_quality" do
    it "“Sulfuras”, being a legendary item, never has to be sold" do
      items = [Item.new("Sulfuras, Hand of Ragnaros", -1, 50)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq -1
    end
  end

  describe "update_quality" do
    it "“Sulfuras”, being a legendary item, never decreases in Quality" do
      items = [Item.new("Sulfuras, Hand of Ragnaros", -1, 49)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 49
    end
  end

  describe "update_quality" do
    it "Backstage passes”, increases in Quality by 2 when there are 10 days or less" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 12
    end
  end

  describe "update_quality" do
    it "Backstage passes to a TAFKAL80ETC concert”, increases in Quality by 3 when there are 5 days or less" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 13
    end
  end

  describe "update_quality" do
    it "Backstage passes to a TAFKAL80ETC concert”, Quality drops to 0 after the concert" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 0
    end
  end

end
