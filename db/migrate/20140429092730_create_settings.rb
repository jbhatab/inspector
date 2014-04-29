class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.references :setting_group, index: true

      t.string :name

      t.timestamps
    end
  end
end
