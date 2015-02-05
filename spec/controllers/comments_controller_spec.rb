
require 'rails_helper'

RSpec.describe CommentsController do
   let(:valid_attributes) {
    {body: "You won't believe what happens next..." }
  }

  let(:invalid_attributes) {
    {body: nil }
  }


 describe 'GET index' do
   it 'has a 200 status code' do
     article = Article.create!(title:'Words Words Words', body:'more words')
     params = {article_id: article.id}
     get :index, params
     expect(response.status).to eq 200
   end
   it 'renders the index template' do

     article = Article.create!(title:'Words Words Words', body:'more words')
     params = {article_id: article.id}
     get :index, params
     expect(response).to render_template('index')
   end
   it 'assigns @comments' do
     comments = Comment.all
     article = Article.create!(title:'Words Words Words', body:'more words')
     params = {article_id: article.id}
     get :index, params
     expect(assigns(:comments)).to eq comments
   end
 end

 describe 'GET new' do
   it 'has a 200 status code' do
     article = Article.create!(title:'Words Words Words', body:'more words')
     params = {article_id: article.id}
     get :new, params
     expect(response.status).to eq 200
   end

   it 'renders the new template' do
     article = Article.create!(title:'Words Words Words', body:'more words')
     params = {article_id: article.id}
     get :new, params
     expect(response).to render_template('new')
   end

   it 'assings @article' do
      article = Article.create!(title:'Words Words Words', body:'more words')
      params = {article_id: article.id}

      get :new, params
      expect(assigns(:article)).to eq article
    end

   it 'assigns @comment' do
     article = Article.create!(title:'Words Words Words', body:'more words')
     params = {article_id: article.id}
     get :new, params
     expect(assigns(:comment)).to be_a_new Comment
   end
 end

  describe 'POST create' do
    context 'with valid attributes' do
      it 'saves a new comment' do
        #set up
    article = Article.create!(title:'Words Words Words', body:'more words')
     params = {article_id: article.id}

     #validate

     expect {
      post :create, comment: valid_attributes,
      }.to change(Comment, :count).by 1





end
