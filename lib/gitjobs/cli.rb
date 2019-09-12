require_relative './api'
require_relative './jobs'

class Cli
    attr_accessor :posts
    def call
        input = gets
        job = Jobs.new_job_search(input.strip)
        binding.pry
    end
end