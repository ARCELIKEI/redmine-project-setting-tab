require File.expand_path(File.dirname(__FILE__) + '/../../../app/controllers/projects_controller')
class ProjectsController < ApplicationController
    before_filter :before_settings, :only => :settings
    def before_settings
        require File.expand_path(File.dirname(__FILE__) + '/../../../app/helpers/projects_helper')
        require File.expand_path(File.dirname(__FILE__) + '/helper')
    end
end
module Redmine
    class Plugin
        def_field :tab_settings
        def add_tab(label, url)
            item = {:name => label.to_s, :label => label, :url => url, :partial => 'tab_setting/layout'}
            TabManager.add(@id, item)
        end
        def tab_show_expr(expression)
            TabManager.set_expr(@id, expression)
        end
    end
end
