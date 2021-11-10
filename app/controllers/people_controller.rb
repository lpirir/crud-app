class PeopleController < ApplicationController
  layout 'application'

  add_flash_types :notice

  def index
    @people = Person.all
  end

  def read
    @person = params[:url]
    @person = Person.where(url: @person)
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(post_params)

    if @person.save
      flash[:notice] = "Creado exitosamente!"
      redirect_to root_path
    end
  end
    
  def edit
    @person = Person.find(params[:id])
  end

  def update
    person = Person.find(params[:id])
    person.update(post_params)

    redirect_to root_path
  end

  def destroy
    person = Person.find(params[:id])
    person.destroy

    redirect_to root_path
  end

  def post_params
    params.require(:person).permit(:nombre, :apellido, :cui)
  end
end
