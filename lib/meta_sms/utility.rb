module MetaSms

  # This is a utility class for meta_sms. This encapsulates some common class methods as
  #    #logging?
  #    This method will be used to check whether logging of sms is required or not.
  #
  # @author Shobhit Dixit
  class Utility

    # @return [Boolean] true if logging is true in config initializer or in @options, else false
    # @author Shobhit Dixit
    def self.logging?(logging=nil)
      logging == true || MetaSms.config.logging == true
    end

  end

end
