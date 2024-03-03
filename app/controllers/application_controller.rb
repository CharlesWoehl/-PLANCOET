class ApplicationController < ActionController::Base
  before_action :track_unique_visit

  private

  def track_unique_visit
    user_id = cookies[:user_id]
    unless user_id
      user_id = SecureRandom.uuid
      cookies[:user_id] = { value: user_id, expires: 1.year.from_now }
    end

    increment_visit(:total)
    increment_visit(:hour)
    increment_visit(:day)
    increment_visit(:month)
  end

  def increment_visit(period)
    visit = UniqueVisit.find_or_initialize_by(user_id: 'total', period: period)
    visit.increment!(:count)
  end
end
