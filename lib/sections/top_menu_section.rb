# frozen_string_literal: true

class TopMenuSection < SitePrism::Section
  element :sign_up_link, '.register'
  element :sign_in_link, '.login'
  element :active_user, '#loggedas > a'
  element :projects_link, :xpath, '//a[@class="projects"]'
  element :sign_out_btn, '.logout'
end
