# coding: utf-8
require 'rails_helper'
require 'json'

describe 'CreationComments', type: :request do
  before(:all) do
    site = create(:site, id: 900_000_001)
    site_user = create(:site_user, id: 900_000_001, site: site)
    create(:creation, id: 900_000_001, site: site, site_user: site_user)
    create(:site_user, id: 900_000_002, site: site)
  end

  describe 'POST /creations/{creation_id}/creation_comments' do
    let(:params) do
      {
        creation_comment: attributes_for(:creation_comment, id: 900_000_001, site_user_id: 900_000_002)
          .slice(:site_user_id, :body)
      }
    end

    it 'responds 201' do
      #
      # execute
      #
      post_by_site(creation_creation_comments_path(900_000_001), 900_000_001, params)

      #
      # validate
      #
      expect(response).to be_success
      expect(response.status).to eq 201
    end

    it 'creates a Creation' do
      #
      # execute
      #
      expect { post_by_site(creation_creation_comments_path(900_000_001), 900_000_001, params) }.to change { CreationComment.count }.by(1)
    end
  end # POST

  # describe 'GET /creation_comments/{creation_comment_id}' do
  #   before do
  #     create(:creation_comment, id: 900_000_001, creation_id: 900_000_001)
  #   end

  #   it 'returns a creation' do
  #     #
  #     # execute
  #     #
  #     get_by_site(creation_comment_path(900_000_001), 900_000_001)

  #     #
  #     # validate
  #     #
  #     expect(response).to be_success
  #     expect(response.status).to eq 200
  #     result = JSON.parse(response.body)
  #     expect(result['id']).to eq 900_000_001
  #   end
  # end # GET

  # describe 'PUT /creations/{creation_id}' do
  #   before do
  #     create(:creation_comment, id: 900_000_001, creation_id: 900_000_001)
  #   end

  #   let(:params) do
  #     {
  #       creation_comment: {
  #         name: '更新ファイル名'
  #       }
  #     }
  #   end

  #   it 'succeeds updating' do
  #     #
  #     # execute
  #     #
  #     put_by_site(creation_comment_path(900_000_001), 900_000_001, params)

  #     #
  #     # validate
  #     #
  #     expect(response).to be_success
  #     expect(response.status).to eq 200
  #     result = JSON.parse(response.body)
  #     expect(result['name']).to eq params[:creation_comment][:name]
  #   end
  # end # PUT

  # describe 'DELETE /creations/{creation_id}' do
  #   before do
  #     create(:creation_comment, id: 900_000_001, creation_id: 900_000_001)
  #   end

  #   it 'succeeds deleting' do
  #     #
  #     # execute
  #     #
  #     expect { delete_by_site(creation_comment_path(900_000_001), 900_000_001) }.to change { CreationComment.count }.by(-1)
  #   end
  # end # DELETE
end
