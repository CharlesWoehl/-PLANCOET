class ActualitiesController < ApplicationController
  def index
    @actualities = if params.dig(:filter, :category).present?
                     category = Category.find_by(name: params[:filter][:category])
                     category.present? ? category.actualities.where(activate: true).where('date <= ?', Date.today) : Actuality.none
                   else
                     Actuality.where(activate: true).where('date <= ?', Date.today).order(date: :desc)
                   end

    if params.dig(:filter, :keywords).present?
      keywords = params.dig(:filter, :keywords).split
      @actualities = @actualities.where('title ILIKE any (array[?]) OR content ILIKE any (array[?]) OR short_description ILIKE any (array[?])', keywords.map { |keyword| "%#{keyword}%" }, keywords.map { |keyword| "%#{keyword}%" }, keywords.map { |keyword| "%#{keyword}%" })
    end



    @actualities = @actualities.page(params[:page]).per(12)
  end
  def show
    @actuality = Actuality.find(params[:id])
  end
end
