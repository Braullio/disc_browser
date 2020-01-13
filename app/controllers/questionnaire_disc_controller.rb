# frozen_string_literal: true

# Manager questionnaire in use
class QuestionnaireDiscController < ApplicationController
  before_action :questionnaire, only: %i[create]
  before_action :report_values, only: %i[show]
  before_action :all_questionnaire, only: %i[history]

  def index; end

  def show; end

  def create
    if @questionnaire.save
      flash[:success] = (t 'messages.success.create',
                           value: (t 'controller.questionnaire'))
      redirect_to questionnaire_disc_path(@questionnaire)
    else
      flash[:danger] = (t 'messages.error.create',
                          value: (t 'controller.questionnaire'))
      redirect_to root_path
    end
  end

  def history; end

  private

  def questionnaire
    @questionnaire = QuestionnaireDisc.new
    @questionnaire.title = params[:title]
    bind_attribute(params)
  end

  def bind_attribute(params)
    (1..10).each do |number_question|
      number_question.to_i < 10 ? number_question = "0#{number_question}" : nil
      @questionnaire["question#{number_question}"] =
        params.require("question#{number_question}").values.to_s.tr('"', '')
    end
  end

  def all_questionnaire
    @all_questionnaire = QuestionnaireDisc.all
  end

  def report_values
    @report = QuestionnaireDisc.find(params[:id])
    @profile = @report.profile.tr('[] "', '').split(',').map(&:to_s)
  end
end
