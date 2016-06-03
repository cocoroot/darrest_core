# coding: utf-8
require 'rails_helper'

describe CreateUserLogic, type: :logic do
  before do
    site = create(:site, id: 900_000_001)
    create(:site_user, id: 900_000_001, site: site)
  end

  let(:params) do
    {
      user: attributes_for(:user)
    }
  end

  describe 'validate' do
    context '型チェックエラー' do
      context 'baas_id is null' do
        before do
          params[:user].merge!(baas_id: nil )
        end

        it 'returns error' do
          #
          # exectue
          #
          result = CreateUserLogic.new.validate(params)

          #
          # validate
          #
          expect(result[:errors][:baas_id].count).to eq 1
        end
      end

      context 'baas_id is not unique' do
        before do
          attributes = attributes_for(:user)
          create(:user, baas_id: attributes[:baas_id])
          params[:user].merge!(baas_id: attributes[:baas_id])
        end

        it 'returns error' do
          #
          # execute
          #
          result = CreateUserLogic.new.validate(params)

          #
          # validate
          #
          expect(result[:errors][:baas_id].count).to eq 1
        end
      end
    end
  end # validate

  describe 'execute' do
    context 'normal condition' do
      it 'creates a User' do
        #
        # execute
        #
        expect { CreateUserLogic.new.execute(params) }.to change { User.count }.by(1)
      end
    end
  end # execute
end
