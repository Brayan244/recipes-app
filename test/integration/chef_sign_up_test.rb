# frozen_string_literal: true

require 'test_helper'

class ChefSignUpTest < ActionDispatch::IntegrationTest
  test 'should get sign up path' do
    get signup_path
    assert_response :success
  end

  test 'reject invalid signup' do
    get signup_path
    assert_no_difference 'Chef.count' do
      post chefs_path, params: {
        chef: {
          chef_name: ' ',
          email: ' ',
          password: 'password',
          password_confirmation: 'password'
        }
      }
    end

    assert_template 'chefs/new'
    assert_select 'div.card-header'
    assert_select 'div.card-body'
  end

  test 'accept valid signup' do
    get signup_path
    assert_difference 'Chef.count' do
      post chefs_path, params: {
        chef: {
          chef_name: 'Brayan',
          email: 'example@example.com',
          password: 'password',
          password_confirmation: 'password'
        }
      }
    end

    follow_redirect!
    assert_not flash.empty?
  end
end
