module Admin
  class AnnouncementsController < Admin::BaseController

    crudify :announcement,
            :title_attribute => 'league', :xhr_paging => true

  end
end
