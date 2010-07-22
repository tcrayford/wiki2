require File.expand_path('../../lib/page',__FILE__)
require File.expand_path('../../lib/spec',__FILE__)

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
      expect_equal @page.body, 'another body'
    end
  end
end
