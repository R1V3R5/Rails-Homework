require 'spec_helper'

  describe 'fruits/_form' do
    let(:fruit) { Fruit.new }

    before do
      view.stub(:fruit) { fruit }
      render
    end

    subject { rendered }

    it { should have_selector 'form' }

    it 'has the necessary form fields' do
      expect(rendered).to have_selector "input[name='fruit[name]']"
    end
  end
