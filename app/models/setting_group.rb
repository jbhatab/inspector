class SettingGroup < ActiveRecord::Base
  has_many :settings, inverse_of: :setting_group, dependent: :destroy
  accepts_nested_attributes_for :settings, allow_destroy: true

  belongs_to :theme, inverse_of: :setting_groups

  validates_presence_of :name
end
