class BookServicePage < SitePrism::Page
  set_url "https://www.mytime.com/consumers"

  element :search_field, "input[name='search']"
  element :location_field, "input[id='search-location']"
  element :search_btn, "input[class='flat-blue-btn btn-search']"
  element :all_services_btn, "[class='section-title text-5']"

  $haircut_list = "[class='business-name']"
  $text_business = 'Test - Sabre Cuts' 
  $slots = "my-link no-padding text-16 themed-component themed-component--color']"

  def search_haircut
      search_field.set (SEARCH[:valid_haircut])
      location_field.set (CITY[:valid_city])
      click_button 'Search'
  end

  def list_business
      size_list_business = ($haircut_list.size)
       if size_list_business > 3
        return true 
       end
  end

  def find_business
      click_link_or_button $text_business
  end

  def all_services
      first(:xpath, '//*[@class="option-text themed-component themed-component--color"]').click
  end

  def filter_by_member
      page.all(:xpath, '//*[@class="option-text themed-component themed-component--color"]')[6].click
  end

  def click_in_book
      page.all(:xpath, '//*[@class="my-button nice-checkbox__button capitalize text-21 themed-component themed-component--background"]')[2].click
      $texto_1 = page.all(:xpath, '//*[@class="variation-title-content"]')[2].text
      $texto_2 = page.all(:xpath, '//*[@class="normal-price"]')[2].text
      $texto_3 = first(:xpath, '//*[@class="Select-value-label"]').text
      return $texto_1, $texto_2, $texto_3
  end

  def select_time
      first(:xpath, '//*[@class="my-button text-18 select-time-button themed-component themed-component--background"]').click
  end

  def Verify_slots
      size_slots = ($slots.size)
       if size_slots > 2
        return true  
       end
  end

  def verify_information
      puts $texto_1, $texto_2, $texto_3
      page.has_text?($texto_1)
      page.has_text?($texto_2)
      page.has_text?($texto_3)
  end
end