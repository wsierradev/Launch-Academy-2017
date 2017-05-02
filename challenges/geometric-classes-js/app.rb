require 'sinatra'

set :bind, '0.0.0.0'  # bind to all interfaces

def homepage
  <<-HTML
    <!DOCTYPE html>
    <html>
    <head>
      <meta charset="utf-8">
      <title>spice-rack-js</title>
    </head>
    <body>
      <a href="js-specs.html">Jasmine Specs</a></br>
    </body>
    </html>
  HTML
end

get '/' do
  homepage
end
