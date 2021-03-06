require File.expand_path('../../lib/parser',__FILE__)
require File.expand_path('../../lib/spec',__FILE__)

def extract(text)
  return LinkScanner.new(text).extract
end

describe "parser" do
  context "no links" do
    it "returns an empty array for no text" do
      expect_equal extract(''), []
    end

    it "returns an empty array given some text" do
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
