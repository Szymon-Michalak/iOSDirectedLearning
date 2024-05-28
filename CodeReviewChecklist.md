# iOS Code Review Checklist

- Avoid Type Inference
- Prefer using Higher Order Functions
- Write DRY code (Don’t Repeat Yourself)
- Make sure that there are no force unwraps
- Make sure that there are no retain cycles
- Check if any deprecated API is being used
- Check if any hardcoded checks (generally strings) can be changed to enum.
- Prefer enum, switch over if else.
- Avoid nested structures (loops, if/else)
- Check if there’s any API provided by Apple which can make things simple.
- Naming of the variables (eg- Booleans should be interrogative)
- Check for typos.
- Wherever accessing the values from an Array is involved, check if there’s any - possibility of Index Out Of Bound Exception.
- YAGNI principle is being followed (You Aren’t Gonna Need It)
- Check if there are any unintended changes in the PR
- Make sure that the dependencies are being injected
- Follow Boy Scout Rule (see if any existing bad code can be improvised - though - it is not written by the developer who raised the PR).
- Check for the corner cases. Example -  Error Handling (what if the backend - doesn’t send an error message).
- If there’s any complex logic involved, check if there’s a comment to explain it.
- Indentations
- Test Cases - Code Coverage of the new code
- Fonts, Colors etc shouldn’t be accessed randomly. There should be a separate file for them.
- Make sure that the directory structure is being followed.
- See if the guidelines set by the team is being followed - SwiftLint
- Keep It Simple, Stupid (KISS)


# iOS New Feature Checklist

Things to think about when building a new application or feature.

| **Category** | **Details** |
|--------------|-------------|
| **Test layouts** | Test layouts in iOS 10/11 due to safe area |
| **Story** |  |
| **Description** |  |
| **Defaults** | Does everything have a default on screen. Text, images, placeholders. Anything needing a refresh from the network. |
| **Error handling** | Have you handled all: Parsing errors, Network errors. Do you display a view if an error occurs. |
| **Reachability** | Use Apple notification process to keep track of when you are offline and react accordingly. |
| **Data & Analytics** |  |
| **Logging** |  |
| **Animations** | Animate the showing of Views. |
| **Image Cache** | Consider using SDWebImage for caching images. |
| **Orientations** | Orientations defined in plist. |
| **Escape text** | Escape all text passed to web URLs. |
| **Pragma mark** |  |
| **Long text** | Long text in labels (multi-line). |
| **Test devices** | Test on phones of different sizes. |
| **Localization** | All strings are localized. |
| **Network simulation** | Simulate slow network connections with Network link conditioner (on physical device too). |
| **Progress Indicators** | UIActivityIndicatorView, `[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];` |
