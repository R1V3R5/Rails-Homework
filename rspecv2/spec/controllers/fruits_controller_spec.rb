require 'spec_helper'


describe FruitsController do
  let(:fruit) { Fruit.create!(name: 'First Test') }

  subject { response } 

  describe 'GET #index' do
    it 'does not break' do
      get :index
      expect(response).to be_success
    end
  end

  describe 'GET #new' do
    before do
      get :new
    end

    it 'instantiates a new fruit object' do
      expect(assigns(:fruit).new_record?).to be_true
      expect(assigns(:fruit).class).to eq Fruit
    end

    it { should be_success }
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'successfully creates fruit' do
        expect { 
          post :create, fruit: { name: 'First' } 
          }.to change(Fruit, :count).by(1)
        expect(response).to redirect_to(fruits_path)
      end
    end
  end
      
    context 'with Invalid attributes' do
      it 'does not create a fruit and redirects' do
        expect {
          post :create, fruit: { name: nil }
        }.to_not change(Fruit, :count)
        expect(response).to render_template ("new")
      end
    end
  
  describe 'GET #edit' do
    before do
      get :edit, id: fruit
    end

    it 'assigns the fruit variable' do
      expect(assigns(:fruit)).to eq fruit
      expect(response).to be_success
    end
  end

  #   describe 'GET #show' do
  #   before do
  #     get :edit, id: fruit
  #   end

  #   it 'assigns the fruit variable' do
  #     expect(assigns(:fruit)).to eq fruit
  #     expect(response).to be_success
  #   end
  # end



end
