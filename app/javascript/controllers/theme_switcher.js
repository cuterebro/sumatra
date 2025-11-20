import { Controller } from "@hotwired/stimulus"
import { post } from '@rails/request.js';

export default class ThemeSwitcher extends Controller {
  switch() {
    const body = document.querySelector('body') 
    body.classList.toggle('theme-dark')
    const dark = body.classList.contains('theme-dark')
    post('/user_settings', { 'body': JSON.stringify({'theme': (dark ? 'dark' : '')})})
  }
}

Stimulus.register("theme-switcher", ThemeSwitcher);