# coding: utf-8
require 'rails_helper'
require 'json'

describe 'CreationPieces', type: :request do
  before(:all) do
    site = create(:site, id: 900_000_001)
    site_user = create(:site_user, id: 900_000_001, site: site)
    create(:creation, id: 900_000_001, site: site, site_user: site_user)
  end

  describe 'POST /creations/{creation_id}/creation_pieces' do
    let(:params) do
      {
        creation_piece: attributes_for(:creation_piece, id: 900_000_001)
          .slice(:name, :file, :image)
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

  # describe 'GET /creation_pieces/{creation_piece_id}' do
  #   before do
  #     create(:creation_piece, id: 900_000_001, creation_id: 900_000_001)
  #   end

  #   it 'returns a creation' do
  #     #
  #     # execute
  #     #
  #     get_by_site(creation_piece_path(900_000_001), 900_000_001)

  #     #
  #     # validate
  #     #
  #     expect(response).to be_success
  #     expect(response.status).to eq 200
  #     result = JSON.parse(response.body)
  #     expect(result['id']).to eq 900_000_001
  #   end
  # end # GET

  describe 'PUT /creations/{creation_id}' do
    before do
      create(:creation_piece, id: 900_000_001, creation_id: 900_000_001)
    end

    let(:params) do
      {
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
      expect(result['name']).to eq params[:creation_piece][:name]
    end
  end # PUT

  describe 'DELETE /creations/{creation_id}' do
    before do
      create(:creation_piece, id: 900_000_001, creation_id: 900_000_001)
    end

    it 'succeeds deleting' do
      #
      # execute
      #
      expect { delete_by_site(creation_piece_path(900_000_001), 900_000_001) }.to change { CreationPiece.count }.by(-1)
    end
  end # DELETE
end

# require 'rails_helper'

# RSpec.describe "CreationPieces", type: :request do
#   describe "GET /creation_pieces" do
#     it "works! (now write some real specs)" do
#       get creation_pieces_path
#       expect(response).to have_http_status(200)
#     end
#   end
# end
