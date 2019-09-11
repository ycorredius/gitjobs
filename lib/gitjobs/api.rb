require 'httparty'
require 'pry'
require 'json'

class Api
    attr_reader :posts, :response
    
    include HTTParty
    
    @@all 
    def initialize(search)
        @response = HTTParty.get("https://jobs.github.com/positions.json?description=#{search}&page=1",format: :json)
        @posts = []
    end

    def self.save 
        @@all << @posts
    end

    def self.pull_post
        response.each do |post| 
            listing = {
                title: post['title'],                    
                company: post["company"],
                location: post['location'],
                description: post['description'],
                url: post['company_url']
            }
            @posts << listing
        end
        binding.pry
   end
end

