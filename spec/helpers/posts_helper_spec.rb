require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the PostsHelper. For example:
#
# describe PostsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe PostsHelper, type: :helper do
  current_user = User.first_or_create!(email: 'triple_AAA_tony@test.com', password: 'password', password_confirmation: 'password')

  @post = Post.new(title: 'MyString', body: 'MyText', views: 1)

  returned_post = assign_post_creator(@post, creator)
end



