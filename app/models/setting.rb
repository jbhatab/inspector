class Setting < ActiveRecord::Base
  belongs_to :setting_group, inverse_of: :settings

  validates_presence_of :name
  validates_format_of :name, with: /[a-zA-Z0-9\s]+/

  def get_slug
    name.parameterize
  end
end
