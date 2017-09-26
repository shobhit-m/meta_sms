require "rails_helper"
require 'meta_sms/utility'

# patch to create stub for config class
# TODO: Check standard way for doing this
module MetaSms
  def self.config
    self
  end
end
# patch to create stub for config class

describe MetaSms::Utility do

  it "#logging? will return false, if value of logging is false and config.logging = false" do
    # patch to create stub for config class
    # TODO: Check standard way for doing this
    module MetaSms
      def self.logging
        false
      end
    end
    # patch to create stub for config class

    expect(MetaSms::Utility.logging?(false) ).to be_falsey
  end

  it "#logging? will return false, if value of logging is not true in config and argument is not given" do
    # patch to create stub for config class
    # TODO: Check standard way for doing this
    module MetaSms
      def self.logging
        "AnythingButNotTrue"
      end
    end
    # patch to create stub for config class
    expect(MetaSms::Utility.logging? ).to be_falsey
  end

  it "#logging? will return false, if value of logging is not true in config and argument is not true" do
    # patch to create stub for config class
    # TODO: Check standard way for doing this
    module MetaSms
      def self.logging
        "SomethingButNotTrue"
      end
    end
    # patch to create stub for config class
    expect(MetaSms::Utility.logging? "AnythingButNotTrue" ).to be_falsey
  end

  it "#logging? will return false, if value of logging is false in config, independent of argument" do
    # patch to create stub for config class
    # TODO: Check standard way for doing this
    module MetaSms
      def self.logging
        false
      end
    end
    # patch to create stub for config class
    expect(MetaSms::Utility.logging? ).to be_falsey
  end

  it "#logging? will return true, if value of logging is true in config, independent of argument" do
    # patch to create stub for config class
    # TODO: Check standard way for doing this
    module MetaSms
      def self.logging
        true
      end
    end
    # patch to create stub for config class
    expect(MetaSms::Utility.logging? ).to be_truthy
  end

  it "#logging? will return true, if value of logging is true in argument" do
    expect(MetaSms::Utility.logging?(true) ).to be_truthy
  end



end
