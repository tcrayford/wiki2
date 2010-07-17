require 'lib/parser'
class Page
  attr_reader :title, :links
  attr_accessor :body
  def initialize(title,body='')
    @title = title
    @body = body
    @links = scan_links(body)
  end

  def body=(text)
    @body = text
    @links = scan_links(body)
  end

  private
  def scan_links(string)
    LinkScanner.new(string).extract
  end
end
