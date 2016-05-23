# coding: utf-8
require 'rails_helper'

describe SiteUser, type: :model do

  before(:all) do
    create(:user, id: 900_000_001)
    create(:user, id: 900_000_002)
    create(:user, id: 900_000_003)
  end
  
  describe 'create' do

    context 'with all parameters' do
      it 'creates a data' do
        #
        # setup
        #
        user = User.first
        biography = "バイオグラフィー\n" * 3
        tos_accepted = true
        site_user_status = SiteUserStatus::REGISTERED

        #
        # execute
        #
        SiteUser.create(id: 900_000_001, user: user, biography: biography, tos_accepted: tos_accepted, site_user_status: site_user_status)

        #
        # validate
        #
        site_user = SiteUser.find(900_000_001)
        expect(site_user.user).to eq user
        expect(site_user.sid).to_not be_nil
        expect(site_user.biography).to eq biography
        expect(site_user.tos_accepted).to eq tos_accepted
        expect(site_user.site_user_status).to eq site_user_status
      end
    end
    
  end

  describe 'read' do
    
    context 'with find' do
      it 'returns a data' do
        #
        # setup
        #
        create(:site_user, id: 900_000_001)

        #
        # execute
        #
        expect { SiteUser.find(900_000_001) }.to_not raise_error
      end
    end

  end

  describe 'update' do

    context 'each parameter' do
      it 'updates a data' do
        #
        # setup
        #
        user = User.first
        biography = "beforeバイオグラフィー\n" * 3
        tos_accepted = true
        site_user_status = SiteUserStatus::REGISTERED
        create(:site_user, id: 900_000_001, user: user, biography: biography, tos_accepted: tos_accepted, site_user_status: site_user_status)
        
        biography_after = "afterバイオグラフィー\n" * 3
        tos_accepted_after = false
        site_user_status_after = SiteUserStatus::RESIGNED
        site_user = SiteUser.find(900_000_001)
        site_user.biography = biography_after
        site_user.tos_accepted = tos_accepted_after
        site_user.site_user_status = site_user_status_after
        
        #
        # execute
        #
        site_user.save!

        #
        # validate
        #
        site_user_after = SiteUser.find(900_000_001)
        expect(site_user_after.biography).to eq biography_after
        expect(site_user_after.tos_accepted).to eq tos_accepted_after
        expect(site_user_after.site_user_status).to eq site_user_status_after
      end
    end
  end

  describe 'delete' do

    context 'normal condition' do
      it 'deletes a data' do
        #
        # setup
        #
        id = 900_000_001
        create(:site_user, id: id)
        site_user = SiteUser.find(id)

        #
        # execute
        #
        site_user.delete

        #
        # validate
        #
        expect(SiteUser.where(id: id).count).to eq 0
      end
    end
    
  end
  
end
