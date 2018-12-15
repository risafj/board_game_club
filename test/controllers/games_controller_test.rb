require 'test_helper'

class GamesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @gameparams = { game: { name: 'Test' } }
  end

  test 'should create game' do
    post '/games', params: @gameparams
    assert_response :success
    assert response.body.include? 'Test'
  end

  test 'duplicates should not be created' do
    post '/games', params: @gameparams
    assert_response :success
    post '/games', params: @gameparams
    # :bad_request is another way to say status 400. You can google the name for each status code.
    # You can also pass an explicit number like assert_response(400)
    # https://api.rubyonrails.org/v5.2.1/classes/ActionDispatch/Assertions/ResponseAssertions.html
    assert_response :bad_request
    # To see what the response is when writing a test, you can put byebug at the end and go response.body
    assert response.body.include? 'has already been taken'
  end
end
