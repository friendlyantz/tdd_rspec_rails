require 'rails_helper'

RSpec.describe Post, type: :model do
  current_user = User.first_or_create!(email: 'test2@test.com', password: 'password', password_confirmation: 'password')
  puts "====> #{current_user.email}"

  it 'has a title' do
    post = Post.new(
      title: '',
      body: 'a valid body',
      user: current_user,
      views: 0
    )

    expect(post).to_not be_valid

    post.title = 'has a title'
    expect(post).to be_valid
  end

  puts 'test 1 executed'

  it 'has a body' do
    post = Post.new(
      title: 'A valid title',
      body: '',
      user: current_user,
      views: 0
    )

    expect(post).to_not be_valid

    post.body = 'now has a new body'
    expect(post).to be_valid
  end

  it 'has a title at least of 2 characters' do
    post = Post.new(
      title: '',
      body: 'valid body with no 2char title',
      user: current_user,
      views: 0
    )

    expect(post).to_not be_valid

    post.title = '123'
    expect(post).to be_valid
  end

  it 'has a body between 5 and 100 characters' do
    post = Post.new(
      title: 'valid title',
      body: '1',
      user: current_user,
      views: 0
    )

    expect(post).to_not be_valid

    post.body = '12345'
    expect(post).to be_valid

    post.body = 'Cupidatat do in minim Lorem culpa magna commodo velit veniam proident exercitation ad. Culpa veniam occaecat deserunt dolore aute minim magna aliquip est laboris et veniam tempor eu. Sit pariatur minim nostrud minim mollit.'
    expect(post).to_not be_valid

    hundred_string = 'Cupidatat do in minim Lorem culpa magna commodo velit veniam proident exercitation ad. Culpa veniam1'
    post.body = hundred_string
    expect(post).to be_valid
  end

  it 'has numerical views' do
    post = Post.new(
      title: 'valid title',
      body: 'valid body',
      user: current_user,
      views: 0
    )

    expect(post.views).to be_a(Integer)
  end
end
