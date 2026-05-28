# sorbet-test

A Rails sandbox exploring the combination of [Sorbet](https://sorbet.org) (static typing), [Phlex](https://www.phlex.fun) (Ruby component rendering), and [Stimulus](https://stimulus.hotwired.dev) (modest JS). The main feature is a type-safe, searchable user-select picker built from Phlex components and a single Stimulus controller.

## Running locally

```sh
bin/setup        # install gems, create & seed the database
bin/rails server # start the dev server at http://localhost:3000
```
