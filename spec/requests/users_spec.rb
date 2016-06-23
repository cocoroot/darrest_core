# require 'rails_helper'

# describe 'Users', type: :request do
#   before do
#     create(:site, id: 900_000_001)
#   end

#   let(:params) do
#     {
#       user: attributes_for(:user)
#     }
#   end

#   describe 'POST /users' do
#     it 'responds 201' do
#       #
#       # execute
#       #
#       post_by_site(users_path, 900_000_001, params)

#       #
#       # validate
#       #
#       expect(response).to be_success
#       expect(response.status).to eq 201
#     end

#     it 'creates a User' do
#       #
#       # execute
#       #
#       expect { post_by_site(users_path, 900_000_001, params) }.to change { User.count }.by(1)
#     end
#   end
# end
