class IdeasController < ApplicationController

  def index
    @current_user = current_user
    @ideas = Idea.all
  end

  def show
    @current_user = current_user
    @ideas = Idea.all
    @info = Idea.find(params[:id])

  end

  def create
    idea = Idea.new(idea_params.merge(user: current_user))

    if idea.valid?
      idea.save
    else
      flash[:idea_errors] = idea.errors.full_messages
    end
    redirect_to '/ideas'
  end

  def destroy
    Idea.find(params[:id]).destroy
    redirect_to '/ideas'
  end

  private
    def idea_params
      params.require(:idea).permit(:comment)

    end
end
