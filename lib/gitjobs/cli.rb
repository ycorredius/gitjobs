require_relative './api'

class Cli
    def call
        new_post = Api.new.pull_post
    end
end