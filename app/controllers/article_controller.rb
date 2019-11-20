class ArticleController < Sinatra::Base
    set :method_override, true
    set :views, 'app/views/article'

    get '/articles' do
       @articles = Article.all
        erb :index
    end

    get '/articles/new' do
        @contributors = Contributor.all
        erb :new
    end

    post '/articles' do
        article = Article.create(title: params[:title], content: params[:content])
        edit = ContributorEdit.create(contributor_id: params[:contributor_id], article_id: article.id)

        redirect "/articles/#{article.id}"
    end

    get '/articles/:id' do
        @article = Article.find(params[:id])
        erb :show
    end

    get '/articles/:id/edit' do
        @article = Article.find(params[:id])
        @contributors = Contributor.all
        erb :edit
    end

    get '/articles/:id/contributor-edits' do
        @article = Article.find(params[:id])
        erb :contributor_edits
    end

    patch '/articles/:id' do
        @article = Article.find(params[:id])
        @article.title = params[:title]
        @article.content = params[:content]
        @article.save

        ContributorEdit.create(article_id:@article.id, contributor_id:params[:contributor_id])

        redirect "/articles/#{@article.id}"
    end

    delete '/articles/:id' do
        article = Article.find(params[:id])
        article.destroy
        article.contributor_edits.destroy_all

        redirect "/articles"
    end
end