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

  def settings
    @theme = Theme.find(params[:id])
  end

  def new
    @theme = Theme.new
  end

  def create
    @theme = Theme.new(theme_params)

    if @theme.save
      redirect_to inspector_theme_path(@theme)
      return
    end

    render :new
  end

  def update
    @theme = Theme.find(params[:id])

    respond_to do |format|
      if @theme.update(theme_params)
        format.html { redirect_to settings_theme_path(@theme), notice: 'Successfully updated settings.' }
        format.json { head :no_content }
      else
        format.html { render template: 'themes/settings' }
        format.json { render json: @theme.errors, status: :unprocessable_entity }
      end
    end
  end


  private

    def theme_params
      params.require(:theme).permit(
        :name,
        :description,
        :setting_groups_attributes => [
          :id,
          :name,
          :_destroy
        ]
      )
    end

end
