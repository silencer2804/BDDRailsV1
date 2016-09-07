require "rails_helper"
RSpec.feature "Users can delete projects" do
  scenario "successfully" do
    FactoryGirl.create(:project, name: "Sublime Text 3")
    visit admin_projects_path
    click_link "Sublime Text 3"
    click_link "Delete Project"
    expect(page).to have_content "Project was successfully destroyed"
    expect(page.current_url).to eq admin_projects_url
    expect(page).to have_no_content "Sublime Text 3"
  end
end