require 'lib/parser'
require 'lib/spec'

def extract(text) #{{{
  return LinkParser.new(text).extract
end #}}}

describe "parser" do
  context "no links" do
    it "returns an empty array for no text" do
      expect_equal extract(''), []
    end

    it "returns an empty array with some text" do
      expect_equal extract('body'), []
    end
  end
  it "extracts a single link" do
    expect extract('[[article]]').include? 'article'
  end
  
  it "extracts another link" do
    expect extract('[[bacon]]').include? 'bacon'
  end
  it "extracts links with spaces" do
    expect extract('[[another article]]').include? 'another article'
  end

  it "extracts two links" do
    expect_equal extract('[[one]] [[two]]'), ['one', 'two']
  end
end
