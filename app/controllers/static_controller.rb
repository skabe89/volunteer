class StaticController < ApplicationController

  def home
    @projects = Project.all
  end

end