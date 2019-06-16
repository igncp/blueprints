# Magento2

- Repo: https://github.com/magento/magento2
- Commit: 6e534ad

## Resources

- Official Website: https://magento.com/
- Blog: https://magento.com/blog
- Developer site: https://devdocs.magento.com/#/individual-contributors
- Glossary: https://glossary.magento.com/
- Official resources: https://magento.com/technical-resources
- Resources List: https://github.com/aleron75/mageres
- Tutorials: https://firebearstudio.com/blog/the-ultimate-magento-2-tutorial.html
- Required Stack: https://devdocs.magento.com/guides/v2.3/install-gde/system-requirements-tech.html

## Source

The project has many lines of code. Summaries:

```
───────────────────────────────────────────────────────────────────────────────
Language                 Files     Lines     Code  Comments   Blanks Complexity
───────────────────────────────────────────────────────────────────────────────
PHP                      22514   2538853  1499798    787117   251938      48571
XML                       6324    306868   251475     45808     9585          0
JavaScript                1424    362701   254674     67134    40893      33511
Plain Text                 634     30849    17463         0    13386          0
LESS                       505    101978    62150     26724    13104          0
HTML                       435     38214    33381      3604     1229          0
```

```
project  : magento2
repo age : 8 years
active   : 1674 days
commits  : 88022
files    : 35184
```

Top-level directories:

- .github
- app: Main directory for the PHP application
- bin: Contains the `bin/magento` script which uses PHP
- dev: Contains tests, tools and travis config
- generated: it only contains an `.htaccess` file, like `var`
- lib: Contains some third party libraries
- phpserver
- pub
- setup
- var: Only contains a `.htaccess` files
- vendor

The main part of the application seems to be under `app/code/Magento`.

The project is using Grunt for the JS side. The biggest directories are, in order: `app`, `dev`, `lib` and `setup`. It has several `*.sample` files, like `package.json.sample`. There are many tests under `dev/tests`

The repository contains a root `index.php` which is the application entry point. The core framework (more abstract / meta functionality) is defined in `lib`, and the different sections are defined in `app`. Many directories inside `app` and `lib` contain a `README.md` file.

Seems the project uses the [Zend](https://framework.zend.com/) framework.

The technical guidelines for PHP sections: https://devdocs.magento.com/guides/v2.3/coding-standards/technical-guidelines.html . It describes some coding principles followed in the codebase (e.g. SOLID).

## Tests

The project uses PHPUnit for some tests.

## Flows

### Bootstrap n.1

1. Initialize `\Magento\Framework\App\Bootstrap::create`
1. Call `createApplication` using `\Magento\Framework\App\Http::class`
    1. Uses the `create` from the instance of the Object Manager (`lib/internal/Magento/Framework/ObjectManager/ObjectManager.php`)
    1. This calls the `create` method over the factory (`lib/internal/Magento/Framework/App/ObjectManagerFactory.php`)
        1. This is a relative big function with many things happening
1. Calls `run`
    1. Calls `launch` over the application

## Issues and PRs

- https://github.com/magento/magento2/issues

## PHP Info

- PHP_SAPI: https://www.electrictoolbox.com/determine-php-run-via-http-or-cli/
- Difference between `PSR-0` and `PSR-4`: https://stackoverflow.com/questions/24868586/what-are-the-differences-between-psr-0-and-psr-4
- `=>` operator: for arrays (with strings or numbers as keys) https://stackoverflow.com/a/14037376
- `::class` syntax: A string containing the clas name with the namespace. https://stackoverflow.com/a/32448573

## Infrastructure

The projects uses Travis as the CI.

## Setup

- Tried running: https://github.com/clean-docker/Magento2
    - Needs to signup to generate a key-pair
    - Had to update some scripts to run `docker-compose` with `sudo`

## Misc

- Magento is not supported in Windows and MacOS
- The `CHANGELOG.md` file is long (~6k lines)
- There is a PHP Magento Coding Standard: https://github.com/magento/magento-coding-standard

## Unstructured

- The recommended way to install Magento is via CLI
