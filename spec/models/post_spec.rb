require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(title: 'My Post', comments_counter: 10, likes_counter: 10) }

  before { subject.save }

  it 'Title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'Title length should be maximum 250' do
    subject.title = 'z' * 300
    expect(subject).to_not be_valid
  end

  it 'Comments counter length should be 0 or greater' do
    subject.comments_counter = -2
    expect(subject).to_not be_valid
  end

  it 'Comments counter should be integer' do
    subject.comments_counter = 'z'
    expect(subject).to_not be_valid
  end

  it 'Likes counter length should be 0 or greater' do
    subject.likes_counter = -2
    expect(subject).to_not be_valid
  end

  it 'Likes counter should be integer' do
    subject.likes_counter = 'z'
    expect(subject).to_not be_valid
  end
end
