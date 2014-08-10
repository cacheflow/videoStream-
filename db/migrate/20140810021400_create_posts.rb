class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :video
      t.boolean :approved

      t.timestamps
    end
  end
end
