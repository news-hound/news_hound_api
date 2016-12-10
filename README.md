Welcome to the Veriscope Api!

## Installation instructions

  0. Clone repo

### Starting the Rails Server

  0. `bundle install`
  0. `bundle exec rails db:setup`
  0. `bundle exec rails s`

### Setting up the https proxy

  0. `npm install`
  0. `npm run proxy`
  0. c/p this into chrome: "chrome://flags/#allow-insecure-localhost"
  0. Click "Enable"

---

## Endpoints

| VERB   | URL         | Action                  |
|--------|-------------|-------------------------|
| GET    | /evaluate   | evaluate an article     |
| POST   | /blacklists | add domain to blacklist |
| POST   | /concepts   | add a viral concept     |
| POST   | /session    | log in                  |
| DELETE | /session    | log out                 |
