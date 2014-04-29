class Setting < ActiveRecord::Base
  belongs_to :setting_group, inverse_of: :settings

  validates_presence_of :name
end
