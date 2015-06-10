  class BaseController < ApplicationController
    #has_many :Books
    def index
      @books = Book.all
    end
  end
