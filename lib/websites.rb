require_relative '../lib/tabs'

class Search
  attr_reader :url, :type, :artist, :song
  def initialize
    @type = type.capitalize
    @artist = artist.capitalize
    @song = song.capitalize
  end
end