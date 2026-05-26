import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["panel", "results", "search", "form"]
  static values = { resultsPath: String }

  connect() {
    this.debounceTimer = null
    this.boundOnDocumentClick = this.onDocumentClick.bind(this)
    document.addEventListener("click", this.boundOnDocumentClick)
    this.loadResults("")
  }

  disconnect() {
    document.removeEventListener("click", this.boundOnDocumentClick)

    if (this.debounceTimer) {
      clearTimeout(this.debounceTimer)
    }
  }

  toggle(event) {
    event.preventDefault()
    this.panelTarget.hidden = !this.panelTarget.hidden

    if (!this.panelTarget.hidden) {
      this.searchTarget.focus()
    }
  }

  search() {
    if (this.debounceTimer) {
      clearTimeout(this.debounceTimer)
    }

    this.debounceTimer = setTimeout(() => {
      this.loadResults(this.searchTarget.value)
    }, 150)
  }

  async loadResults(query) {
    const url = new URL(this.resultsPathValue, window.location.origin)

    if (query.length > 0) {
      url.searchParams.set("q", query)
    }

    const response = await fetch(url.toString(), {
      headers: { Accept: "text/html" },
      credentials: "same-origin",
    })

    this.resultsTarget.innerHTML = await response.text()
  }

  onDocumentClick(event) {
    if (this.element.contains(event.target)) {
      return
    }

    this.panelTarget.hidden = true
  }
}