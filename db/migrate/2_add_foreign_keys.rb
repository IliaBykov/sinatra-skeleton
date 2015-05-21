class AddForeignKeys < ActiveRecord::Migration
    def change
        change_table :pins do |t|
            t.references :user
        end
    end

    def change
        change_table :comments do |t|
            t.references :user
        end
    end

    def change
        change_table :comments do |t|
            t.references :pin
        end
    end
end