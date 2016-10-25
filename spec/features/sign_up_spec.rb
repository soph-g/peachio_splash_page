feature 'Sign up' do

  scenario 'visting the landing page' do
    visit '/'
    within 'h1' do
      expect(page).to(have_content("Hello Peachio!"))
    end

  end

  scenario 'finding out what Peachio is about' do
    visit '/'
    within 'h2' do
      expect(page).to(have_content("Crowd-source the best beauty products for you"))
    end
    within 'h3' do
      expect(page).to(have_content("Leave your email address to be the first to know the latest Peachio news"))
    end
  end

  scenario 'provide email address' do
    visit '/'
    fill_in :email, with: 'test@test.com'
    click_button 'Submit'
    expect(page).to(have_content("Thank you!"))
  end
  scenario 'emails must be unique' do
    visit '/'
    fill_in :email, with: 'test@test.com'
    click_button 'Submit'
    visit '/'
    fill_in :email, with: 'test@test.com'
    click_button 'Submit'
    expect(page).to(have_content("You've already signed up with that email"))
  end

end
