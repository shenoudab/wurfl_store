require 'wurfl_store/cache_initializer'
require 'wurfl_store/view'
require 'wurfl_store/filter'
require 'rubygems'
require 'activesupport'
require 'redis-store'

module WurflStore
  attr_accessor :cache
  def self.cache
    @cache
  end
  
  def self.init
    @cache = ActiveSupport::Cache.lookup_store(:redis_store)
    # determine if the cache has been initialized with the wurfl
    CacheInitializer.initialize_cache if WurflStore.cache.read('wurfl_initialized').nil?
  end
  
  def self.get_handset(user_agent)
    return nil if user_agent.nil?
    CacheInitializer.cache_initialized?
    user_agent.slice!(250..-1)
    handset = @cache.read(user_agent.tr(' ', ''))
    chopped_user_agent = user_agent.chop
    return nil if chopped_user_agent.empty?
    return self.get_handset(chopped_user_agent) if handset.nil?
    return handset
  end
end