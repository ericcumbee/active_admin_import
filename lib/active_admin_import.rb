require 'activeadmin'
require 'activerecord-import-rails4'
require 'active_admin_import-rails4/version'
require 'active_admin_import-rails4/engine'
require 'active_admin_import-rails4/dsl'
require 'active_admin_import-rails4/importer'
require 'active_admin_import-rails4/model'
::ActiveAdmin::DSL.send(:include, ActiveAdminImport::DSL)

module ActiveAdminImport
    class Railtie < ::Rails::Railtie
    config.after_initialize do
      require 'active_support/i18n'
      I18n.load_path.unshift *Dir[File.expand_path('../active_admin_import/locales/*.yml', __FILE__)]
    end
  end
end
