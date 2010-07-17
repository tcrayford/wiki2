require 'lib/page'
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
      expect_equal @page.body, 'another body'
    end
  end
end
