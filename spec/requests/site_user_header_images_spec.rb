# coding: utf-8
require 'rails_helper'

describe 'SiteUserHeaderImages', type: :request do
  before do
    site = create(:site, id: 900_000_001)
    create(:site_user, id: 900_000_001, site: site)
  end

  describe 'POST /site_users/{site_user_id}/site_user_header_images' do
    let(:params) do
      {
        user_baas_id: SiteUser.find(900_000_001).user.baas_id,
        image: attributes_for(:site_user_header_image, id: 900_000_001)[:image]
      }
    end

    it 'responds 201' do
      #
      # execute
      #
      post_by_site(site_user_header_image_path(900_000_001), 900_000_001, params)

      #
      # validate
      #
      expect(response).to be_success
      expect(response.status).to eq 201
    end

    it 'creates a SiteUser' do
      #
      # execute
      #
      expect { post_by_site(site_user_header_image_path(900_000_001), 900_000_001, params) }.to change { SiteUserHeaderImage.unscoped.count }.by(1)
    end
  end # POST
end
