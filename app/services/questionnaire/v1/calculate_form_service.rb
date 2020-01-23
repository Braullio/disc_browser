# frozen_string_literal: true

module Questionnaire
  module V1
    # Service for calculate questionnaire and return profile
    class CalculateFormService
      def self.run(questionnaire)
        new(questionnaire).run
      end

      def run
        calculate
      end

      private

      def initialize(questionnaire)
        @questionnaire = questionnaire
      end

      def calculate
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
        @profile
      end

      def sum_question(number)
        (1..10).inject(0) do |sum, number_question|
          number_question.to_i < 10 ? number_question = "0#{number_question}" : nil
          sum.to_i + convert_array(@questionnaire["question#{number_question}"])[number]
        end
      end

      def convert_array(variable)
        variable.tr('[] "', '').split(',').map(&:to_i)
      end
    end
  end
end
