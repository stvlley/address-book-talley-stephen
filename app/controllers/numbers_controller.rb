class NumbersController < ApplicationController
  before_action :set_person

  def create 
      @number = @person.numbers.create(number_params)
      respond_to do |format|
        if @number.save
          format.html { redirect_to person_path(@person), notice: "Number was successfully created." }
          format.json { render :show, status: :created, location: @number }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @number.errors, status: :unprocessable_entity }
        end
      end
  end

  def destroy 
      @number = @person.numbers.find(params[:id])
      @number.destroy
      respond_to do |format|
        format.html { redirect_to people_url, notice: "Person was successfully destroyed." }
        format.json { head :no_content }
      end
  end 

  def index
      @number = Number.all
  end

  def show
      @number = Number.find(params[:id])
      @number = @person.numbers.find(params[:id])
    end

  def edit 
    @number = Number.find(params[:id])
  end

  def new
    @number = @person.numbers.new
  end

  def update
    @number = Number.find params[:id]
      respond_to do |format|
        if @number.update(number_params)
          format.html { redirect_to person_url(@person), notice: "Person successfully updated." }
          format.json { render :show, status: :ok, location: @person }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @number.errors, status: :unprocessable_entity }
        end
      end
    end

  private
      def number_params 
          params.require(:number).permit(:phone_number, :comment)
      end

      def set_person
          @person = Person.find(params[:person_id])
        end

end