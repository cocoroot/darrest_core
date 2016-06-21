# coding: utf-8
require 'rails_helper'

describe IndexLatestCreationLogic, type: :logic do
  before do
    site = create(:site, id: 900_000_001)
    create(:creation, id: 900_000_001, site: site, creation_status: CreationStatus::CREATING)
  end

  let(:params) do
    {
      site_id: 900_000_001,
      page: 1
    }
  end

  describe 'authorize' do
    context 'if Site does not exist,' do
      before do
        params.merge!(site_id: 900_000_002)
      end

      it 'denies a Creation' do
        #
        # execute
        #
        result = IndexLatestCreationLogic.new.authorize(params)

        #
        # validate
        #
        expect(result[:errors][:site].count).to eq 1
      end
    end
  end # validate

  describe 'execute' do
    before do
      site_user = create(:site_user, id: 900_000_002, site_id: 900_000_001)
      (1..10).each do |i|
        create(:creation, id: 900_000_100 + i, site_id: 900_000_001, site_user: site_user, creation_status: CreationStatus::PUBLISHED)
      end
      (11..20).each do |i|
        create(:creation, id: 900_000_100 + i, site_id: 900_000_001, site_user: site_user, creation_status: CreationStatus::CREATING)
      end
      (21..30).each do |i|
        create(:creation, id: 900_000_100 + i, site_id: 900_000_001, site_user: site_user, creation_status: CreationStatus::PUBLISHED)
      end

      params.merge!(site_user_id: 900_000_002, page: 2)
    end

    context 'normal condition' do
      it 'creates a Creation' do
        #
        # execute
        #
        result = IndexLatestCreationLogic.new.execute(params)

        #
        # validate
        #
        (0..9).each do |i|
          expect(result[:creations][i].creation_status).to eq CreationStatus::PUBLISHED
        end
        expect(result[:creations].count).to eq 10
      end
    end
  end # execute
end
