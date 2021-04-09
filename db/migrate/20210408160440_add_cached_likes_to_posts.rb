class AddCachedLikesToPosts < ActiveRecord::Migration[6.1]
  def change
    change_table :posts do |t|
      t.integer :cached_likes_total, default: 0
      t.integer :cached_likes_score, default: 0
      t.integer :cached_likes_up, default: 0
      t.integer :cached_likes_down, default: 0
      t.integer :cached_weighted_score, default: 0
      t.integer :cached_weighted_total, default: 0
      t.float :cached_weighted_average, default: 0.0
    end

    # Uncomment this line to force caching of existing likes
    # Post.find_each(&:update_cached_likes)
  end
end
