class QuestionsController < ApplicationController
  before_filter :find_question, only: [:show, :edit, :update]

  def index
    @questions = Question.all
    @user_check = session[:user_check]
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new question_params
    if @question.save
      redirect_to root_path, notice: 'Question created successfully.'
    else
      render :new
    end
  end

  def update
    if @question.update_attributes question_params
      redirect_to root_path, notice: 'Question saved successfully.'
    else
      render :edit
    end
  end

  def show
    @question.question = @question.question.html_safe
  end

  def answer
     @answer = params[:answer][:answer]
     if Question.find(params[:id]).is_correct?(params[:answer][:answer])
      session[:user_check] = "Correct! You got it right!"
      # binding.pry
      redirect_to root_path
    else
      session[:user_check] = "Aww, you got it wrong!"
      # binding.pry
      redirect_to root_path
    end
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:question, :answer)
  end
end
