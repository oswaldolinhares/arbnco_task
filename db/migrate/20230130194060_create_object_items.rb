class CreateObjectItems < ActiveRecord::Migration[7.0]
  def change
    create_table :object_items do |t|
      t.references :import, null: false, foreign_key: true
      t.string :name
      t.references :object_type, null: false, foreign_key: true
      t.hstore :properties

      t.timestamps
    end
  end
end
