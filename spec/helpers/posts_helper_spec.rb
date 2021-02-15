require 'rails_helper'

include PostsHelper

RSpec.describe PostsHelper, type: :helper do
  # AAA testing
  # Arrange, Act, Assert
  puts '==> Triple AAA testing'

  it 'assigns a User to a Post' do
    # 1. Arranging our data - assigning variables
    creator = User.first_or_create!(email: 'triple_AAA_tony@test.com', password: 'password',
                                    password_confirmation: 'password')
    @post = Post.new(title: 'MyString', body: 'MyText', views: 1)

    # 2. Act - we-'re acting with our ARRANGED valibles
    returned_post = assign_post_creator(@post, creator)

    # 3. Assert - assert that our expected outcome matches our actual outcome
    expect(returned_post.user).to be(creator)
  end
end
