require 'rails_helper'

RSpec.feature 'Managing Comments' do
  scenario 'List all the comments for one article' do
      # Set up
     article = Article.create!(title: 'One Stupid Trick', body: "You won't believe what they did next...")
     Comment.create!(body: 'This are just words', article_id: article.id)

     #excecute
     visit "articles/#{article.id}/comments"

     #verify
     expect(page).to have_content 'Comments'
     expect(page).to have_selector 'div', count: 1
  end

  scenario ' Create a comment' do
    #set up
    article = Article.create!(title: 'One Stupid Trick', body: "You won't believe what they did next...")
    #execute step
    visit "articles/#{article.id}/comments/new"
    fill_in 'Body', with: 'I am not a troll'
    click_on 'Create comment'

    #verify
    expect(page).to have_content(/success/i)


  end







end

