require 'rails_helper'
require 'rspec/rails'
RSpec.describe UsersController, type: :controller do

  describe 'users#create' do
    context 'ログインした場合' do
      before do
        user = create(:user)
        allow(User).to receive(:find_by).and_return(user)
      end
      it 'indexへ遷移すること' do
        post :create
        expect(response).to redirect_to index_path
      end
   
end

end