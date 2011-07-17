module NavigationHelpers
  module Refinery
    module Employees
      def path_to(page_name)
        case page_name
        when /the list of employees/
          admin_employees_path

         when /the new employee form/
          new_admin_employee_path
        else
          nil
        end
      end
    end
  end
end
