require 'erb'
class PageRenderer
  def initialize(page)
    @page = page
    @show_template = load_template :show
    @edit_template = load_template :edit
    setup_properties
  end

  def load_template(template)
    path = File.expand_path("../../views/#{template.to_s}.html.erb",__FILE__)
    ERB.new(File.read(path))
  end

  def setup_properties
    @body = @page.body
    @page.links.each do |link|
      @body.gsub!("[[#{link}]]","<a href=\"/#{link}\">")
    end
  end

  def render_show
    @show_template.result(binding)
  end

  def render_edit
    @show_template.result(binding)
  end
end
