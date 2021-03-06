class CatalogController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:search] != nil and params[:search] != ""
      redirect_to catalog_path(:id => -1, :search => params[:search])
    end
    @categories = Subject.all;

  end

  def show
    if params[:search] != nil and params[:search] != ""
      @subject_name = "search " + params[:search]
      @term = params[:search]
      @mentors = Mentor.filter_by_search(@term)
    else
      id = params[:id]
      if id == "-1"
        @subject_name = "All"
        @mentors = Mentor.all
      else
        @subject = Subject.find_by_id(id)
        @subject_name = @subject.name
        @mentors = @subject.mentors
      end
    end
  end

end
