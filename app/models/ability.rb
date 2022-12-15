class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role == 'admin'
      can :manage, :all
    else
      can :destroy, Post do |post|
        post.author == user
      end
      can :destroy, Comment do |comment|
        comment.author == user
      end
      can :create, Post
      can :create, Comment
      can :read, :all
    end
  end
end
