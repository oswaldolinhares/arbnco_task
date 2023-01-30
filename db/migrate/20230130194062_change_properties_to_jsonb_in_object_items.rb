class ChangePropertiesToJsonbInObjectItems < ActiveRecord::Migration[7.0]
  def change
    change_column :object_items, :properties, :jsonb, using: 'properties::jsonb'
  end
end
