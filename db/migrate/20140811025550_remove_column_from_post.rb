class RemoveColumnFromPost < ActiveRecord::Migration
  def change
    remove_column :posts, :post_id, :integer
  end
end
