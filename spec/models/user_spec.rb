require 'rails_helper'

describe User, type: :model do
  
  describe 'create' do
    
    context 'with baas_id in normal condition' do
      it 'creates a data' do
        #
        # setup
        #
        baas_id = '5339fb650500-cccb-6e11-8802-00738c56'

        #
        # execute
        #
        User.create(baas_id: baas_id)

        #
        # validate
        #
        users = User.where(baas_id: baas_id)
        expect(users.count).to eq 1
        user = users.take
        expect(user.baas_id).to eq baas_id
      end
    end
    
    context 'with duplicated baas_id' do
      it 'refuses the creation' do
        #
        # setup
        #
        baas_id = '5339fb650500-cccb-6e11-8802-00738c56'
        create(:user, baas_id: baas_id)

        #
        # exectue
        #
        expect do
          User.create(baas_id: baas_id)
        end.to raise_error(ActiveRecord::RecordNotUnique)
      end
    end

    context 'with null baas_id' do
      it 'refuses the creation' do
        #
        # execute
        #
        expect { User.create(baas_id: null) }.to raise_error(ArgumentError)
      end
    end

  end

  describe 'read' do
    
    context 'with find' do
      it 'returns a data' do
        #
        # setup
        #
        baas_id = '5339fb650500-cccb-6e11-8802-00738c56'
        create(:user, id: 900_000_001, baas_id: baas_id)
        
        #
        # execute
        #
        user = User.find(900_000_001)

        #
        # validate
        #
        expect(user.baas_id).to eq baas_id
      end
    end

    context 'with where' do
      it 'returns a data' do
        #
        # setup
        #
        baas_id = '5339fb650500-cccb-6e11-8802-00738c56'
        create(:user, id: 900_000_002, baas_id: baas_id)
        
        #
        # execute
        #
        user = User.where(baas_id: baas_id).take

        #
        # validate
        #
        expect(user.id).to eq 900_000_002
      end
    end
    
  end

  describe 'update' do

    context 'with baas_id in normal condition' do
      it 'update a data' do 
        #
        # setup
        #
        baas_id = '5339fb650500-cccb-6e11-8802-00738c56'
        updated_id = 'updated50500-cccb-6e11-8802-00738c56'
        create(:user, baas_id: baas_id)
        user = User.where(baas_id: baas_id).take
        user.baas_id = updated_id

        #
        # execute
        #
        user.save!

        #
        # validate
        #
        updated_users = User.where(baas_id: updated_id)
        expect(updated_users.count).to eq 1
      end
    end

  end

  describe 'delete' do

    context 'normal condition' do
      it 'delete a data' do
        #
        # setup
        #
        baas_id = '5339fb650500-cccb-6e11-8802-00738c56'
        create(:user, baas_id: baas_id)
        user = User.where(baas_id: baas_id).take

        #
        # execute
        #
        user.delete

        #
        # validate
        #
        expect(User.where(baas_id: baas_id).count).to eq 0
        
      end
    end
    
  end
end
