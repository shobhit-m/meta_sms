module MetaSms

  # This is a class for custom error in meta_sms.
  # This method will be used to raise exceptions regarding meta_sms gem.
  #
  # @author Shobhit Dixit
  class MetaSmsError < StandardError

    def initialize(msg="")
      super
    end

  end

end
