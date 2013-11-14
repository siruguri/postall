describe 'home page' do
  it 'lists tasks' do
    visit '/'
    page.should have_content('Task List')
  end
end
