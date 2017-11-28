require './gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "fixme"
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
    it "quality degrades twice as fast once sell by date has passed" do
      items = [Item.new("Normal", 0, 2)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 0
    end
  end

  describe "update_quality" do
    it "Aged Brie increases in Quality the older it gets" do
      items = [Item.new("Aged Brie", 1, 1)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 2
    end
  end



end