# require_relative './api'
# require_relative './jobs'

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
            puts "What would you like to do?"
            puts "1-Search new job"
            puts "2-Find previous search"
            puts "3-Exit or quit"
            choose = gets
            system('clear')
            choice(choose.strip)
    end

    def choice(choice) 
        if choice == '1' 
            puts "Enter a search: "
            job = Jobs.find_or_create(gets)
            binding.pry
            unless job
                display_jobs(job) 
            else
                system('clear')
                puts "No results!"
                sleep 0.75
                system('clear')
            end
            display_menu
        elsif choice == "2"
            puts "Enter a search: "
            job = Jobs.find(gets)
            display_jobs(job)
            display_menu
        elsif choice == "3"
            puts "Goodbye!"
        else
            puts "Invalid input. Pleas try again"
            display_menu
        end 
    end

    def display_jobs(job_obj)
        if job_obj
            job_obj.post.each do |job|
                puts "=============================================================================\n"
                puts job[:title]
                puts "Company: " + job[:company]
                puts "Location: " + job[:location]
                # puts "Description: " + job[:description]
                puts "Link to posting: " + "#{job[:url]}"
                puts "=============================================================================\n"
            end
        else    
            puts "You haven't searched for that yet.\n"
        end
    end
end