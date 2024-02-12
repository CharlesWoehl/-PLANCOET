class PagesController < ApplicationController
  def home
    @general = General.all
  end
end
