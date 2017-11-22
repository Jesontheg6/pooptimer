require 'rails_helper'

RSpec.feature "SignIns", type: :feature do

	describe 'sign in' do
        before(:each) do
            User.create(email: 'jesonlee@example.com', password: '1111111')
        end

        it 'signs in and show homepage title' do
            visit '/login'
            within('form[action="/login"]') do
                fill_in 'session_email', with: 'jesonlee@example.com'
                fill_in 'session_password', with: '1111111'
            end
            click_button 'Log in'
            expect(page).to have_content 'Welcome To Your Profile'
            end
        end  
end 



  # describe 'sign in' do 
  # 	before(:each) do 
  # 		User.create(email: 'jeosn@example.com',password: '1234567')
  # 	end 

  # 		it 'signs me in and show profile title' do 
  # 			visit '/login'

  # 			within('form[action="/login"]') do 

  # 	 find('email').set('jeson@example.com')
  #     find('password').set('1234567')
  # 		end 
  # 		  click_button 'Log in'
#   # 		  expect(page).to have_content ""
# end
# end 
# end 
 