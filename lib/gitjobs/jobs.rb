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

    def self.new_job_search(search)
        pull = Api.new.new_pull(search)
        pull
    end

    def find(input)
        @@all.each do |post|
            binding.pry
        end
    end

    def find_or_create_job_search(search)
                
    end

end