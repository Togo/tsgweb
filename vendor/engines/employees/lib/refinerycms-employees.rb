require 'refinerycms-base'

module Refinery
  module Employees
    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "employees"
          plugin.activity = {
            :class => Employee,
            :title => 'name'
          }
        end
      end
    end
  end
end
