feature 'Sign up' do

  scenario 'visting the landing page' do
    visit '/'
    within 'h1' do
      expect(page).to(have_content("Welcome to Peachio!"))
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
    expect(page).to(have_content("There was a problem with registering your email, please try again"))
  end

  scenario 'checks email adress is valid format' do
    visit '/'
    fill_in :email, with: 'test'
    click_button 'Submit'
    expect(page).to(have_content("There was a problem with registering your email, please try again"))
  end

end
