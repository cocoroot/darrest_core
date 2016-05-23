# coding: utf-8
require 'rails_helper'

describe Creation, type: :model do

  before(:all) do
    create(:site_user, id: 900_000_001)
  end
  
  describe 'create' do

    context 'in normal condition' do
      it 'creates a data' do
        #
        # setup
        #
        site_user = SiteUser.find(900_000_001)
        title = 'テストタイトル'
        description = "クリエイション内容\n" * 3
        license_code = 'ダミーライセンス'
        creation_status = CreationStatus::PUBLISHED

        #
        # execute
        #
        Creation.create(id: 900_000_001, site_user: site_user, title: title, description: description, license_code: license_code, creation_status: creation_status)

        #
        # validate
        #
        creation = Creation.find(900_000_001)
        expect(creation.site_user).to eq site_user
        expect(creation.title).to eq title
        expect(creation.description).to eq description
        expect(creation.license_code).to eq license_code
        expect(creation.creation_status).to eq creation_status
      end
    end
    
  end # create

  describe 'read' do

    context 'with find' do
      it 'returns a data' do
        #
        # setup
        #
        create(:creation, id: 900_000_001)

        #
        # execute
        #
        expect { Creation.find(900_000_001) }.to_not raise_error
      end
    end
    
  end # read

  describe 'update' do

    context 'each parameter' do
      it 'updates a data' do
        #
        # setup
        #
        site_user = SiteUser.find(900_000_001)
        title = 'テストタイトル'
        description = "クリエイション内容\n" * 3
        license_code = 'ダミーライセンス'
        creation_status = CreationStatus::PUBLISHED
        create(:creation, id: 900_000_001, site_user: site_user, title: title, description: description, license_code: license_code, creation_status: creation_status)

        title_after = 'afterテストタイトル'
        description_after = "afterクリエイション内容\n" * 3
        license_code_after = 'afterダミーライセンス'
        creation_status_after = CreationStatus::PRIVATE
        creation = Creation.find(900_000_001)
        creation.title = title_after
        creation.description = description_after
        creation.license_code = license_code_after
        creation.creation_status = creation_status_after

        #
        # execute
        #
        creation.save!

        #
        # validate
        #
        creation_after = Creation.find(900_000_001)
        expect(creation_after.title).to eq title_after
        expect(creation_after.description).to eq description_after
        expect(creation_after.license_code).to eq license_code_after
        expect(creation_after.creation_status).to eq creation_status_after
      end
    end
    
  end # update

  describe 'delete' do

    context 'normal condition' do
      it 'delets a data' do
        #
        # setup
        #
        id = 900_000_001
        create(:creation, id: id)
        creation = Creation.find(id)

        #
        # execute
        #
        creation.delete

        #
        # validate
        #
        expect(Creation.where(id: id).count).to eq 0
      end
    end
    
  end
end

