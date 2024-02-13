class PagesController < ApplicationController
  def home
    @general = General.all
    @actualities = Actuality.where(activate: true).where('date <= ?', Date.today).order(date: :desc).limit(4)
  end
end
