require 'spec_helper'
  
  describe 'fruits/edit' do
    let(:fruit) { Fruit.create!(name: 'Second') }
    before do
      assign(:fruit, fruit)
      render
    end

    subject { rendered }

    it { should match 'Edit Fruit'}

    specify { expect(view).to render_template(partial: 'fruits/_form') }
  end
  