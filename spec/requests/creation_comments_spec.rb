# coding: utf-8
require 'rails_helper'

describe 'CreationComments', type: :request do
  before do
    site = create(:site, id: 900_000_001)
    site_user = create(:site_user, id: 900_000_001, site: site)
    create(:creation, id: 900_000_001, site: site, site_user: site_user)
    create(:site_user, id: 900_000_002, site: site)
  end

  describe 'POST /creations/{creation_id}/creation_comments' do
    let(:params) do
      {
        user_baas_id: SiteUser.find(900_000_001).user.baas_id,
        creation_comment: attributes_for(:creation_comment, id: 900_000_001, site_user_id: 900_000_002)
          .slice(:body)
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

  describe 'GET /creations/{creation_id}/comments' do
    before do
      create(:site_user, id: 900_000_003, site_id: 900_000_001)
      create(:creation, id: 900_000_002, site_id: 900_000_001)
      create(:creation_comment, creation_id: 900_000_001, site_user_id: 900_000_001, body: 'コメント1')
      create(:creation_comment, creation_id: 900_000_001, site_user_id: 900_000_002, body: 'コメント2')
      create(:creation_comment, creation_id: 900_000_001, site_user_id: 900_000_003, body: 'コメント3')
    end

    let(:params) do 
      {
        user_baas_id: SiteUser.find(900_000_001).user.baas_id
      }
    end

    it 'returns a creation' do
      #
      # execute
      #
      get_by_site(creation_creation_comments_path(900_000_001), 900_000_001, params)

      #
      # validate
      #
      expect(response).to be_success
      expect(response.status).to eq 200
      result = JSON.parse(response.body)
      expect(result['creation_comments'].count).to eq 3
    end
  end # GET
end
