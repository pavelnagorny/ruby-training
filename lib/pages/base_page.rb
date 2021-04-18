# frozen_string_literal: true

class BasePage < SitePrism::Page
  section :menu, TopMenuSection, '#top-menu'
  set_url CommonVars::BASE_URL
  element :page_header, '#header > h1'
end
