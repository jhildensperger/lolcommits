require 'appscript'

module Lolcommits
	class MusicInfo
	attr_accessor :now_playing
	include Appscript

		def initialize
			{"iTunes" => app("iTunes"), "Spotify" => app("Spotify"), "Rdio" => app("Rdio")}.each { |name, app| state = app.player_state.get
				if app.is_running? && state == :playing
					self.now_playing = '♫ ' + app.current_track.name.get + ' by ' + app.current_track.artist.get + ' on ' + name
					break
				end
			}
		end
	end
end