class ContributorController < Sinatra::Base
    set :views, "app/views/contributor"
    set :method_override, true

    get '/contributors' do
        @contributors = Contributor.all
        erb :index
    end

    get '/contributors/new' do
        erb :new
    end

    get '/contributors/:id' do
        @contributor = Contributor.find(params[:id])
        erb :show
    end

    get '/contributors/:id/edit' do
        @contributor = Contributor.find(params[:id])
        erb :edit
    end

    post '/contributors' do
        #check to make sure username is unique
        # @message = ""
        # if Contributor.find_by(username: params[:username])
        #     @message = "This username is already taken."
        # end

        @contributor = Contributor.find_or_create_by(username: params[:username])
        
        redirect "/contributors/#{@contributor.id}"
    end

    patch '/contributors/:id' do
        @contributor = Contributor.find(params[:id])
        @contributor.username = params[:username]
        @contributor.save

        redirect "/contributors/#{@contributor.id}"
    end

    delete '/contributors/:id' do
        @contributor = Contributor.find(params[:id])
        @contributor.destroy
        redirect '/contributors'
    end

end