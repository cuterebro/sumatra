import { Controller } from "@hotwired/stimulus"

export default class ThemeSwitcher extends Controller {
  connect() {
    console.log("Hello World!")
  }
  switch() {
    document.querySelector('body').classList.toggle('theme-dark');
  }
}

Stimulus.register("theme-switcher", ThemeSwitcher);