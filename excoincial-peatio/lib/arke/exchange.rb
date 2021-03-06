module Arke
  # Exchange module, contains Exchanges drivers implementation
  module Exchange
    # Fabric method, creates proper Exchange instance
    # * takes +strategy+ (+Arke::Strategy+) and passes to Exchange initializer
    # * takes +config+ (hash) and passes to Exchange initializer
    # * takes +config+ and resolves correct Exchange class with +exchange_class+ helper
    def self.create(config)
      begin
        exchange_class(config['driver']).new(config)
      rescue => e
        Rails.logger.error { config['driver'].inspect }
        Rails.logger.error { exchange_class(config['driver']).inspect }
        Rails.logger.error { config.inspect }
        report_exception(e)
        raise e
      end
    end

    # Takes +dirver+ - +String+
    # Resolves correct Exchange class by it's name
    def self.exchange_class(driver)
      Arke::Exchange.const_get(driver.capitalize, false)
    end
  end
end
