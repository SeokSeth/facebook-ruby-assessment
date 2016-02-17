class Clike < ActiveRecord::Base
		belongs_to :post
		belongs_to :user
		validates :user_id, uniqueness: true  
end