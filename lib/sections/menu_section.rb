# frozen_string_literal: true

class MenuSection < SitePrism::Section
  element :sign_up_link, '.register'
  element :sign_in_link, '.login'
  element :active_user, '#loggedas > a'
end
