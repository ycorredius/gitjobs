require 'httparty'
require 'pry'
require 'json'

class Api
    attr_reader :posts
    include HTTParty
    # binding.pry
    @@all 
    def initialize
        @posts = []
    end

    def self.save 
        @@all << @posts
    end

    def pull_post
        response = HTTParty.get('https://jobs.github.com/positions.json?description=ruby&page=1',format: :json)
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

