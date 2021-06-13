class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :nickname,        null: false, default: ""
      t.string :email,           null: false, default: ""
      t.string :password_digest, null: false
      t.string :last_name,       null: false, default: ""
      t.string :first_name,      null: false, default: ""
      t.string :last_name_kana,  null: false, default: ""
      t.string :first_name_kana, null: false, default: ""
      t.date   :birth_day,       null: false

      ## Recoverable
      # t.string   :reset_password_token
      # t.datetime :reset_password_sent_at

      ## Rememberable
      # t.datetime :remember_created_at

      t.timestamps null: false
    end

    # add_index :users, :email,                unique: true
    # add_index :users, :reset_password_token, unique: true
  end
end
