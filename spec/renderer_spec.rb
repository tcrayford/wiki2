require File.expand_path('../../lib/renderer',__FILE__)
require File.expand_path('../../lib/page',__FILE__)
require File.expand_path('../../lib/spec',__FILE__)

describe "renderer" do
  before do
    @page = Page.new('title','body')
    @result = PageRenderer.new(@page).render_show
  end
  describe "render_show" do
    context "with no links" do

      it "renders the title" do
        expect @result.include? @page.title
      end

      it "renders the body" do
        expect @result.include? @page.body
      end
    end

    context "with links" do
      it "converts the link into an <a> tag" do
        page = Page.new('title','[[bacon]]')
        result = PageRenderer.new(page).render_show
        expect result.include? "<a href=\"/bacon\">"
      end
    end
  end
  describe "#render_edit" do
    before do
      @result = PageRenderer.new(@page).render_edit
    end
    it "renders the title" do
      expect @result.include? @page.title
    end

    it "renders the body" do
      expect @result.include? @page.body
    end
  end
end
