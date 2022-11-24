require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Edi', photo: 'https://avatars.githubusercontent.com/u/105216647?v=4', posts_counter: 10, bio: 'Full-stack developer') }

  before { subject.save }

  it 'Name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Post Counter must be integer' do
    subject.posts_counter = 'z'
    expect(subject).to_not be_valid
  end

  it 'Post Counter must be 0 or greater' do
    subject.posts_counter = -5
    expect(subject).to_not be_valid
  end
end
