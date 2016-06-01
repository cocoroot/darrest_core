# coding: utf-8
require 'rails_helper'
require 'json'

include ActionDispatch::TestProcess

describe 'SiteUserImages', type: :request do
  before(:all) do
    site = create(:site, id: 900_000_001)
    create(:site_user, id: 900_000_001, site: site)
  end

  describe 'POST /site_users/{site_user_id}/site_user_images' do
    let(:params) do
      {
        site_user_image: attributes_for(:site_user_image, id: 900_000_001)
          .slice(:image, :image_name_for_user, :order, :in_use)
      }
    end

    it 'responds 201' do
      #
      # execute
      #
      post_by_site(site_user_site_user_images_path(900_000_001), 900_000_001, params)

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
      expect { post_by_site(site_user_site_user_images_path(900_000_001), 900_000_001, params) }.to change { SiteUserImage.count }.by(1)
    end
  end # POST

  # describe 'GET /site_user_images/{site_user_image_id}' do
  #   before do
  #     create(:site_user_image, id: 900_000_001, site_user_id: 900_000_001)
  #   end

  #   it 'returns a site_user' do
  #     #
  #     # execute
  #     #
  #     get_by_site(site_user_image_path(900_000_001), 900_000_001)

  #     #
  #     # validate
  #     #
  #     expect(response).to be_success
  #     expect(response.status).to eq 200
  #     result = JSON.parse(response.body)
  #     expect(result['id']).to eq 900_000_001
  #   end
  # end # GET

  # describe 'PUT /site_users/{site_user_id}' do
  #   before do
  #     create(:site_user_image, id: 900_000_001, site_user_id: 900_000_001, order: 1, in_use: true)
  #   end

  #   let(:params) do
  #     {
  #       site_user_image: {
  #         image_name_for_user: '更新ファイル名.jpg',
  #         order: 777,
  #         in_use: false
  #       }
  #     }
  #   end

  #   it 'succeeds updating' do
  #     #
  #     # execute
  #     #
  #     put_by_site(site_user_image_path(900_000_001), 900_000_001, params)

  #     #
  #     # validate
  #     #
  #     expect(response).to be_success
  #     expect(response.status).to eq 200
  #     result = JSON.parse(response.body)
  #     expect(result['image_name_for_user']).to eq params[:site_user_image][:image_name_for_user]
  #     expect(result['order']).to eq params[:site_user_image][:order]
  #     expect(result['in_use']).to eq params[:site_user_image][:in_use]
  #   end
  # end # PUT

  # describe 'DELETE /site_users/{site_user_id}' do
  #   before do
  #     create(:site_user_image, id: 900_000_001, site_user_id: 900_000_001)
  #   end

  #   it 'succeeds deleting' do
  #     #
  #     # execute
  #     #
  #     expect { delete_by_site(site_user_image_path(900_000_001), 900_000_001) }.to change { SiteUserImage.count }.by(-1)
  #   end
  # end # DELETE
end
