
# tic.drat.repo

[`drat`](https://github.com/eddelbuettel/drat) package repository for
the [tic.drat.repo](https://github.com/ropenscilabs/tic.drat.repo) demo
project.  
R packages from this repo can be installed with

``` r
install.packages(..., repos = "https://mlr3learners.github.io/mlr3learners.drat")
```

To omit having to pass the `repos` argument every single time, add the
following to your `.Rprofile`:

``` r
options(repos = structure(c(getOption("repos"),
  tic.drat = "https://ropenscilabs.github.io/tic.drat.repo")))
```

This will append this drat repo to your list of available repositories
which `install.packages()` will check when trying to install a package.
If you want a c/p command for this: The following will append the line
above to your `~/.Rprofile`:

``` r
write("options(repos = structure(c(getOption('repos'),
  tic.drat = 'https://ropenscilabs.github.io/tic.drat.repo')))",
  file = "~/.Rprofile", append = TRUE)
```

A drat repository can hold multiple R packages. Below is a list of
packages which are available in this repo. (For demo reasons it is just
one package here.)

``` r
install.packages("tic.drat")
```

## Available packages

List of all available learners in this organization

    ## [1] "tic.drat" "ticdrat"  "wrswoR"

## How it works

The package sources of the listed packages (including binaries for macOS
and Windows) are build during a CI run (once a week) and automatically
deployed to this repo. The work behind the scenes is highly simplified
by packages [{tic}](https://github.com/ropensci/tic) and
[{drat}](https://github.com/eddelbuettel/drat).

As a bonus you could update the README of the drat repo in a certain
interval to automatically update the list of available packages. To do
so, add the following lines to `tic.R` and make sure to enable a CRON
job for the build of this repo on your favorite CI provider.

``` r
get_stage("before_deploy") %>%
  add_step(step_setup_ssh()) %>% # not needed on Circle CI
  add_step(step_setup_push_deploy(branch = "master", orphan = FALSE))

get_stage("deploy") %>%
  add_code_step(rmarkdown::render("README.Rmd")) %>%
  add_step(step_do_push_deploy(commit_paths = "README.md"))
```

## drat repos via {tic} in the wild

  - [mlr3learners.drat](https://github.com/mlr3learners/mlr3learners.drat)
  - Let us know if you find more\!
