module NineToFive
  # This class must be loaded during the Rails boot process
  # src: https://api.rubyonrails.org/classes/Rails/Railtie.html
  class Railtie < ::Rails::Railtie
    initializer "nine_to_five.middleware" do |app|
      app.middleware.use Middleware
    end
  end
end
