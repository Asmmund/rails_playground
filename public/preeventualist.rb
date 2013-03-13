require "open-uri"
module   PreEventualist
  def self.open page, query
    qs =
    query.map do |k,v|
      URI.escape "#{k}=#{v}"
    end.join('&')
    URI.parse( "http://preeventualist.org/lost/" + page + "?" + qs ).open do |lost|
      lost.read.split("--\n")
    end
  end
  def self.search word
    open "search", "q" => word
  end
  def self.searchlost word
    open "searchlost", "q" => word
  end
  def self.searchfound word
    open "searchfound", "q" => word
  end
  def self.addfound your_name, item_lost, found_at, description
    open "addfound", "name" => your_name, "item" => item_lost,
      "at" => found_at, "desc" => description
  end
  def self.addlost your_name, item_found, last_seen, description
    open "addlost", "name" => your_name, "item" => item_found,
      "seen" => last_seen, "desc" => description
  end
end
