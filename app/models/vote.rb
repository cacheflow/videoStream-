class Vote < ActiveRecord::Base
	belongs_to :post 
	# Also remember that the post is the foreign key 
	# in this case.
end
