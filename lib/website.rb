require_relative '../lib/tabs'

class Website
  attr_reader :url, :type, :artist, :song
  def initialize
    @type = type.capitalize
    @artist = artist.capitalize
    @song = song.capitalize
    @url = "https://www.guitartabs.cc/search.php?tabtype=#{type}&band=#{band}&song=#{song}"
  end
end