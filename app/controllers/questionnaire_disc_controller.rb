# frozen_string_literal: true

# Manager questionnaire in use
class QuestionnaireDiscController < ApplicationController
  before_action :questionnaire_params, only: %i[create]
  before_action :report_values, only: %i[show]

  def index; end

  def show; end

  def create
    @questionnaire = QuestionnaireDisc.new(@questionnaire_params)
    if @questionnaire.save
      flash[:success] = (t 'messages.success.create',
                           value: (t 'controller.board'))
      redirect_to questionnaire_disc_index_path
    else
      flash[:danger] = (t 'messages.error.create',
                          value: (t 'controller.board'))
      redirect_to root_path
    end
  end

  private

  def questionnaire_params
    @questionnaire_params = params.permit(
      :title,
      :question01, :question02, :question03, :question04, :question05,
      :question06, :question07, :question08, :question09, :question10
    )
  end

  def report_values
    @report = QuestionnaireDisc.find(params[:id])
    sum_question_index0
    sum_question_index1
    sum_question_index2
    sum_question_index3
    report_analytics
  end

  def sum_question_index0
    @sum_index0 = sum_question(0)
  end

  def sum_question_index1
    @sum_index1 = sum_question(1)
  end

  def sum_question_index2
    @sum_index2 = sum_question(2)
  end

  def sum_question_index3
    @sum_index3 = sum_question(3)
  end

  def report_analytics
    @value_max = [
      @sum_index0, @sum_index1,
      @sum_index2, @sum_index3
    ].max
    @profile = []
    @value_max.equal?(@sum_index0) ? @profile.push('D') : nil
    @value_max.equal?(@sum_index1) ? @profile.push('I') : nil
    @value_max.equal?(@sum_index2) ? @profile.push('S') : nil
    @value_max.equal?(@sum_index3) ? @profile.push('C') : nil
  end

  def sum_question(number)
    (1..10).inject(0) do |sum, number_question|
      number_question.to_i < 10 ? number_question = "0#{number_question}" : nil
      sum.to_i + convert_array(@report["question#{number_question}"])[number]
    end
  end

  def convert_array(variable)
    variable.tr('[] ', '').split(',').map(&:to_i)
  end
end
