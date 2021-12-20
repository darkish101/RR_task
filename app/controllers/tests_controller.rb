class TestsController < ApplicationController
  before_action :set_test, only: %i[ show edit update destroy ]
  # before_action :set_question, only: %i[ show edit update destroy ]
  # before_action :set_anser, only: %i[ show edit update destroy ]

  # GET /tests or /tests.json
  def index
     #@tests = Test.all
     @tests = Test.joins(:user).where(user_id: current_user.id)
     @tests = @tests.left_outer_joins(:questions).uniq
          #.find_by(user_id: params[current_user.id])
    #@tests = current_user.tests.find_by(id: params[:id])
  end

  # GET /tests/1 or /tests/1.json
  def show
  end

  # GET /tests/new
  def new
    #@test = Test.new
  
    @test = current_user.tests.build
    @question = Question.new
    #@question = @test.questions.build
  end

  # GET /tests/1/edit
  def edit
          @questions = Question.left_outer_joins(:test).where(test_id: @test.id).uniq
          @ansers = Anser.all#left_outer_joins(:question)#.where(question_id:  Question.left_outer_joins(:test).where(test_id: @test.id).id).uniq
  @updateparams ='hi from controller'

  end

  # POST /tests or /tests.json
  def create
  if params[:create_and_add]
    redirect_to_action create_question
  end
    @test = Test.new(test_params)
    respond_to do |format|
      if @test.save
        format.html { redirect_to @test, notice: "Test was successfully created." }
        format.json { render :show, status: :created, location: @test }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_question

  # @test = current_user.Test.find_by(id: params[:id])
    @question = Question.new({ :question => params[:test][:question], :test_id => params[:test][:test_id]  })

    respond_to do |format|
      if  @question.save
        format.html { redirect_to edit_test_path(id: params[:test][:test_id]), notice: "Test was successfully created." }
        format.json { render :show, status: :created, location: @test }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: edit_test_path(id: params[:test][:test_id]).errors, status: :unprocessable_entity }
      end
    end
  end
  def create_anser

  # @test = current_user.Test.find_by(id: params[:id])
    @anser = Anser.new({ :question => params[:test][:question], :test_id => params[:test][:test_id]  })

    respond_to do |format|
      if  @anser.save
        format.html { redirect_to edit_test_path(id: params[:test][:test_id]), notice: "Test was successfully created." }
        format.json { render :show, status: :created, location: @test }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: edit_test_path(id: params[:test][:test_id]).errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tests/1 or /tests/1.json
  def update
  # if params[:add_question]
  #    create_question# and return
  # # elseif params[:add_anser]
  # #   create
  # # elsif 
    
  # # end
    @pdateparams = debug(params)
  # else
    #   respond_to do |format|
    #     if @test.update(test_params)# || @question.update(question_params) || @anser.update(anser_params)
    #       #  @question.save(test_params)
    #       # @anser.save
    #        @updateparams = 'hello again'# params[:test][:description]
    #       format.html { redirect_to @test, notice:  params[:test]}# "Test was successfully updated." }
    #       format.json { render :show, status: :ok, location: @test }
    #     else
    #       format.html { render :edit, status: :unprocessable_entity }
    #       format.json { render json: @test.errors, status: :unprocessable_entity }
    #     end
    #   end
    # # end
  end

  # DELETE /tests/1 or /tests/1.json
  def destroy #deleteTest
    @test.destroy
    respond_to do |format|
      format.html { redirect_to tests_path, notice: "Test was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def deleteQuestion #destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to @test, notice: "Question was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def deleteAnser #destroy
    @anser.destroy
    respond_to do |format|
      format.html { redirect_to @test, notice: "Anser was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test
      @test = Test.find(params[:id])
      # @question = Question.left_outer_joins(:test).where(test_id: @test.id).uniq
    end
   
    # # Only allow a list of trusted parameters through.
    # def test_params
    #   # params.permit(test:[ :name, :description, :user_id], question: [:question, :test_id], anser: [:anser, :value, :question_id] )
    #   params.require(:test).permit(:name, :description, :user_id)
    # end
    # def question_params
    #   params.require(:question).permit(:question, :test_id)
    # end
    # def anser_params
    #   params.require(:anser).permit(:anser, :value, :question_id)
    # end
end
