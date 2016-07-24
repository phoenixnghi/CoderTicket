class Event < ActiveRecord::Base
  belongs_to :venue
  belongs_to :category
  has_many :ticket_types

  validates_presence_of :extended_html_description, :venue, :category, :starts_at
  validates_uniqueness_of :name, uniqueness: { scope: [:venue, :starts_at] }

  def self.search(keyword)
    where('name ILIKE ?', "%#{keyword}%")
  end

  def self.order_by_created_day
    order('created_at DESC')
  end

  def self.by_user_id(user_id)
    where(user_id: user_id)
  end
end
