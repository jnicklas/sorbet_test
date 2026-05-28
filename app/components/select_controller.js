import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["results", "search", "form"]
  static values = { resultsPath: String }

  disconnect() {
    if (this.debounceTimer) {
      clearTimeout(this.debounceTimer)
    }
  }

  handleToggle(event) {
    if (event.newState === "open") {
      this.loadResults("")
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
}
