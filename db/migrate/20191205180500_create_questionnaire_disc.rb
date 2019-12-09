class CreateQuestionnaireDisc < ActiveRecord::Migration[5.2]
  def change
    create_table :questionnaire_discs do |t|
      t.timestamps
      t.string  :question01, null: false
      t.string  :question02, null: false
      t.string  :question03, null: false
      t.string  :question04, null: false
      t.string  :question05, null: false
      t.string  :question06, null: false
      t.string  :question07, null: false
      t.string  :question08, null: false
      t.string  :question09, null: false
      t.string  :question10, null: false
    end
  end
end
