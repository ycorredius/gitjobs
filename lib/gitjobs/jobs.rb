require 'pry'

class Jobs
    attr_accessor :name, :listing
    @@all = {}
    
    def initialize (name)
        @name = name 
    end

    def self.new_job_search(search)
        job = Api.new(search)
        self.listing = job.new_pull(search)
        @@all[self.name] = @listing        
        job
        binding.pry
    end

    # def self.save
    #     @@all[self.name] = self.listing        
    # end
end