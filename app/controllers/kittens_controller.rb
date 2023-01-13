class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      flash[:success] = "Kitten saved"
      redirect_to kittens_path
    else
      flash[:error] = "Kitten not saved"
      render "new", status: :unprocessable_entity
    end
  end

  def update
    @kitten = Kitten.find(params[:id])
    if @kitten.update(kitten_params)
      flash[:success] = "Kitten updated"
      redirect_to @kitten
    else
      flash[:error] = "Kitten not updated"
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.destroy
    flash[:success] = "Kitten deleted"
    redirect_to root_path, status: :see_other
  end

  private def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
