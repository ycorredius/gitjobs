require 'pry'

class Jobs
    attr_accessor :name, :post
    @@all = []
    
    def initialize (name,post)
        @name = name
        @post = Api.new.new_pull(post) if post
    end

    def self.all
        @@all
    end
    
    def self.create(input)
        job =  self.new(input,input)
        @@all << job
        job
    end

    #Uses api to pull git jobs query
    #Param: keyword of job to be searched
    def self.new_job_search(search)
        pull = Api.new.new_pull(search) if 
        pull
    end

    def self.find(input)
        all.find{|post| post.name == input}
    end

    def self.find_or_create(input)
        binding.pry
        if (input.chomp).match?(/[0-9]/)
           puts "Invalid!" 
        else
            binding.pry
            find(input) || create(input)
        end
    end 
end