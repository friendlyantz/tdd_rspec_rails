module PostsHelper
  def assign_post_creator(post, _creator)
    post.user = creator
    post
  end
end
