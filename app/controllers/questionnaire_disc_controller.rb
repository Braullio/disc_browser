class QuestionnaireDiscController < ApplicationController
  before_action :questionnaire_params, only: %i[create]
  before_action :report_values, only: %i[show]

  def index; end

  def show; end

  def create
    @questionnaire = QuestionnaireDisc.new(@questionnaire_params)
    if @questionnaire.save
      flash[:success] = (t 'messages.success.create', value: (t 'controller.board'))
      redirect_to questionnaire_disc_index_path
    else
      flash[:danger] = (t 'messages.error.create', value: (t 'controller.board'))
      redirect_to root_path
    end
  end

  private
  def questionnaire_params
    @questionnaire_params = params.permit(:question01, :question02, :question03,
                                          :question04, :question05, :question06,
                                          :question07, :question08, :question09,
                                          :question10)
  end

  def report_values
    @report = QuestionnaireDisc.find(params[:id])
    report_analytics
  end

  def report_analytics
    @value_max = [sum_question(0), sum_question(1), sum_question(2), sum_question(3)].max
    @profile = []
    @value_max.equal?(sum_question(0)) ? @profile.push('D') : nil
    @value_max.equal?(sum_question(1)) ? @profile.push('I') : nil
    @value_max.equal?(sum_question(2)) ? @profile.push('S') : nil
    @value_max.equal?(sum_question(3)) ? @profile.push('C') : nil
  end

  def sum_question(number)
    [convert_array(@report.question01)[number], convert_array(@report.question02)[number],
    convert_array(@report.question03)[number], convert_array(@report.question04)[number],
    convert_array(@report.question05)[number], convert_array(@report.question06)[number],
    convert_array(@report.question07)[number], convert_array(@report.question08)[number],
    convert_array(@report.question09)[number], convert_array(@report.question10)[number]].sum
  end

  def convert_array(variable)
    variable.tr('[]', '').split(',').map(&:to_i)
  end
end
