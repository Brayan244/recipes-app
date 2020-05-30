# frozen_string_literal: true

require 'test_helper'

class ChefSignUpTest < ActionDispatch::IntegrationTest
  test 'should get sign up path' do
    get signup_path
    assert_response :success
  end
end
