# frozen_string_literal: true

class BasePage < SitePrism::Page
  section :menu, MenuSection, '#top-menu'
  set_url 'http://testautomate.me/redmine/'
  element :page_header, '#header > h1'
end
