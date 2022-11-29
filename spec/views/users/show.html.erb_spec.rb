require 'rails_helper'

RSpec.describe 'users/show.html.erb', type: :view do
  it 'Render show template' do
    render template: 'users/show'
    expect(rendered).to match(/List of users by id/)
  end
end
