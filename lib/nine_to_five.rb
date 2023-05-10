require "nine_to_five/version"
require "nine_to_five/railtie"

module NineToFive
  # Defines both class and instance accessors for class attributes.
  mattr_accessor :start_hour
  @@start_hour = 9

  # Defines both class and instance accessors for class attributes.
  mattr_accessor :end_hour
  @@end_hour = 17

  mattr_accessor :message
  @@message = 'Please come back later'

  class Middleware
    # Its constructor receives the app object which is your application, also a middleware.
    def initialize(app)
      @app = app
    end

    def call(env)
      current_time = Time.current
      start_time = current_time.change(hour: NineToFive.start_hour)
      end_time = current_time.change(hour: NineToFive.end_hour)

      if Time.current.between?(start_time, end_time)
        @app.call(env)
      else
        [200, { "Content-Type" => "text/html" }, [NineToFive.message]]
      end
    end
  end
end
