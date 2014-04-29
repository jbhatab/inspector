class CreateSettingGroups < ActiveRecord::Migration
  def change
    create_table :setting_groups do |t|
      t.references :theme, index: true

      t.string :name

      t.timestamps
    end
  end
end
