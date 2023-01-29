class CreateImports < ActiveRecord::Migration[7.0]
   def change
     create_table :imports do |t|
       t.string :file_name
       t.references :user_submission, null: false, foreign_key: true
       t.hstore :fields

       t.timestamps
     end
   end
 end