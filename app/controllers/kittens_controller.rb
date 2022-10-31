class KittensController < ApplicationController
  def index
    @kittens = Kitten.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @kittens }
      format.json { render :json => @kittens }
    end
  end

  def show
    @kitten = Kitten.find(params[:id])

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @kitten }
      format.json { render :json => @kitten }
    end
  end
  
  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)

    if @kitten.save
      redirect_to @kitten, notice: "Kitten Successfully Created!"
    else
      flash.now[:notice] = "Couldn't Create Kitty :("
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    @kitten = Kitten.find(params[:id])

    if @kitten.update(kitten_params)
      redirect_to @kitten, notice: "Kitten Successfully Updated!"
    else
      flash.now[:notice] = "Oops! Couldn't Update Kitty :("
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @kitten = Kitten.find(params[:id])

    @kitten.destroy

    redirect_to root_path, status: :see_other, notice: "Kitty gone, dead and gone..."
  end

  private

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
