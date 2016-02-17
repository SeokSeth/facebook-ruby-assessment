class Post < ActiveRecord::Base
	has_many :comments ,:dependent => :destroy
	belongs_to :user
	has_many :plikes, :dependent => :destroy
end
