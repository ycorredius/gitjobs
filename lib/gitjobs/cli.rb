require_relative './api'
require_relative './jobs'

class Cli
    def start
        puts"

        ██████╗ ██╗████████╗██╗  ██╗██╗   ██╗██████╗          ██╗ ██████╗ ██████╗ ███████╗
       ██╔════╝ ██║╚══██╔══╝██║  ██║██║   ██║██╔══██╗         ██║██╔═══██╗██╔══██╗██╔════╝
       ██║  ███╗██║   ██║   ███████║██║   ██║██████╔╝         ██║██║   ██║██████╔╝███████╗
       ██║   ██║██║   ██║   ██╔══██║██║   ██║██╔══██╗    ██   ██║██║   ██║██╔══██╗╚════██║
       ╚██████╔╝██║   ██║   ██║  ██║╚██████╔╝██████╔╝    ╚█████╔╝╚██████╔╝██████╔╝███████║
        ╚═════╝ ╚═╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝ ╚═════╝      ╚════╝  ╚═════╝ ╚═════╝ ╚══════╝
                            ██████╗  ██████╗  █████╗ ██████╗ ██████╗                                       
                            ██╔══██╗██╔═══██╗██╔══██╗██╔══██╗██╔══██╗                                      
                            ██████╔╝██║   ██║███████║██████╔╝██║  ██║                                      
                            ██╔══██╗██║   ██║██╔══██║██╔══██╗██║  ██║                                      
                            ██████╔╝╚██████╔╝██║  ██║██║  ██║██████╔╝                                      
                            ╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝                                       
                                                                                          
       
       "
        puts "Welcome to github jobs board!"
        sleep 5
        system('clear')
        display_menu
    end

    def display_menu
        while true  
            puts "What would you like to do?"
            puts " -Search new job"
            puts "2-Find previous search"
            puts "3-Exit or quit"
            choose = gets
            choice(choose.strip)
        end
    end

    def choice(choice) 
        binding.pry
        case choice 
        when choice == 'search' 
            puts "Enter a search: "
            job = Jobs.find_or_create()
            display_jobs(job) if job
        when 2
            job = Jobs.find(input.strip)
            display_jobs(job)
        when 3
            system('exit!')
        else
            puts "Invalid input. Pleas try again"
        end 
    end

    def display_jobs(job_obj)
        job_obj.post.each do |job|
            puts job[:title]
            puts "Company: " + job[:company]
            puts "Job: " + job[:location]
            job[:decription].each do |line|
                binding.pry 
            end
        end
    end
end