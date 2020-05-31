# frozen_string_literal: true

require 'test_helper'

class ChefsEditTest < ActionDispatch::IntegrationTest
  def setup
    @chef = Chef.create!(
      chef_name: 'Brayan',
      email: 'brayan@example.com',
      password: 'password',
      password_confirmation: 'password'
    )
  end

  test 'reject invalid signup' do
    get edit_chef_path(@chef)

    assert_template 'chefs/edit'
    patch chef_path(@chef), params: { chef: { chef_name: ' ', email: 'brayan@example.com' } }

    assert_template 'chefs/edit'
    assert_select 'div.card-header'
    assert_select 'div.card-body'
  end

  test 'accept valid signup' do
    get edit_chef_path(@chef)

    assert_template 'chefs/edit'
    patch chef_path(@chef), params: { chef: { chef_name: 'Javier', email: 'javier@example.com' } }

    assert_redirected_to @chef
    assert_not flash.empty?
    @chef.reload
    assert_match 'Javier', @chef.chef_name
    assert_match 'javier@example.com', @chef.email
  end
end
