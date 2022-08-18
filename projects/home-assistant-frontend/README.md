- https://github.com/home-assistant/frontend#home-assistant-frontend
- Checked sha: `088b358`
- It uses the `yarn` package manager
- There are some comprehensive docs about architecture and UI in: https://developers.home-assistant.io/docs/frontend/
- Can inspect the state object in the browser by selecting the `<home-assistant>` custom element and checking: `$0.hass` in the console
- It uses `instant-mocha` for the tests
- Panels are equivalent to pages whithin the application code
- The `lovelace` is the hardcoded name of the main panel
- All the tests are passing with `yarn test` but had to run `yarn build` beforehand
    - It looks like there aren't many tests

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

## Tools

### lit-element

- https://lit.dev/docs/
    - Lifecycle methods: https://lit.dev/docs/components/lifecycle/#reactive-update-cycle-triggering

### Other dependencies

- `home-assistant-js-websocket` defines the websocket connection

## Misc

- There is a haptic feedback handler that uses `navigator.vibrate`
