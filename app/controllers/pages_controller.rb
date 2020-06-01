# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    redirect_to recipes_path if logged_in?
  end
end
