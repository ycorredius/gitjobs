require 'httparty'
require 'json'

class Api
    attr_reader :posts
    include HTTParty

    def initialize
        @posts = []
    end

    def new_pull(search)
        response = HTTParty.get("https://jobs.github.com/positions.json?description=#{search}&page=1",format: :json)
        response.each do |post| 
            listing = {
                title: post['title'],                    
                company: post["company"],
                location: post['location'],
                description: post['description'],
                url: post['company_url']
            }
            @posts.push(listing)
        end
        self.posts
   end
   
end

