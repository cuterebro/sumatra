class Plugin

  class << self
    def depends_on(*plugins)
      define_method :dependencies do plugins end
    end

    def routes(&block)
      define_method :routes_proc do block end      
    end
  end

  def dependencies = []
end