require 'rails_helper'

RSpec.describe "posts/show", type: :view do
  current_user = User.first_or_create(email: "testing@testing.com", password: "password1", password_confirmation: "password1")
  
  before(:each) do
    @post = assign(:post, Post.create!(
      title: "Title",
      body: "MyText",
      user: current_user,
      views: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end
