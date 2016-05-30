# coding: utf-8
require 'rails_helper'
require 'json'

describe 'Creations', type: :request do
  before(:all) do
    site = create(:site, id: 900_000_001)
    create(:site_user, id: 900_000_001, site: site)
  end

  let(:params) do
    {
      creation: attributes_for(:creation,
                               site_id: 900_000_001,
                               site_user_id: 900_000_001,
                               title: 'テストタイトル',
                               description: 'テスト内容',
                               creation_status: CreationStatus::CREATING.id
                              )
    }
  end

  describe 'POST /creations' do
    it 'responds 201' do
      #
      # execute
      #
      post_by_site(creations_path, 900_000_001, params)

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
      expect { post_by_site(creations_path, 900_000_001, params) }.to change { Creation.count }.by(1)
    end
  end

  describe 'PUT /creations/{creation_id}' do
    before do
      create(:creation,
             id: 900_000_001,
             site_id: 900_000_001,
             site_user_id: 900_000_001,
             title: 'テストタイトル',
             description: 'テスト内容',
             creation_status: CreationStatus::CREATING)
    end

    let(:params_for_update) do
      {
        creation: attributes_for(:creation,
                                 id: 900_000_001,
                                 title: '更新テストタイトル',
                                 description: '更新テスト内容',
                                 creation_status_id: CreationStatus::PUBLISHED.id
                                )
      }
    end

    it 'succeeds updating' do
      #
      # execute
      #
      put_by_site(creation_path(900_000_001), 900_000_001, params_for_update)

      #
      # validate
      #
      expect(response).to be_success
      expect(response.status).to eq 200
      result = JSON.parse(response.body)
      expect(result['title']).to eq params_for_update[:creation][:title]
      expect(result['description']).to eq params_for_update[:creation][:description]
    end
  end

  describe 'GET /creations/{creation_id}' do
    before do
      create(:creation,
             id: 900_000_001,
             site_id: 900_000_001,
             site_user_id: 900_000_001,
            )
    end

    it 'returns a creation' do
      #
      # execute
      #
      get_by_site(creation_path(900_000_001), 900_000_001)

      #
      # validate
      #
      expect(response).to be_success
      expect(response.status).to eq 200
      result = JSON.parse(response.body)
      expect(result['id']).to eq 900_000_001
    end
  end
end
