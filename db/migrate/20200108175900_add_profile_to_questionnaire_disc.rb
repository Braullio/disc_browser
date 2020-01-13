class AddProfileToQuestionnaireDisc < ActiveRecord::Migration[5.2]
  def change
    add_column :questionnaire_discs, :profile, :string
  end
end