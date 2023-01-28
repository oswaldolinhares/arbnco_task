class CreateUserSubmissions < ActiveRecord::Migration[7.0]
  def change
    create_table :user_submissions do |t|
      t.string :email, null: false

      t.timestamps
    end
  end
end
