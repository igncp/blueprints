# Networking Engine Flows

## NetworkingEngine.prototype.request

- If the engine has been destroyed, it doesn't do an actual request, it returns an aborted operation
  - All the requests are passed to a `shim` function that will warn when trying to apply `.then` to a request, as it is not a promise but an `AbortableOperation`. To use then, it would be: `request.promise.then` instead of `request.then`
- Adds some default options to the request
- Adds the requests filters to the chain
- Adds the send with retries to the chain
  - At this point of the chain it will actually make the requests
  - It will use a scheme from the registered schemes to choose the plugin
  - It will run the plugin, which is expecting an operation (not a promise) as the the returned value
- Adds the responses filters to the chain
- Waits for the whole operation chain to complete
  - On error it may try to repeat the request if the error is recoverable
- When the request is for a segment (special request type), it runs `onSegmentDownloaded_`
  - This method comes from the options when initializing the engine, it is not defined inside the engine
- Returns the response

## NetworkingEngine.registerScheme

- It validates the priority if exists is greater than 0
- It sets the priority if not present (defaults to three, which is bigger than other options like fallback or preferred)
- It will add the plugin it to the `_schemes` map object (with the scheme as the key) if empty or the priority is greater than the existing one
  - Note that this function and the `_schemes` array are static, not different for each instances
  - The scheme is a string
