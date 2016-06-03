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
end
