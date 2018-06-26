class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  validates :name, presence: true
  validates :name, length: { in: 2..20 }
end
