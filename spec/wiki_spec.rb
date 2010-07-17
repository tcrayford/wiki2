require 'lib/spec'
require 'lib/wiki'
require 'lib/page'
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
