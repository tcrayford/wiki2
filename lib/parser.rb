require 'strscan'

class LinkScanner < StringScanner
  def extract(links=[])
    while has_more_links?
      skip_until_next_link
      links << scan_next_link
    end
    links
  end

  def has_more_links?
    match?(/\[\[/) || match?(/.*\[\[/)
  end

  def skip_until_next_link
    # TODO: ask @ecomba about regex for making this better
    skip(/\[\[/) || skip(/.*\[\[/)
  end

  def scan_next_link
    # drop the closing brackets after scanning (and including them)
    scan_until(/\]\]/)[0..-3]
  end
end
