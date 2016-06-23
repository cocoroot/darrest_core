# coding: utf-8
require 'rails_helper'
require 'json'

describe 'CreationPieces', type: :request do
  before do
    site = create(:site, id: 900_000_001)
    site_user = create(:site_user, id: 900_000_001, site: site)
    create(:creation, id: 900_000_001, site: site, site_user: site_user)
  end

  describe 'POST /creations/{creation_id}/creation_pieces' do
    let(:params) do
      attr = attributes_for(:creation_piece, id: 900_000_001).slice(:name, :file, :image)
      {
        user_baas_id: SiteUser.find(900_000_001).user.baas_id,
        name: attr[:name],
        file: attr[:file],
        image: attr[:image]
      }
    end

    it 'responds 201' do
      #
      # execute
      #
      post_by_site(creation_creation_pieces_path(900_000_001), 900_000_001, params)

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
      expect { post_by_site(creation_creation_pieces_path(900_000_001), 900_000_001, params) }.to change { CreationPiece.count }.by(1)
    end
  end # POST

  describe 'PUT /creations/{creation_id}' do
    before do
      create(:creation_piece, id: 900_000_001, creation_id: 900_000_001)
    end

    let(:params) do
      {
        user_baas_id: SiteUser.find(900_000_001).user.baas_id,
        creation_piece: {
          name: '更新ファイル名'
        }
      }
    end

    it 'succeeds updating' do
      #
      # execute
      #
      put_by_site(creation_piece_path(900_000_001), 900_000_001, params)

      #
      # validate
      #
      expect(response).to be_success
      expect(response.status).to eq 200
      result = JSON.parse(response.body)
      expect(result['creation_pieces'].last['name']).to eq params[:creation_piece][:name]
    end
  end # PUT

  describe 'DELETE /creations/{creation_id}' do
    before do
      create(:creation_piece, id: 900_000_001, creation_id: 900_000_001)
    end

    let(:params) do
      {
        user_baas_id: SiteUser.find(900_000_001).user.baas_id
      }
    end

    it 'succeeds deleting' do
      #
      # execute
      #
      expect { delete_by_site(creation_piece_path(900_000_001), 900_000_001, params) }.to change { CreationPiece.count }.by(-1)
    end
  end # DELETE
end
