class PostsController < ApplicationController
load_and_authorize_resource

def index
	# queries the entire database and returns array and shows them 
	# by the time they were created. 
	@posts = Post.find_by_sql("SELECT * FROM posts ORDER BY created_at DESC")
end

def compindex 
	#This shows the posts that weren't approved.
	@posts = Post.find_by_sql("SELECT * FROM posts WHERE approved=false")
end 

def show 
	#The method for each individual posting
	@post = Post.find(params[:id])
end 

def new 
	# This renders a form for creating a new post, but doesn't 
	# save it. Instead, it creates a new unsaved record. It's an 
	# HTTP GET. This creates a local object, but doesn't validate
	# or save it. 
	@post = Post.new 

end 

def create 
	# The create method actually receives the new method
	# and saves it to the database. This is where it actually 
	# calls an HTTP POST.
	# This actually instanties the object, validates it, and saves
	# it to the database.  

	@post = Post.new(post_params)
	if @post.save(post_params)
		redirect_to posts_path 
	else 
		render "new"
	end 
   end 		

   def edit 
   	@post = Post.find(params[:id])
   	if @post.update(post_params)
   		redirect_to posts_compindex_path
   	else 
   		render "edit"
   	end 
   end 
   end 

   def destroy 
   	@post = Post.find(params[:id])
   	@post.destroy
   	redirect_to posts_path
   end 

   def upvote 
   	@post = Post.find(params[:id])
   	@vote = @post.vote.build 
   	@vote.upvote = 1 
   	@vote.save 
   	redirect_to posts_path 
   end  

   def downvote 
   	@post = Post.find(params[:id])
   	@vote = @post.vote.build 
   	@vote.downvote = 1 
   	@vote.save 
   	redirect_to posts_path 
   end 

   private 
   def vote_params
   	params.require(:vote).permit(:vote_id, :upvote, :downvote)
   end 

   def post_params 
   	params.require(:post).permit(:video, :require)