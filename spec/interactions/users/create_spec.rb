require 'rails_helper'


RSpec.describe Users::Create do
  let(:execute) { subject.class.run(params: params) }

  describe 'validations' do
    context 'with valid params' do
      let(:params) { attributes_for(:user) }

      it 'creates user' do
        expect { execute }.to change(User, :count).by(1)
      end
    end

    context "with invalid params" do
      let(:params) { { name: 'somename' } }
      
      it 'do not creates user' do
        expect { execute }.to change(User, :count).by(0)
      end
    end
  end

  describe '#execute' do
    context "with interests" do
      let(:interests) { create_list(:interest, 2) }
      let(:params) { attributes_for(:user).merge(interests: interests.map(&:name)) }
      let(:user) { execute.result }

      it 'adds it to user' do
        expect(user.interests).to eq(interests)
      end
    end

    context "with skills" do
      let(:skills_list) { create_list(:skill, 3) }
      let(:params) { attributes_for(:user).merge(skills: skills_list.map(&:name).join(',')) }
      let!(:user) { execute.result }

      it 'adds it to user' do
        expect(user.skills).to eq(skills_list)
      end
    end
  end
end
