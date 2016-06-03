# coding: utf-8
require 'rails_helper'

describe CreateGoodLogic, type: :logic do
  before do
    site = create(:site, id: 900_000_001)
    site_user = create(:site_user, id: 900_000_001, site: site)
    create(:creation, id: 900_000_001, site: site, site_user: site_user)
  end

  describe '#authorize' do
    context 'if Site does not exist,' do
      let(:params) do
        {
          site_id: 900_000_002,
          good: attributes_for(:good, creation_id: 900_000_001, site_user_id: 900_000_001)
        }
      end

      it 'denies to create' do
        #
        # execute
        #
        result = CreateGoodLogic.new.execute(params)

        #
        # validate
        #
        expect(result[:errors][:site].count).to eq 1
      end
    end

    context 'if Creation does not exist,' do
      let(:params) do
        {
          site_id: 900_000_001,
          good: attributes_for(:good, creation_id: 900_000_002, site_user_id: 900_000_001)
        }
      end

      it 'denies to create' do
        #
        # execute
        #
        result = CreateGoodLogic.new.execute(params)

        #
        # validate
        #
        expect(result[:errors][:creation].count).to eq 1
      end
    end

    context 'if SiteUser does not exist,' do
      let(:params) do
        {
          site_id: 900_000_001,
          good: attributes_for(:good, creation_id: 900_000_001, site_user_id: 900_000_002)
        }
      end

      it 'denies to create' do
        #
        # execute
        #
        result = CreateGoodLogic.new.execute(params)

        #
        # validate
        #
        expect(result[:errors][:site_user].count).to eq 1
      end
    end
  end # authorize

  describe 'validate' do
    context '論理チェックエラー' do
      context 'if Creation and/or SiteUser does not belong to Site,' do
        before do
          create(:site, id: 900_000_002)
        end

        let(:params) do
          {
            site_id: 900_000_002,
            good: attributes_for(:good, creation_id: 900_000_001, site_user_id: 900_000_001)
          }
        end

        it 'returns error' do
          #
          # exectue
          #
          result = CreateGoodLogic.new.validate(params)

          #
          # validate
          #
          expect(result[:errors][:creation].count).to eq 1
          expect(result[:errors][:site_user].count).to eq 1
        end
      end
    end
  end # validate

  describe 'execute' do
    context 'normal condition' do
      let(:params) do
        {
          site_id: 900_000_001,
          good: attributes_for(:good, creation_id: 900_000_001, site_user_id: 900_000_001)
        }
      end

      it 'creates a Creation' do
        #
        # execute
        #
        expect { CreateGoodLogic.new.execute(params) }.to change { Good.count }.by(1)
      end
    end
  end # execute
end
