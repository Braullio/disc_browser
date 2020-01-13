# frozen_string_literal: true

# QUestionnaire Disc Model
class QuestionnaireDisc < ApplicationRecord
  include Questionnaire

  after_create :calculate_profile

  def calculate_profile
    profile = Questionnaire::V1::CalculateFormService.run(self)
    update_attribute(:profile, profile)
  end
end
