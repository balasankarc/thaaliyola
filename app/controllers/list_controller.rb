class ListController < ApplicationController
  def index
      @books = Books.all      
  end
end
