module Domain
  module Version

    MAJOR = 1
    MINOR = 0
    TINY  = '0.rc5'

    def self.to_s
      [ MAJOR, MINOR, TINY ].join('.')
    end

  end
  VERSION = Version.to_s
end
