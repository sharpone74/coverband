require 'redis'
require 'logger'

require 'coverband/version'
require 'coverband/redis_store'
require 'coverband/base'
require 'coverband/reporter'
require 'coverband/middleware'

module Coverband
  
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_accessor :redis, :coverage_baseline, :root_paths, :root, :ignore, :percentage, :verbose, :reporter, :stats, :logger, :startup_delay
    
    def initialize
      @root = Dir.pwd
      @redis = nil
      @stats = nil
      @coverage_baseline = {}
      @root_paths = []
      @ignore = []
      @percentage = 0.0
      @verbose = false
      @reporter = 'scov'
      @logger = nil
      @startup_delay = 0
    end
  end
  
end
