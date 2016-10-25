module Msl12Site
	class Page
		def self.about_me
			@about_me ||= <<~EXAMPLE
			I’m a college student from UESTC.

			I love sharing knowledge and something else.

			Well, whatever. Welcome to my blog!

			### Social media

			- <a href="https://github.com/msl12" target="_blank">Github</a>
			EXAMPLE
		end
	end
end