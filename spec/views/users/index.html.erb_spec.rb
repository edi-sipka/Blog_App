require 'rails_helper'

RSpec.describe 'users/index.html.erb', type: :view do
  it 'Render index template' do
    render template: 'users/index'
    expect(rendered).to match(/List of all users/)
  end
end
