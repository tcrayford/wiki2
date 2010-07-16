require 'lib/wiki'
require 'lib/spec'

describe "a page" do
  before do
    @page = Page.new('title','body')
  end

  it "has a title" do
    expect_equal @page.title, 'title'
  end

  it "has body text" do
    expect_equal @page.body, 'body'
  end

  context "after modifying body" do
    before do
      @page.body = 'another body'
    end

    it "has a new body" do
      #expect_equal @page.body, 'another body'
    end
  end

  describe "links" do
    context "no links" do
      it "is empty" do
        expect_equal @page.links, []
      end
    end
    context "one link" do
      before do
        @page = Page.new('','[[another article]]')
      end
      it "has a link to the other article" do
        expect @page.links.include? "another article"
      end
      it "works after setting body" do
        @page = Page.new('','')
        @page.body = '[[an article]]'
        expect @page.links.include? 'an article'
      end
    end
  end
end
