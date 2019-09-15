require_relative './api'
require_relative './jobs'

class Cli
    attr_reader :post
    def start
        input = gets
        job = Jobs.create(input.strip)
        job.find(input)
        binding.pry
    end
end