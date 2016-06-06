# coding: utf-8
require 'rails_helper'

describe 'SiteUserImages', type: :request do
  before do
    site = create(:site, id: 900_000_001)
    create(:site_user, id: 900_000_001, site: site)
  end

  describe 'POST /site_users/my/site_user_image' do
    let(:params) do
      {
        user_baas_id: SiteUser.find(900_000_001).user.baas_id,
        site_user_image: attributes_for(:site_user_image, id: 900_000_001)
          .slice(:image)
      }
    end

    it 'responds 201' do
      #
      # execute
      #
      post_by_site(site_user_image_path, 900_000_001, params)

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
      expect { post_by_site(site_user_image_path, 900_000_001, params) }.to change { SiteUserImage.count }.by(1)
    end
  end # POST
end
