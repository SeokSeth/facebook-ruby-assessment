helpers do
def check_post_like(post)
   		return true if !logged_in?
   		!post.plikes.where(user_id: current_user.id).any?
 	end

	 def check_comment_like(comment)
	   return true if !logged_in?
	   !comment.clikes.where(user_id: current_user.id).any?
	 end

	 def count_post_like(post)
	   post.plikes.where(yes: true).count
	 end

	 def count_question_downvotes(post)
	   post.plikes.where(yes: false).count
	 end

	 def count_comment_like(comment)
	   comment.clikes.where(yes: true).count
	 end

	 def count_Comment_downvotes(comment)
	   comment.clikes.where(yes: false).count
	 end
end