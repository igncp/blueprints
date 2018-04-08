# Player.prototype.load - Shaka Player Flows

# Normal case (very few and similar branches)

- Inherits from `shaka.util.FakeEventTarget`
- Sets to null many members: engines, `playhead_`, etc., also empty arrays
- Also sets some mebers using `this.config_`
- Creates the `_eventManager`
- Creates the empty stats
- Calls the dependency injector (second argument, optional) passing the context
- Creates the `networkingEngine_`
- If the video element is passed, calls `this.attach`
  - Adds an event listener to `'error'` to the video element
  - Creates the `mediaSourceEngine_`
  - Opens the `mediaSourceEngine_`
