# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @movies = Movie.all
  end
end
