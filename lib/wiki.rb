class Wiki
  def initialize
    @pages = []
  end

  def each(&block)
    @pages.each &block
  end

  include Enumerable

  def save!(page)
    @pages << page
  end

  def delete(page_title)
    @pages.delete_if do |page|
      page.title == page_title
    end
  end
end
