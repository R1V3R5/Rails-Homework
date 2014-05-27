require 'spec_helper'

  describe 'fruits/new' do
    let(:fruit) { Fruit.new }

    before do
      assign(:fruit, fruit)
      render
    end

    subject { rendered }

    it {should match 'New Fruit'}

    specify { expect(view).to render_template(partial: 'fruits/_form') }
  end
