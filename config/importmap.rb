# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"

Dir.glob(Rails.root.join("app/components/**/*.js")).each do |file|
  relative = Pathname.new(file).relative_path_from(Rails.root.join("app/components"))
  name = relative.to_s.delete_suffix(".js").gsub("/", "_")
  pin "controllers/#{name}", to: relative.to_s
end
