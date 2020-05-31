# frozen_string_literal: true

require 'test_helper'

class ChefsTest < ActionDispatch::IntegrationTest
  def setup
    @chef = Chef.create!(chef_name: 'brayan',
                         email: 'brayan@example.com',
                         password: 'password',
                         password_confirmation: 'password')

    @chef2 = Chef.create!(chef_name: 'javier',
                          email: 'javier@example.com',
                          password: 'password',
                          password_confirmation: 'password')
  end

  test 'should get chefs index' do
    get chefs_path
    assert_response :success
  end

  test 'should get chefs listing' do
    get chefs_path
    assert_template 'chefs/index'
    assert_match @chef.chef_name, response.body
    assert_match @chef2.chef_name, response.body
  end
end
