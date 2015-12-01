class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.create(kitten_params)
    if @kitten.save
      flash[:success] = "Kitten Successfully Created!"
      redirect_to kittens_url
    else
      flash.now[:danger] = "Error saving kitten"
      render 'new'
    end
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    @kitten = Kitten.find(params[:id])
    if @kitten.update_attributes(kitten_params)
      flash[:success] = "Kitten Successfully Updated!"
      redirect_to kittens_url
    else
      flash.now[:danger] = "Error updating kitten"
      render 'edit'
    end
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.destroy
    flash[:success] = "Kitten destroyed."
    redirect_to kittens_url
  end

  private

    # Never trust the scary internet!
    def kitten_params
      params.require(:kitten).permit(:name, :age, :cuteness, :softness)
    end
end
