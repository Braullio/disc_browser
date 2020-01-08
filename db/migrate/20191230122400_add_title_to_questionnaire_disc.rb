class AddTitleToQuestionnaireDisc < ActiveRecord::Migration[5.2]
  def change
    add_column :questionnaire_discs, :title, :string
  end
end