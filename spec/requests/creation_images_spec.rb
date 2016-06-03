# coding: utf-8
require 'rails_helper'
require 'json'

describe 'CreationImages', type: :request do
  before do
    site = create(:site, id: 900_000_001)
    site_user = create(:site_user, id: 900_000_001, site: site)
    create(:creation, id: 900_000_001, site: site, site_user: site_user)
  end

  describe 'POST /creations/{creation_id}/creation_images' do
    let(:params) do
      {
        creation_image: attributes_for(:creation_image, id: 900_000_001)
          .slice(:image, :image_name_for_user, :order)
      }
    end

    it 'responds 201' do
      #
      # execute
      #
      post_by_site(creation_creation_images_path(900_000_001), 900_000_001, params)

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
      expect { post_by_site(creation_creation_images_path(900_000_001), 900_000_001, params) }.to change { CreationImage.count }.by(1)
    end
  end # POST

  describe 'GET /creation_images/{creation_image_id}' do
    before do
      create(:creation_image, id: 900_000_001, creation_id: 900_000_001)
    end

    it 'returns a creation' do
      #
      # execute
      #
      get_by_site(creation_image_path(900_000_001), 900_000_001)

      #
      # validate
      #
      expect(response).to be_success
      expect(response.status).to eq 200
      result = JSON.parse(response.body)
      expect(result['id']).to eq 900_000_001
    end
  end # GET

  describe 'PUT /creation_images/{creation_image_id}' do
    before do
      create(:creation_image, id: 900_000_001, creation_id: 900_000_001)
    end

    let(:params) do
      {
        creation_image: {
          image_name_for_user: '更新ファイル名.jpg',
          order: 777
        }
      }
    end

    it 'succeeds updating' do
      #
      # execute
      #
      put_by_site(creation_image_path(900_000_001), 900_000_001, params)

      #
      # validate
      #
      expect(response).to be_success
      expect(response.status).to eq 200
      result = JSON.parse(response.body)
      expect(result['image_name_for_user']).to eq params[:creation_image][:image_name_for_user]
      expect(result['order']).to eq params[:creation_image][:order]
    end
  end # PUT

  describe 'DELETE /creation_images/{creation_image_id}' do
    before do
      create(:creation_image, id: 900_000_001, creation_id: 900_000_001)
    end

    it 'succeeds deleting' do
      #
      # execute
      #
      expect { delete_by_site(creation_image_path(900_000_001), 900_000_001) }.to change { CreationImage.count }.by(-1)
    end
  end # DELETE
end
