class CreateTables < ActiveRecord::Migration

  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password
      t.timestamps
    end

    create_table :pins do |t|
      t.string     :title
      t.integer    :date
      t.string     :username
      t.references :user
      t.timestamps
    end

    create_table :comments do |t|
      t.integer    :date
      t.string     :username
      t.string     :text
      t.references :user
      t.timestamps
      
    end

  end

end