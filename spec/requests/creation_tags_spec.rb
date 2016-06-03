# coding: utf-8
require 'rails_helper'
require 'json'

describe 'CreationTags', type: :request do
  before do
    site = create(:site, id: 900_000_001)
    site_user = create(:site_user, id: 900_000_001, site: site)
    create(:creation, id: 900_000_001, site: site, site_user: site_user)
  end

  describe 'POST /creations/{creation_id}/creation_tags' do
    let(:params) do
      {
        creation_tag: { tag_name: 'テストタグ' }
      }
    end

    it 'responds 201' do
      #
      # execute
      #
      post_by_site(creation_creation_tags_path(900_000_001), 900_000_001, params)

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
      expect { post_by_site(creation_creation_tags_path(900_000_001), 900_000_001, params) }.to change { CreationTag.count }.by(1)
    end
  end # POST

  describe 'DELETE /creation_tags/{creation_tag_id}' do
    before do
      create(:creation_tag, id: 900_000_001, creation_id: 900_000_001)
    end

    it 'succeeds deleting' do
      #
      # execute
      #
      expect { delete_by_site(creation_tag_path(900_000_001), 900_000_001) }.to change { CreationTag.count }.by(-1)
    end
  end # DELETE
end
