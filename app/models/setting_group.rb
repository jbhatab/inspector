class SettingGroup < ActiveRecord::Base
  has_many :settings, inverse_of: :setting_group, dependent: :destroy
  accepts_nested_attributes_for :settings, allow_destroy: true, :reject_if => :all_blank

  belongs_to :theme, inverse_of: :setting_groups

  validates_presence_of :name
  validates_format_of :name, with: /\A[a-zA-Z\d\s]*\z/

  def get_slug
    name.parameterize
  end
end
