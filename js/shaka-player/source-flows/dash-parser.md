# Dash Parser Flows

## DashParser.prototype.start

### Normal Playback Flow

- It validates that it was configured
- It persists the URI and the player interface
- **A**: Requests and parses the manifest
  - It uses the `operationManager_` to abort the request in case the parser calls `.destroy`
  - It parses the manifest
  - It processes the manifest
    - This persists the manifest and retrieves many properties
    - It calculates the update duration
  - It returns the update duration
- It setups a timer to update
  - It chooses between an time passed from the manifest or a persited max time
  - It requests the manifests and parses it (Same as **A**), and sets up the same timer again
- Returns the parsed manifest
