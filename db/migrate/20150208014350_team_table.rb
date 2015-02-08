class TeamTable < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.text :description
      t.string :member_ids 
      t.timestamps null: false
    end
  end
end
