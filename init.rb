require 'wurfl_store'
ActionController::Base.send(:include, WurflStore::Filter)
ActionView::Base.send(:include, WurflStore::View)
WurflStore.init