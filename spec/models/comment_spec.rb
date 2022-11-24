require 'rails_helper'

describe Comment, type: :model do
  before :each do
    @author = User.new(name: 'Edi', photo: 'https://avatars.githubusercontent.com/u/105216647?v=4',
                       bio: 'Full-stack developer')
    @post = Post.new(author: @author, title: 'Post one', text: 'Post')

    @comment1 = Comment.create(author: @author, post: @post, text: 'Comment one')
    @comment2 = Comment.create(author: @author, post: @post, text: 'Comment two')
  end

  it 'can not update likes_counter its a private method' do
    expect(@comment1).to_not respond_to(:update_comments_counter)
    expect(@comment2).to_not respond_to(:update_comments_counter)
  end

  it 'will have the Posts comments_counter through update_comments_counter ' do
    expect(@post.comments_counter).to eq 2
  end
end
