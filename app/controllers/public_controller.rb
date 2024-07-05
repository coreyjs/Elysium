class PublicController < ApplicationController
  def home
    @projects = Project.active.recent.limit(4)
  end
end
