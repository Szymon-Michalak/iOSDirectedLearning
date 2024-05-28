# iOS Code Review Checklist

Avoid Type Inference
Prefer using Higher Order Functions
Write DRY code (Don’t Repeat Yourself)
Make sure that there are no force unwraps
Make sure that there are no retain cycles
Check if any deprecated API is being used
Check if any hardcoded checks (generally strings) can be changed to enum.
Prefer enum, switch over if else. 
Avoid nested structures (loops, if/else)
Check if there’s any API provided by Apple which can make things simple. 
Naming of the variables (eg- Booleans should be interrogative)
Check for typos. 
Wherever accessing the values from an Array is involved, check if there’s any possibility of Index Out Of Bound Exception.
YAGNI principle is being followed (You Aren’t Gonna Need It)
Check if there are any unintended changes in the PR
Make sure that the dependencies are being injected
Follow Boy Scout Rule (see if any existing bad code can be improvised - though it is not written by the developer who raised the PR).
Check for the corner cases. Example -  Error Handling (what if the backend doesn’t send an error message).
If there’s any complex logic involved, check if there’s a comment to explain it. 
Indentations
Test Cases - Code Coverage of the new code
Fonts, Colors etc shouldn’t be accessed randomly. There should be a separate file for them. 
Make sure that the directory structure is being followed.
See if the guidelines set by the team is being followed - SwiftLint
Keep It Simple, Stupid (KISS)