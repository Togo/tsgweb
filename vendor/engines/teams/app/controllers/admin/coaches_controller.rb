module Admin
  class CoachesController < Admin::BaseController

    crudify :coach,
            :title_attribute => 'name', :xhr_paging => true

  end
end
