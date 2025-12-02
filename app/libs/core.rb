require 'ostruct'

class Core
  include Singleton
  class_attribute :config
  self.config = OpenStruct.new(plugins: [])

  def has_plugin?(name)
    @plugins.key?(name)
  end

  def init_routes(mapper)
    @plugins.each_pair do |name, plugin|
      mapper.instance_exec &plugin.routes_proc if plugin.respond_to?(:routes_proc)
    end
  end

private

  def initialize
    @plugins = {}
    load_plugins(Core.config.plugins)
  end

  def load_plugins(list)
    list.each do |item|
      load_plugin(item)
    end
  end

  def load_plugin(name, ancestry=[])
    return if has_plugin?(name)

    plugin_class = "#{name}_plugin".camelize.constantize
    plugin = plugin_class.new
    @plugins[name] = plugin

    plugin.dependencies.each do |item|
      load_plugin(item, ancestry + [name])
    end
  end

  # def self.init_routes(route_set)
  #   route_set.instance_eval do
  #     get 'test' => 'test#passed'
  #   end
  # routes = ActionDispatch::Routing::RouteSet.new
  # routes.draw do
  #   get 'test' => 'test#passed'
  # end
  # routes
  # end

end