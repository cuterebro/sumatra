import { Controller } from "@hotwired/stimulus"
import { post } from '@rails/request.js';

export default class Sidebar extends Controller {
  toggle() {
    this.element.classList.toggle('expanded')
    const expanded = this.element.classList.contains('expanded')
    const layout = this.element.closest('.page-layout')
    layout.classList.toggle('sidebar-expanded', expanded);
    layout.classList.toggle('sidebar-collapsed', !expanded);
    post('/user_settings', { 'body': JSON.stringify({'sidebar_expanded': expanded})});
  }
}

Stimulus.register("sidebar", Sidebar);