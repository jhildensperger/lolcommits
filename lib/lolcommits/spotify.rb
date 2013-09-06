require 'appscript'

module Lolcommits
  class Spotify
  	attr_accessor :now_playing
	include Appscript

 	def initialize
		spotify = app("Spotify")
		state = spotify.player_state.get
		if state == :paused
			self.now_playing = 'Spotify is paused'
		elsif state == :playing
			self.now_playing = '♫ ' + spotify.current_track.name.get + ' by ' + spotify.current_track.artist.get + ' ♫'
		else
			self.now_playing = 'fail'
		end
    end
  end
end