class ThemesController < ApplicationController

  def index
    @themes = Theme.all
  end

  def show
    @theme = Theme.find(params[:id])
    render :layout => 'theme'
  end

  def inspector
    @theme = Theme.find(params[:id])
  end

  def new
    @theme = Theme.new
  end

  def create
    @theme = Theme.new(theme_params)

    if @theme.save
      redirect_to @theme
      return
    end

    render :new
  end


  private

    def theme_params
      params.require(:theme).permit(
        :name
      )
    end

end
