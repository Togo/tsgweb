module NavigationHelpers
  module Refinery
    module Teams
      def path_to(page_name)
        case page_name
        when /the list of teams/
          admin_teams_path

         when /the new team form/
          new_admin_team_path
        when /the list of coaches/
          admin_coaches_path

         when /the new coach form/
          new_admin_coach_path
        else
          nil
        end
      end
    end
  end
end
