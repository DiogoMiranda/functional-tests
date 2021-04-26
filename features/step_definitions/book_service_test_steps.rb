# language: en

######### Given ##########
Given(/^access the website my time$/) do
  @book_service_page = BookServicePage.new
  @book_service_page.load
end

######### When ###########
When("do a schedule of a haircut in San Francisco") do
 step 'do a search for the service indicating a city'
 step 'check if multiple results are shown - at least 3'
 step 'open business with especific name'
 step 'select the option all services'
 step 'do the filter by staff member'
 step 'click in schedule option'
 step 'press select time'
 step 'check a list of available time slots with at least 2'
end

When("do a search for the service indicating a city") do
  @book_service_page = BookServicePage.new
  @book_service_page.search_haircut
end

When("check if multiple results are shown - at least 3") do
  @book_service_page = BookServicePage.new
  @book_service_page.list_business
end

When("open business with especific name") do
  @book_service_page = BookServicePage.new
  @book_service_page.find_business
end

When("select the option all services") do
  @book_service_page = BookServicePage.new
  @book_service_page.all_services
end

When("do the filter by staff member") do
  @book_service_page = BookServicePage.new
  @book_service_page.filter_by_member
end

When("click in schedule option") do
  @book_service_page = BookServicePage.new
  @book_service_page.click_in_book
end

When("press select time") do
  @book_service_page = BookServicePage.new
  @book_service_page.select_time
end

When("check a list of available time slots with at least 2") do
  @book_service_page = BookServicePage.new
  @book_service_page.Verify_slots
end

######### Then ###########
Then("check if the information are correct") do
  @book_service_page = BookServicePage.new
  @book_service_page.verify_information
end
