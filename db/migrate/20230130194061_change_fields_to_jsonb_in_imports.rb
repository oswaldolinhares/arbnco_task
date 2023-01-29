class ChangeFieldsToJsonbInImports < ActiveRecord::Migration[7.0]
  def change
    change_column :imports, :fields, :jsonb, using: 'fields::jsonb'
  end
end
