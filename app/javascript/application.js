// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import * as bootstrap from "bootstrap"
import { initSidebarMenu } from "sidebar"

// Disable Turbo drive for whole application
Turbo.session.drive = false

window.addEventListener('DOMContentLoaded', initSidebarMenu)
document.addEventListener('turbo:load', initSidebarMenu)
