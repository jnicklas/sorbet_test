import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["results", "search", "form", "trigger", "panel"]
  static values = { resultsPath: String, selected: String }

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

  select(event) {
    this.selectedValue = event.params.value
    this.triggerTarget.textContent = event.params.label
    this.panelTarget.hidePopover()
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
    this.#highlightSelected()
  }

  #highlightSelected() {
    for (const item of this.resultsTarget.querySelectorAll("[data-select-value-param]")) {
      item.classList.toggle("select-picker__item--selected", item.dataset.selectValueParam === this.selectedValue)
    }
  }
}
