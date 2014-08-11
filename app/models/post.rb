class Post < ActiveRecord::Base
	has_many :votes
end
