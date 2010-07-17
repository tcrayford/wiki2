require 'strscan'
class LinkParser
  def initialize(text)
    @text = text
  end

  def has_more_links?(scanner)
    scanner.match?(/\[\[/) || scanner.match?(/.*\[\[/)
  end

  def skip_until_next_link(scanner)
    # TODO: ask @ecomba about regex for making this better
    scanner.skip(/\[\[/) || scanner.skip(/.*\[\[/)
  end

  def scan_next_link(scanner)
    scanner.scan_until(/\]\]/)[0..-3]
  end

  def extract
    scanner = StringScanner.new(@text)
    links = []
    while  has_more_links?(scanner)
      skip_until_next_link(scanner)
      # drop the closing brackets after scanning (and including them)
      links << scan_next_link(scanner)
    end
    links
  end
end
