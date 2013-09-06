require "appscript"
include Appscript

module Lolcommits
  class Spotify
  	attr_accessor :now_playing

    include Methadone::CLILogging
 	def initialize
		spotify = app("Spotify")

		state = spotify.player_state.get
		if state == :paused
			self.now_playing = 'Spotify is paused'
		elsif state == :playing
			self.now_playing = "♫ " + spotify.current_track.name.get + ' by ' + spotify.current_track.artist.get + " ♫"
		end
    end
    # attr_accessor :sha, :message, :repo_internal_path, :repo

    # def initialize
    #   debug "GitInfo: attempting to read local repository"
    #   g    = Git.open('.')
    #   debug "GitInfo: reading commits logs"
    #   commit = g.log.first
    #   debug "GitInfo: most recent commit is '#{commit}'"

    #   self.message = commit.message.split("\n").first
    #   self.sha     = commit.sha[0..10]
    #   self.repo_internal_path = g.repo.path
    #   regex = /.*[:\/](\w*).git/
    #   match = g.remote.url.match regex if g.remote.url
    #   self.repo = match[1] if match
      
    #   debug "GitInfo: parsed the following values from commit:"
    #   debug "GitInfo: \t#{self.message}"
    #   debug "GitInfo: \t#{self.sha}"
    #   debug "GitInfo: \t#{self.repo_internal_path}" 
    #   debug "GitInfo: \t#{self.repo}"
    # end
  end
end