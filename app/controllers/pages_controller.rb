class PagesController < ApplicationController
  def home
    @frames = Frame.all
    @tasks = Task.all
  end
end
