class Event < ApplicationRecord
  has_one_attached :photo
  belongs_to :category

  def self.search_by_keywords(query)
    if query.present?
      where("title ILIKE :query OR subtitle ILIKE :query OR content ILIKE :query", query: "%#{query}%")
    else
      all
    end
  end

  def self.search_by_category(category_name)
    joins(:category).where(categories: { name: category_name })
  end

  def self.pending_display_count
    where(display: false).where("start_date > ?", Date.today).count
  end
end
