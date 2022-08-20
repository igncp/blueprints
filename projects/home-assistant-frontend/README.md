- Checked sha: `088b358`
- It uses the `yarn` package manager
- There are some comprehensive docs about architecture and UI in: https://developers.home-assistant.io/docs/frontend/
- Can inspect the state object in the browser by selecting the `<home-assistant>` custom element and checking: `$0.hass` in the console
- It uses `instant-mocha` for the tests
- Panels are equivalent to pages whithin the application code
- The `lovelace` is the hardcoded name of the main panel
- All the tests are passing with `yarn test` but had to run `yarn build` beforehand
    - It looks like there aren't many tests
- There is a lot of code in `src`, with 175k loc

## Code

- The main entrypoint is: `src/entrypoints/app.ts`
- It uses the `@customElement` decorator from the `lit` package to create custom elements
- It uses the mixin pattern to achieve code distribution in multiple classes
- There is a main element in `src/state/hass-element.ts` which is extended by several classes
- There is also a base mixin in `src/state/hass-base-mixin.ts` which defines some lifecycle methods
- There are some general types defined in `src/types.ts`
    - It includes the `HomeAssistant` interface
- The `firstUpdated` lifecycle method is common in the mixins implementation
- For the navigation it uses `history.replaceState` and `history.pushState`
- There are several registries that can be subscribed to: `device`, `area` or `entity`
- There are some utils defined in `src/common/dom` like `fire_event` or `deep-active-element`
- Classes are not exported but automatically registered by the decorator
- One of the places where it initializes `hass` is in `src/state/connection-mixin.ts`
- To render texts it uses `this.hass.localize`, passing keys to it
- The `hass.auth` property is obtained in some cases with `getAuth` from the package `home-assistant-js-websocket`
- It has a chromecast receiver under `cast/src/receiver`
- There are some `coreCards` defined in: `src/panels/lovelace/editor/lovelace-cards.ts`
- The dialog opened when clicking in the cards is called `ha-more-info-dialog`
    - It is opened with: `fireEvent(this, "hass-more-info"`

## Build process

- There is a `web-dev-server.config.js`, which imports from rollup, it looks it may be used when running the demo's dev script
- Many scripts (including `gulp`, `rollup`) are in `/build-scripts/`
- When running the demo in dev mode, can make changes in the elements and they trigger a page reload
- There is a `src/html` dir containing the HTML templates
    - Those are used from the `build-scripts/gulp/entry-html.js` script
- In some conditions it uses `WDS` which means 'web dev server'

## Tools

### lit-element

- https://lit.dev/docs/
    - Lifecycle methods: https://lit.dev/docs/components/lifecycle/#reactive-update-cycle-triggering

### Other dependencies

- `home-assistant-js-websocket` defines the websocket connection
- `@material/mwc-formfield`: Material UI web component: https://github.com/material-components/material-web/tree/mwc/packages/formfield

## Doubts

- [ ] How does it connect with the backend? What types of backend does it have (db, websocket)?
    - One example of function contacting the backend is: `saveConfig` from `src/data/lovelace.ts`
- [ ] How do cards work? For example: `src/panels/lovelace/cards/energy/hui-energy-distribution-card.ts`
    - There is a base config defined in `src/data/lovelace.ts`: `LovelaceCardConfig`
- [ ] What is the `hassio` directory? It has around 10k loc
- [ ] What is `arsaboo` or `teachingbirds` (present in `src/config`)
    - They look like configuration presets

## Changes

- [ ] Adding a new card
    - Creating custom cards: https://developers.home-assistant.io/docs/frontend/custom-ui/custom-card/

## Demo

- It generates stubs for ws calls like: `demo/src/stubs/lovelace.ts`
    - The real handler is in the `core` repository where it defines it here: `homeassistant/components/lovelace/websocket.py`
- To run it in dev mode: `cd demo ; sh script/develop_demo`

## Misc

- There is a haptic feedback handler that uses `navigator.vibrate`
- There is a separate screen called "screen info box" which is displayed when the app is loading or there is an error
- When using dynamic imports with webpack, it is possible to add a comment like `/* webpackPreload: true */`
    - https://webpack.js.org/guides/code-splitting/
- There is a configuration file for webpack and also for rollup, but rollup is not present in the `package.json` scripts
    - Several scripts are not present in the `package.json`, for example `scripts/develop`
- It uses https://formatjs.io/docs/intl for formatting dates and times
- Two common patterns related to ts: the `overwrite` and `protected` keywords for inheritance

## Links

- Custom cards: https://github.com/custom-cards
- https://github.com/home-assistant/frontend#home-assistant-frontend
- Forum: https://community.home-assistant.io/
    - Development: https://community.home-assistant.io/c/development/10
- Docs: https://www.home-assistant.io/docs/
- Blog: https://www.home-assistant.io/blog/
- Integrations: https://www.home-assistant.io/integrations/
