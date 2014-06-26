class ThesaurusController < ApplicationController
  require "dinosaurus"

  def index
    @results = Dinosaurus.lookup(params[:q])
    @word = params[:q]
  end
end
