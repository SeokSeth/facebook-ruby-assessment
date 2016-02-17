class CreateLikes < ActiveRecord::Migration
	def change
		create_table :plikes do |t|
			t.integer :user_id
			t.integer :post_id
			t.integer :comment_id
			t.boolean :yes
		end

		create_table :clikes do |t|
			t.integer :user_id
			t.integer :post_id
			t.integer :comment_id
			t.boolean :yes
		end
	end
end
