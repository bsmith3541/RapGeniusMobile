class FetcherController < ApplicationController

	def getlyrics
		#x = Net::HTTP.post_form(URI.parse('http://localhost:3000/getlyrics'), params)
		lyrics = "placeholder"
		puts(params)
		lyrics = params["lyrics"]
		if(lyrics[-1] == ' ')
			lyrics = lyrics.chop
			puts lyrics
		end

		lyrics = lyrics.gsub(' ', '-')
		lyrics = lyrics += '-lyrics'
		puts lyrics
		song = RapGenius::Song.find(lyrics)
		render :json => { :lyrics => lyrics }
		#puts song
		puts song.title
		puts song.full_artist
		#puts song.description
		for annotation in song.annotations
			puts '-----------------'
			puts annotation.id
			puts '-----------------'			
			puts annotation.lyric
			if (annotation.id.length > 0)
				puts '---------------'
				puts annotation.explanation
			end
			puts ""
		end
	end
end
