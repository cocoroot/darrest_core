# coding: utf-8
require 'rails_helper'
require 'json'

describe 'SiteUsers', type: :request do
  before(:all) do
    create(:user, id: 900_000_001)
    create(:site, id: 900_000_001)
  end

  let(:params) do
    {
      site_user: attributes_for(:site_user,
                                user_id: 900_000_001,
                                tos_accepted: false,
                                site_user_status: SiteUserStatus::INTERIM.id
                               )
    }
  end

  describe 'POST /site_users' do
    it 'responds 201' do
      #
      # execute
      #
      post_by_site(site_users_path, 900_000_001, params)

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
      expect { post_by_site(site_users_path, 900_000_001, params) }.to change { SiteUser.count }.by(1)
    end
  end

  describe 'PUT /site_users/{site_user_id}' do
    before do
      create(:site_user,
             id: 900_000_001,
             user_id: 900_000_001,
             biography: 'バイオグラフィー',
             tos_accepted: false,
             site_user_status: SiteUserStatus::INTERIM)
    end

    let(:params_for_update) do
      {
        site_user: attributes_for(:site_user,
                                  biography: '更新バイオグラフィー',
                                  tos_accepted: true,
                                  site_user_status_id: SiteUserStatus::REGISTERED.id
                                 )
      }
    end

    it 'succeeds updating' do
      #
      # execute
      #
      put_by_site(site_user_path(900_000_001), 900_000_001, params_for_update)

      #
      # validate
      #
      expect(response).to be_success
      expect(response.status).to eq 200
      result = JSON.parse(response.body)
      expect(result['biography']).to eq params_for_update[:site_user][:biography]
      expect(result['tos_accepted']).to eq params_for_update[:site_user][:tos_accepted]
      expect(result['site_user_status']).to eq params_for_update[:site_user][:site_user_status]
    end
  end

  describe 'GET /site_users/{site_user_id}' do
    before do
      create(:site_user,
             id: 900_000_001,
             site_id: 900_000_001,
            )
    end

    it 'returns a site_user' do
      #
      # execute
      #
      get_by_site(site_user_path(900_000_001), 900_000_001)

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
