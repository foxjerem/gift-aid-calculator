Given(/^I am on the homepage$/) do
  visit '/'
end

Given(/^I fill in a donation amount$/) do
  fill_in 'Donation amount', with: 100
end

Given(/^I select a "(.*?)" event$/) do |event_type|
  select event_type, :from => 'event_selector'
end

Given(/^I have submitted a calculation$/) do
  _submit_calculation
end

When(/^I click "(.*?)"$/) do |selector|
 click_on selector
end

Then(/^I should see the correct gift aid amount$/) do
  expect(page).to have_content(25.0)
end

Then(/^I should see the gift aid amount rounded to (\d+) decimal places$/) do |arg1|
  expect(page).to have_content(24.83)
end

Then(/^I should see the correct gift aid amount for that event$/) do
  expect(page).to have_content(25.75)
end

def _submit_calculation
  visit '/'
  fill_in 'Donation amount', with: 99.323232
  click_on 'Calculate'
end