require 'lib/parser'
require 'lib/spec'

def extract(text) #{{{
  return Parser.new(text).extract
end #}}}

describe "parser" do
  it "extracts a single link" do
    expect extract('[[article]]').include? 'article'
  end
  
  it "extracts another link" do
    expect extract('[[bacon]]').include? 'bacon'
  end

  it "extracts two links" do
    expect_equal extract('[[one]] [[two]]'), ['one', 'two']
  end
end
