require 'json'
require 'sinatra'

set :public_folder, File.dirname(__FILE__)

# Load perfumes from a JSON file
perfumes = JSON.parse(File.read('perfumes.json'))

# Define a route for the welcome page
get '/' do
  <<~HTML
    <html>
      <head>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/css/bootstrap.min.css">
      </head>
      <body>
        <div class="container text-center mt-5">
          <h1>Welcome to the Perfume Randomizer!</h1>
          <p>Click the button below to start.</p>
          <button class="btn btn-primary" onclick="location.href='/randomizer'">Start Randomizer</button>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/js/bootstrap.bundle.min.js"></script>
      </body>
    </html>
  HTML
end

# Define a route for the randomizer page
get '/randomizer' do
  # Choose a random perfume
  perfume = perfumes.sample

  # Display the perfume photo, name, and description with a linked external CSS file
  <<~HTML
    <html>
      <head>
        <link rel="stylesheet" type="text/css" href="/styles.css">
      </head>
      <body>
        <div class="container">
          <h1>Welcome to your Perfume Randomizer</h1>
          <h2>Click the button to decide</h2>
          <div class="card">
            <img src="#{perfume['photo']}" class="card-img-top">
            <div class="card-body">
              <h2 class="card-title">#{perfume['name']}</h2>
              <p class="card-text">#{perfume['description']}</p>
            </div>
          </div>
          <button onclick="location.reload()">Randomize</button>
        </div>
      </body>
    </html>
  HTML
end
