require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
      erb :super_hero
    end

    post '/teams' do
      @team = Team.new(params[:team])

      # params[:team][:members].each do |details|
      #   Member.new(details)
      # end
      @members = params[:team][:members].map do |member|
        Member.new(member)
      end
      erb :team
    end

end
