class ApplicationController < Sinatra::Base

    get '/' do
        erb :homepage
    end

    get '/about' do
        erb :about
    end

end
