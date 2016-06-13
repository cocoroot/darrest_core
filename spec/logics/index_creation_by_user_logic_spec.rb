# coding: utf-8
require 'rails_helper'

describe IndexCreationByUserLogic, type: :logic do
  before do
    site = create(:site, id: 900_000_001)
    site_user = create(:site_user, id: 900_000_001, site: site)
    create(:creation, id: 900_000_001, site: site, site_user: site_user)
  end

  let(:params) do
    {
      site_id: 900_000_001,
      site_user_id: 900_000_001,
      page: 2
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
        result = IndexCreationByUserLogic.new.authorize(params)

        #
        # validate
        #
        expect(result[:errors][:site].count).to eq 1
      end
    end

    context 'if SiteUser does not exist,' do
      before do
        params.merge!(site_user_id: 900_000_002)
      end

      it 'denies a Creation' do
        #
        # execute
        #
        result = IndexCreationByUserLogic.new.authorize(params)

        #
        # validate
        #
        expect(result[:errors][:site_user].count).to eq 1
      end
    end
  end

  describe 'validate' do
    context '論理チェックエラー' do
      before do
        create(:site, id: 900_000_002)
        params.merge!(site_id: 900_000_002)
      end

      it 'returns error' do
        #
        # exectue
        #
        result = IndexCreationByUserLogic.new.validate(params)

        #
        # validate
        #
        expect(result[:errors][:site_user].count).to eq 1
      end
    end
  end # validate

  describe 'execute' do
    before do
      site_user = create(:site_user, id: 900_000_002, site_id: 900_000_001)
      (1..21).each do |i|
        create(:creation, id: 900_000_100 + i, site_id: 900_000_001, site_user: site_user)
      end

      params.merge!(site_user_id: 900_000_002, page: 2)
    end

    context 'normal condition' do
      it 'creates a Creation' do
        #
        # execute
        #
        result = IndexCreationByUserLogic.new.execute(params)

        #
        # validate
        #
        (0..9).each do |i|
          expect(result[:creations][i].id).to eq 900_000_111 + i
        end
        expect(result[:creations].count).to eq 10
      end
    end
  end # execute
end
