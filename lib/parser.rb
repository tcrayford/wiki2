require 'strscan'
class Parser
  def initialize(text)
    @text = text
  end

  def extract
    scanner = StringScanner.new(@text)
    links = []
    until scanner.eos?
      # TODO: ask @ecomba about regex for making this better
      scanner.skip(/\[\[/) || scanner.skip(/.*\[\[/)
      # drop the closing brackets after scanning (and including them)
      links << scanner.scan_until(/\]\]/)[0..-3] 
    end
    links
  end
end
