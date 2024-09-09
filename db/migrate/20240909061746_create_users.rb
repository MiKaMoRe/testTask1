class CreateUsers < ActiveRecord::Migration[7.1]
  def up
    create_table :users do |t|
      t.string :name, limit: 255, null: false
      t.string :surname, limit: 255, null: false
      t.string :patronymic, limit: 255, null: false
      t.string :full_name, null: false
      t.string :email, limit: 320, null: false
      t.integer :age, limit: 1, null: false
      t.string :nationality, limit: 255, null: false
      t.string :country, limit: 255, null: false

      t.timestamps
    end

    ActiveRecord::Base.connection.execute <<~SQL
      CREATE TYPE gender AS ENUM ('male', 'female');
    SQL

    add_column :users, :gender, :gender, null: false
  end

  def down
    drop_table :users

    ActiveRecord::Base.connection.execute <<~SQL
      DROP TYPE gender;
    SQL
  end
end
