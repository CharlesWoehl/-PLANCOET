class EventsController < ApplicationController
  def index
    category_name = params.dig(:filter, :category)
    @query = params.dig(:filter, :keywords)

    @events = if category_name.present?
                category = Category.find_by(name: category_name)
                category.present? ? category.events : Event.none
              else
                Event.where(display: true)
                     .where("start_date >= ?", Date.today)
                     .order(Arel.sql("start_date ASC, COALESCE(hourly_start, '23:59:59') ASC"))
              end

    @events = @events.search_by_keywords(@query) if @query.present?

    if category_name.present? && @query.present?
      # Si les deux sont renseignés, filtrer les résultats pour correspondre aux deux critères
      @events = @events.search_by_category(category_name)
    end

    # Récupérer les catégories des événements filtrés
    @categories = Category.joins(:events).where(events: { id: @events.pluck(:id) }).distinct


    # Si aucun résultat trouvé, afficher un message
    @no_results_message = "Désolé, aucun résultat trouvé." if @events.blank?
    @event = Event.new  # Assurez-vous que @event est initialisé
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new

  end

  def create
    @event = Event.new(event_params)

    if @event.save
      # Afficher un message de remerciement
      flash[:notice] = "Votre événement a été proposé avec succès. Merci!"
      render json: { success: true }
    else
      render json: { success: false, errors: @event.errors.full_messages }
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :subtitle, :content, :start_date, :end_date, :hourly_start, :hourly_end, :place, :contact, :email, :phone, :website, :category_id, :photo)
  end
end
