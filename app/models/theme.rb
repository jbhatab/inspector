class Theme < ActiveRecord::Base
  has_many :setting_groups, inverse_of: :theme, dependent: :destroy
  accepts_nested_attributes_for :setting_groups, allow_destroy: true

  validates_presence_of :name
end
