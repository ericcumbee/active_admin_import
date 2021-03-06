# ActiveAdminImport
The most fastest and efficient CSV import for Active Admin (based on activerecord-import gem) 
with support of validations and bulk inserts 


#Links
https://github.com/gregbell/active_admin

https://github.com/zdennis/activerecord-import


#Options

    # +back+:: resource action to redirect after processing
    # +col_sep+:: column separator used for CSV parsing
    # +validate+:: true|false, means perfoem validations or not
    # +batch_size+:: integer value of max  record count inserted by 1 query/transaction
    # +before_import+:: proc for before import action, hook called with  importer object
    # +after_import+:: proc for after import action, hook called with  importer object
    # +before_batch_import+:: proc for before each batch action, called with  importer object
    # +after_batch_import+:: proc for after each batch action, called with  importer object
    # +fetch_extra_options_from_params+:: params  available in callbacks ( importer.extra_options proprty hash ) 
    # +on_duplicate_key_update+:: an Array or Hash, tells activerecord-import to use MySQL's ON DUPLICATE KEY UPDATE ability.
    # +timestamps+::  true|false, tells activerecord-import to not add timestamps (if false) even if record timestamps is disabled in ActiveRecord::Base
    # +ignore+::  true|false, tells activerecord-import toto use MySQL's INSERT IGNORE ability
    # +params_keys+:: params values available in callbacks
    # +template+:: custom template rendering
    # +template_object+:: object passing to view
    # +locals+:: local variables for template
    # +resource_class+:: resource class name
    # +resource_label+:: resource label value
    # +headers_rewrites+:: hash with key (csv header) - value (db column name) rows mapping



Default options values

    :back => :import,
    :col_sep => ',',
    :template => "admin/import",
    :template_object => ActiveAdminImport::Model.new,
    :fetch_extra_options_from_params => [],
    :resource_class => nil,
    :resource_label => nil,
    

#Example
  
    ActiveAdmin.register Post  do
       active_admin_import :validate => false,
                            :col_sep => ',',
                            :back => :index ,
                            :before_import => proc{|importer|  resource.delete_all},
                            :batch_size => 1000
    
    
    end



#Source Doc
http://rubydoc.info/gems/active_admin_import/2.0.0/

