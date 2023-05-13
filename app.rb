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
      <link rel="preconnect" href="https://fonts.googleapis.com">
      <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
      <link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed&family=Roboto:wght@300&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/css/bootstrap.min.css">
      </head>
      <body>
        <div class="container-main">
        <div class="card">
          <h1>Welcome to the Perfume Randomizer!</h1>
          <p>Click the button below to start.</p>
          <div class="button" onclick="location.href='/randomizer'">Start Randomizer</div>
          </div>
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
      <link rel="preconnect" href="https://fonts.googleapis.com">
      <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
      <link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed&family=Roboto:wght@300&display=swap" rel="stylesheet">
      <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
      <link rel="stylesheet" type="text/css" href="/styles.css">
      </head>
      <body>
        <div class="container">
          <h1>Welcome to your Perfume Randomizer</h1>
          <h2>Can't decide what to wear? Let the randomozer do it for you.</h2>
          <div class="card">
            <img src="#{perfume['photo']}" class="card-img-top">
            <div class="card-body">
              <h2 class="card-title">#{perfume['name']}</h2>
              <p class="card-text">#{perfume['description']}</p>
            </div>
          </div>
          <div class="button" onclick="location.reload()">Randomize</div>
        </div>
      </body>
    </html>
  HTML
end
