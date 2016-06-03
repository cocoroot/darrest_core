# coding: utf-8
require 'rails_helper'
require 'json'

describe 'Good', type: :request do
  before do
    site = create(:site, id: 900_000_001)
    site_user = create(:site_user, id: 900_000_001, site: site)
    create(:creation, id: 900_000_001, site: site, site_user: site_user)
    create(:site_user, id: 900_000_002, site: site)
  end

  describe 'POST /creations/{creation_id}/goods' do
    let(:params) do
      {
        good: attributes_for(:good, id: 900_000_001, site_user_id: 900_000_002)
      }
    end

    it 'responds 201' do
      #
      # execute
      #
      post_by_site(creation_goods_path(900_000_001), 900_000_001, params)

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
      expect { post_by_site(creation_goods_path(900_000_001), 900_000_001, params) }.to change { Good.count }.by(1)
    end
  end # POST

  describe 'GET /site_users/{site_user_id}/goods' do
    before do
      site_user = create(:site_user, id: 900_000_003, site_id: 900_000_001)
      create(:creation, id: 900_000_002, site_id: 900_000_001)
      create(:creation, id: 900_000_003, site_id: 900_000_001)
      create(:good, creation_id: 900_000_001, site_user: site_user)
      create(:good, creation_id: 900_000_002, site_user: site_user)
      create(:good, creation_id: 900_000_003, site_user: site_user)
    end

    it 'returns a creation' do
      #
      # execute
      #
      get_by_site(site_user_goods_path(900_000_003), 900_000_001)

      #
      # validate
      #
      expect(response).to be_success
      expect(response.status).to eq 200
      result = JSON.parse(response.body)
      expect(result.count).to eq 3
    end
  end # GET

  describe 'DELETE /creations/{creation_id}' do
    before do
      create(:good, id: 900_000_001, creation_id: 900_000_001, site_user_id: 900_000_002)
    end

    it 'succeeds deleting' do
      #
      # execute
      #
      expect { delete_by_site(good_path(900_000_001), 900_000_001) }.to change { Good.count }.by(-1)
    end
  end # DELETE
end
