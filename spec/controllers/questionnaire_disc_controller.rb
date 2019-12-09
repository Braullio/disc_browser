require 'rails_helper'

RSpec.describe QuestionnaireDiscController, type: :controller do
  let(:quest) {
    { question01: '[1,3,2,4]', question02: '[1,3,2,4]',
      question03: '[1,3,2,4]', question04: '[1,3,2,4]',
      question05: '[1,3,2,4]', question06: '[1,3,2,4]',
      question07: '[1,3,2,4]', question08: '[1,3,2,4]',
      question09: '[1,3,2,4]', question10: '[1,3,2,4]' }
  }
  let(:question) { QuestionnaireDisc.create(quest) }

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #report' do
    it 'returns a success response' do
      get :show, params: { id: question.id }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'save a new questionnaire DISC' do
        expect {
          post :create, params: quest
        }.to change(QuestionnaireDisc, :count).by(1)
      end

      it 'redirects to the save questionnaire DISC' do
        post :create, params: quest
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
