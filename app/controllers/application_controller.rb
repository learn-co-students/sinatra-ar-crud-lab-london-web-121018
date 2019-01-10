
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles' do
    @articles = Article.all

    erb :"article/index"
  end

  get '/articles/new' do

    erb :"article/new"
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])

    erb :"article/show"
  end

  post '/articles' do
    @article = Article.create(params[:article])

    redirect "/articles/#{@article.id}"
  end

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :"article/edit"
  end

  patch '/articles/:id' do
    article = Article.find(params[:id])

  article.update(params[:article])
  redirect "/articles/#{article.id}"
  end

  delete '/articles/:id' do
    article = Article.find(params[:id])
    article.destroy
    redirect "/articles"

  end

end
