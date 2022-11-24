require 'rails_helper'

describe Like, type: :model do
  before :each do
    @author = User.new(name: 'Edi', photo: 'https://avatars.githubusercontent.com/u/105216647?v=4',
                       bio: 'Full-stack developer')
    @post = Post.new(author: @author, title: 'Post one', text: 'Post')

    @like = Like.create(author: @author, post: @post)
  end

  it 'can not update likes_counter its a private method' do
    expect(@like).to_not respond_to(:update_likes_counter)
  end

  it 'will have the Posts likes_counter through update_comments_counter ' do
    expect(@post.likes_counter).to eq 1
  end
end
