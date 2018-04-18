# Player stacks - Shaka Player

Stacks starts from top (callers) to bottom (callees)

## Player.prototype.onKeyStatus_

- shaka.cast.CastProxy [via new shaka.cast.CastSender]
- shaka.cast.CastProxy.prototype.onResumeLocal_: 'Transfer remote state back and resume local playback.'
- shaka.Player.prototype.load
- shaka.Player.prototype.createDrmEngine
- shaka.media.DrmEngine
- shaka.media.DrmEngine.prototype.processKeyStatusChanges_
- **shaka.Player.prototype.onKeyStatus_**
- shaka.Player.prototype.chooseStreamsAndSwitch_
- shaka.Player.prototype.onAdaptation_
- shaka.util.FakeEvent('adaptation')
