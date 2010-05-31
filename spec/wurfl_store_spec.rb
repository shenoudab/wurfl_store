require File.dirname(__FILE__) + '/spec_helper'

describe WurflStore do
  describe 'wurfl_store base' do
    before(:all) do 
      WurflStore.cache.delete('wurfl_initialized')
      WurflStore.cache.delete('wurfl_initializing')
    end

    it 'should load the wurfl into the cache if it is not present' do
      WurflStore.init
      assert WurflStore.cache.read('wurfl_initialized')
    end

    it 'should return that the cache is initialized' do
      assert WurflStore::CacheInitializer.cache_initialized?
    end

    it 'should have cached the generic handset' do
      WurflStore.cache.read('generic').should_not be_nil
    end

    it 'should return nil given an invalid handset' do
      WurflStore.get_handset('A Fake Handset').should be_nil
    end

    it 'should return a valid handset given a UA that can be truncated to a valid UA' do
      WurflStore.get_handset('Nokia 30 foobaloo').should_not be_nil
    end
  end
end