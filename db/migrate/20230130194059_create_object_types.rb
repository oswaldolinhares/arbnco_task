class CreateObjectTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :object_types do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
