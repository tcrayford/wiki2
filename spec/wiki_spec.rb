require File.expand_path('../../lib/wiki',__FILE__)
require File.expand_path('../../lib/spec',__FILE__)
require File.expand_path('../../lib/page',__FILE__)

describe "Wiki" do
  context "with one page" do
    before do
      @wiki = Wiki.new
      @wiki.save!(Page.new('arr','barr'))
    end

    it "stores pages" do
      expect_equal @wiki.first.title, 'arr'
    end

    it "can delete pages" do
      @wiki.delete('arr')
      expect_equal @wiki.first, nil
    end
  end
end
