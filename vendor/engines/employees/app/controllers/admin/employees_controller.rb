module Admin
  class EmployeesController < Admin::BaseController

    crudify :employee,
            :title_attribute => 'name', :xhr_paging => true

  end
end
