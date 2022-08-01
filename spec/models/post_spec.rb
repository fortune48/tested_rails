require 'rails_helper'

RSpec.describe Post, type: :model do
  current_user = User.first_or_create(email: "testing@testing.com", password: "password1", password_confirmation: "password1")
  post = Post.new(title: "a valid title", body: "a valid body", user: current_user, views: 0 )

  it "has valid attributes" do
    expect(post).to be_valid
  end

  it "has a title" do
    post.title = nil

    expect(post).to_not be_valid
  end

  it "has a body" do
    post.body = nil

    expect(post).to_not be_valid
  end

  it "has a title at least two characters long" do
    post.title = "f"

    expect(post).to_not be_valid
  end

  it "has a body between 5 to 100 characters long" do
    post.body = "ff"

    expect(post).to_not be_valid
  end

  it "has a numerical view" do
    #post.views = 0

    expect(post.views).to be_a(Integer)
  end
end
