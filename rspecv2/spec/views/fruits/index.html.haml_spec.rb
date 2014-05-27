require 'spec_helper'

  describe 'fruits/index' do

    before do
      render
    end

    subject { rendered }

    it { should have_selector 'h2' }
    it { should have_link 'All Fruits', url_for(fruits_path) }
end