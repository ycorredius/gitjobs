require 'httparty'
require 'pry'
require 'json'

class Api
    attr_reader :posts
    include HTTParty
    # binding.pry

    def initialize
        @posts = []
    end

    def self.pull_post
        response = HTTParty.get('https://jobs.github.com/positions.json?description=ruby&page=1',format: :json)
        response.each do |post| 
            binding.pry
        end
   end
end

