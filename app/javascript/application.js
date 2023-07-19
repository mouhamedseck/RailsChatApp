// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

// Loads all Semantic javascripts 
//= require rails-ujs
//= require semantic-ui
//= require jquery
//= require turbolinks

$(document).on('turbolinks:load', function() {
    $('.ui.dropdown').dropdown();
})
import "channels"
