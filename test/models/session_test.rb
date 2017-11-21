require 'test_helper'

class SessionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should get new" do
    get login_path
    assert_response :success
  end
end

