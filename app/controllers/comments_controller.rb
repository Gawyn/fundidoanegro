class CommentsController < ApplicationController
	before_filter :authenticate_user!, :except => [:index, :show]
  uses_tiny_mce :options => {
                              :theme => 'advanced',
                              :plugins => %w{ table fullscreen }
                            }
	def create
		flash[:notice] = "Gracies pel comentari!"
		if (params[:articulo_id]== nil )
			@critica=Critica.find(params[:critica_id])
			@comment = @critica.comments.build(params[:comment])
		else
			if (params[:critica_id]== nil)
			@articulo=Articulo.find(params[:articulo_id])
			@comment = @articulo.comments.build(params[:comment])
			end
		end
		@comment.save
		respond_to do |format|
			format.html { redirect_to @post }
			format.js
		end
  	end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to(comments_url) }
      format.xml  { head :ok }
    end
  end


  def edit
    @comment = Comment.find(params[:id])
  end
def index
    @comments = Comment.all
    respond_to do |format|
      format.html # index.html.erb
      format.rss
    end
  end
end
