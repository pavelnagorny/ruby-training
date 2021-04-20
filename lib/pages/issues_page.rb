# frozen_string_literal: true

class IssuesPage < SitePrism::Page
  element :actions, '.icon-only.icon-actions.js-contextmenu'
  element :status_option, :xpath, '//*[@class="folder"]//*[contains(text(), "Status")]'
  element :status_closed, :xpath, '//*[@class="folder"]//*[contains(text(), "Closed")]'
end
