require 'rails_helper'

RSpec.describe Post, type: :system do
  user = User.create(name: 'Anna', posts_counter: 3, photo: 'https://randomuser.me/api/portraits/women/67.jpg', bio: 'Project manager')

  subject do
    Post.new(author_id: user.id, title: 'First post', text: 'First post', comments_counter: 2, likes_counter: 2)
  end
  before { subject.save }

  describe 'Post index page' do
    it "I can see the user's profile picture." do
      visit user_posts_path(user.id)
      page.has_css?('.img-fluid')
    end

    it "I can see the user's username." do
      visit user_posts_path(user.id)
      page.has_content?(user.name)
    end

    it 'I can see the number of posts the user has written.' do
      visit user_posts_path(user.id)
      page.has_content?(user.posts_counter)
    end

    it "I can see a post's title." do
      visit user_posts_path(user.id)
      page.has_content?(subject.title)
    end

    it "I can see some of the post's body." do
      visit user_posts_path(user.id)
      page.has_content?(subject.text)
    end

    it 'I can see the first comments on a post.' do
      comment = Comment.new(author_id: user.id, post_id: subject.id, text: 'I like it')
      visit user_posts_path(user.id)
      page.has_content?(comment.text)
    end

    it 'I can see how many comments a post has.' do
      visit user_posts_path(user.id)
      page.has_content?(subject.comments_counter)
    end

    it 'When I click on a post, it redirects me to that posts show page.' do
      visit user_posts_path(user.id)
      click_on 'First post'
      visit user_post_path(user.id, subject.id)
      page.has_content?(subject.title)
    end
    
  end
end
