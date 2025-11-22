class SpaceMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    host = env['SERVER_NAME']
    env['SPACE'] = Space.where(host:).first
    status, headers, body = @app.call(env)
    [status, headers, body]
  end
end
