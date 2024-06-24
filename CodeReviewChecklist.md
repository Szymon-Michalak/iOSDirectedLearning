# Comprehensive iOS Code Review Checklist

## Code Quality

### 1. Avoid Type Inference

**Checkpoints:**

- Explicitly declare types for variables and constants.
- Ensure function return types are explicitly stated.

**Example:**

```swift
// Avoid
let name = "John"

// Preferred
let name: String = "John"
```

### 2. Use Higher Order Functions

**Checkpoints:**

- Use `map`, `filter`, `reduce`, `flatMap`, `compactMap`, `sorted`, `forEach`, `zip`, and other higher-order functions instead of loops.
- Ensure code readability and maintainability with higher-order functions.

**Cheat Sheet:**

1. **Use `map` instead of iterating and transforming each element:**

   ```swift
   // Avoid
   var doubledValues: [Int] = []
   for value in values {
       doubledValues.append(value * 2)
   }

   // Preferred
   let doubledValues = values.map { $0 * 2 }
   ```

2. **Use `filter` instead of iterating and applying conditions:**

   ```swift
   // Avoid
   var evenValues: [Int] = []
   for value in values {
       if value % 2 == 0 {
           evenValues.append(value)
       }
   }

   // Preferred
   let evenValues = values.filter { $0 % 2 == 0 }
   ```

3. **Use `reduce` instead of manually accumulating results:**

   ```swift
   // Avoid
   var sum = 0
   for value in values {
       sum += value
   }

   // Preferred
   let sum = values.reduce(0, +)
   ```

4. **Use `flatMap` instead of nested loops to flatten collections:**

   ```swift
   // Avoid
   var allElements: [Int] = []
   for array in nestedArrays {
       for element in array {
           allElements.append(element)
       }
   }

   // Preferred
   let allElements = nestedArrays.flatMap { $0 }
   ```

5. **Use `compactMap` instead of filtering and unwrapping optionals:**

   ```swift
   // Avoid
   var nonNilValues: [Int] = []
   for value in optionalValues {
       if let nonNilValue = value {
           nonNilValues.append(nonNilValue)
       }
   }

   // Preferred
   let nonNilValues = optionalValues.compactMap { $0 }
   ```

6. **Use `sorted` instead of manually sorting collections:**

   ```swift
   // Avoid
   let sortedValues = values.sorted { $0 > $1 }

   // Preferred
   let sortedValues = values.sorted(by: >)
   ```

7. **Use `forEach` instead of `for` loops when not returning a value:**

   ```swift
   // Avoid
   for value in values {
       print(value)
   }

   // Preferred
   values.forEach { print($0) }
   ```

8. **Use `zip` to combine two sequences into pairs:**

   ```swift
   // Avoid
   var pairedValues: [(Int, String)] = []
   for i in 0..<min(numbers.count, words.count) {
       pairedValues.append((numbers[i], words[i]))
   }

   // Preferred
   let pairedValues = zip(numbers, words).map { ($0, $1) }
   ```

### 3. Write DRY Code (Don’t Repeat Yourself)

**Checkpoints:**

- Identify and refactor duplicate code into reusable functions or components.
- Check for repeated logic across different view controllers or services.

**Cheat Sheet:**

1. **Use functions to encapsulate repeated logic:**

   ```swift
   // Avoid
   func fetchDataFromServer() {
       // Code to fetch data
   }
   
   func loadDataFromServer() {
       // Similar code to fetch data
   }

   // Preferred
   func fetchData() {
       // Centralized code to fetch data
   }

   fetchData()
   loadData()
   ```

2. **Use extensions to add common functionality:**

   ```swift
   // Avoid
   extension String {
       func isValidEmail() -> Bool {
           let regex = "^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,4}$"
           return NSPredicate(format: "SELF MATCHES[c] %@", regex).evaluate(with: self)
       }
   }
   ```

3. **Use protocols to define common interfaces:**

   ```swift
   // Avoid
   class NetworkManager {
       func fetchUserData() {
           // Code to fetch user data
       }
   }
   
   class UserManager {
       func loadUserData() {
           // Similar code to fetch user data
       }
   }

   // Preferred
   protocol DataFetching {
       func fetchData()
   }

   class NetworkManager: DataFetching {
       func fetchData() {
           // Code to fetch data
       }
   }

   class UserManager: DataFetching {
       func fetchData() {
           // Code to fetch data
       }
   }

   let dataFetchers: [DataFetching] = [NetworkManager(), UserManager()]
   dataFetchers.forEach { $0.fetchData() }
   ```

4. **Use generic functions to handle repeated patterns:**

   ```swift
   // Avoid
   func saveStringData(data: String) {
       // Code to save string data
   }

   func saveIntData(data: Int) {
       // Code to save integer data
   }

   // Preferred
   func saveData<T>(data: T) {
       // Code to save any type of data
   }

   saveData(data: "Hello")
   saveData(data: 123)
   ```

### 4. Avoid Force Unwraps

**Checkpoints:**

- Use optional binding (`if let` or `guard let`) to safely unwrap optionals.
- Use nil coalescing (`??`) to provide default values.
- Ensure force unwrapping is absolutely necessary and cannot be avoided.

**Cheat Sheet:**

1. **Use `if let` for optional binding:**

   ```swift
   // Avoid
   let name: String = user.name!

   // Preferred
   if let name = user.name {
       print(name)
   } else {
       print("No name available")
   }
   ```

2. **Use `guard let` for early exit:**

   ```swift
   // Avoid
   func printUserName(user: User) {
       let name: String = user.name!
       print(name)
   }

   // Preferred
   func printUserName(user: User) {
       guard let name = user.name else {
           print("No name available")
           return
       }
       print(name)
   }
   ```

### 5. Make Sure There Are No Retain Cycles

**Checkpoints:**

- Use `[weak self]` or `[unowned self]` in closures to avoid retain cycles.
- Ensure delegate properties are marked as `weak` to prevent strong reference cycles.

**Cheat Sheet:**

1. **Use `[weak self]` in closures:**

   ```swift
   // Avoid
   class MyViewController: UIViewController {
       var closure: (() -> Void)?

       func setupClosure() {
           closure = {
               self.doSomething()
           }
       }

       func doSomething() {
           // Implementation
       }
   }

   // Preferred
   class MyViewController: UIViewController {
       var closure: (() -> Void)?

       func setupClosure() {
           closure = { [weak self] in
               self?.doSomething()
           }
       }

       func doSomething() {
           // Implementation
       }
   }
   ```

2. **Use `[unowned self]` if self is guaranteed to outlive the closure:**

   ```swift
   // Avoid
   class MyViewController: UIViewController {
       var closure: (() -> Void)?

       func setupClosure() {
           closure = {
               self.doSomething()
           }
       }

       func doSomething() {
           // Implementation
       }
   }

   // Preferred
   class MyViewController: UIViewController {
       var closure: (() -> Void)?

       func setupClosure() {
           closure = { [unowned self] in
               self.doSomething()
           }
       }

       func doSomething() {
           // Implementation
       }
   }
   ```

3. **Mark delegate properties as `weak`:**

   ```swift
   // Avoid
   protocol MyDelegate: AnyObject {
       func didDoSomething()
   }

   class MyClass {
       var delegate: MyDelegate?

       func performAction() {
           delegate?.didDoSomething()
       }
   }

   // Preferred
   protocol MyDelegate: AnyObject {
       func didDoSomething()
   }

   class MyClass {
       weak var delegate: MyDelegate?

       func performAction() {
           delegate?.didDoSomething()
       }
   }
   ```

4. **Use optional chaining to safely access properties:**

   ```swift
   // Avoid
   let street: String = user.address!.street!

   // Preferred
   let street: String? = user.address?.street
   ```

### 6. Check if Any Deprecated API Is Being Used

**Checkpoints:**

- Ensure all APIs used are current and supported by the latest iOS version.
- Regularly check the project for deprecated warnings in Xcode.
- Replace deprecated APIs with their newer counterparts.

**Cheat Sheet:**

1. **Identify Deprecated APIs in Xcode:**
   - **Check for compiler warnings**: Xcode will typically highlight deprecated APIs with warnings.

   ```swift
   // Deprecated API usage
   let alert = UIAlertView(title: "Title", message: "Message", delegate: nil, cancelButtonTitle: "OK")
   alert.show()
   ```

2. **Replace with Newer APIs:**
   - **Find the replacement API** in Apple's documentation or use Xcode's suggested fixes.

   ```swift
   // Preferred
   let alert = UIAlertController(title: "Title", message: "Message", preferredStyle: .alert)
   alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
   present(alert, animated: true, completion: nil)
   ```

3. **Use Xcode's 'Refactor' or 'Fix-it' Suggestions:**
   - **Right-click** on the deprecated API warning and select "Fix-it" if available.
   - **Use the 'Refactor' option** in the Editor menu to replace deprecated APIs across the project.

4. **Regularly Review Apple's Release Notes:**
   - **Stay updated** on deprecated APIs by reviewing the [Apple Developer Release Notes](https://developer.apple.com/documentation/releasenotes/).
   - **Plan updates** for major iOS releases to avoid deprecated API issues.

### 7. Check if Any Hardcoded Checks (Generally Strings) Can Be Changed to Enums

**Checkpoints:**

- Replace hardcoded string values with enums to avoid errors and enhance readability.
- Use enums for predefined values like status codes, user roles, and other categorical data.

**Cheat Sheet:**

1. **Replace Hardcoded Strings with Enums:**

   ```swift
   // Avoid
   if user.role == "admin" {
       // Perform admin-specific actions
   }

   // Preferred
   enum UserRole {
       case admin
       case user
       case guest
   }

   if user.role == .admin {
       // Perform admin-specific actions
   }
   ```

2. **Use Enums for API Status Codes:**

   ```swift
   // Avoid
   let status = "success"

   switch status {
   case "success":
       // Handle success
   case "failure":
       // Handle failure
   default:
       // Handle default case
   }

   // Preferred
   enum APIStatus: String {
       case success
       case failure
       case unknown
   }

   let status: APIStatus = .success

   switch status {
   case .success:
       // Handle success
   case .failure:
       // Handle failure
   case .unknown:
       // Handle unknown
   }
   ```

3. **Use Enums for Configuration Options:**

   ```swift
   // Avoid
   let theme = "dark"

   if theme == "dark" {
       // Apply dark theme
   } else if theme == "light" {
       // Apply light theme
   }

   // Preferred
   enum Theme {
       case dark
       case light
   }

   let theme: Theme = .dark

   switch theme {
   case .dark:
       // Apply dark theme
   case .light:
       // Apply light theme
   }
   ```

### 8. Prefer Enums and Switch Over If-Else

**Checkpoints:**

- Use `enum` to define a set of related values and `switch` statements to handle different cases.
- Ensure all enum cases are covered in `switch` statements to improve readability and reduce errors.

**Cheat Sheet:**

1. **Use Enums to Define Related Values:**

   ```swift
   // Avoid
   let userType = "admin"

   if userType == "admin" {
       // Admin-specific logic
   } else if userType == "user" {
       // User-specific logic
   } else if userType == "guest" {
       // Guest-specific logic
   }

   // Preferred
   enum UserType {
       case admin
       case user
       case guest
   }

   let userType: UserType = .admin
   ```

2. **Use Switch Statements to Handle Different Enum Cases:**

   ```swift
   // Avoid
   if userType == "admin" {
       // Admin-specific logic
   } else if userType == "user" {
       // User-specific logic
   } else if userType == "guest" {
       // Guest-specific logic
   }

   // Preferred
   switch userType {
   case .admin:
       // Admin-specific logic
   case .user:
       // User-specific logic
   case .guest:
       // Guest-specific logic
   }
   ```

3. **Ensure All Enum Cases Are Covered:**

   ```swift
   // Avoid
   switch userType {
   case .admin:
       // Admin-specific logic
   case .user:
       // User-specific logic
   // Missing case .guest
   }

   // Preferred
   switch userType {
   case .admin:
       // Admin-specific logic
   case .user:
       // User-specific logic
   case .guest:
       // Guest-specific logic
   }
   ```

4. **Use Enum with Associated Values:**

   ```swift
   // Avoid
   let actionType = "sendMessage"
   let payload = "Hello"

   if actionType == "sendMessage" {
       sendMessage(payload)
   } else if actionType == "logout" {
       logout()
   }

   // Preferred
   enum ActionType {
       case sendMessage(String)
       case logout
   }

   let action: ActionType = .sendMessage("Hello")

   switch action {
   case .sendMessage(let message):
       sendMessage(message)
   case .logout:
       logout()
   }
   ```

### 9. Avoid Nested Structures (Loops, If-Else)

**Checkpoints:**

- Refactor deeply nested loops and `if-else` statements into separate functions.
- Use guard statements for early exits to reduce nesting.
- Aim for a flat and readable control flow.

**Cheat Sheet:**

1. **Refactor Nested Loops into Separate Functions:**

   ```swift
   // Avoid
   for array in nestedArrays {
       for element in array {
           // Process element
       }
   }

   // Preferred
   func processArray(_ array: [Element]) {
       for element in array {
           // Process element
       }
   }

   for array in nestedArrays {
       processArray(array)
   }
   ```

2. **Use Guard Statements for Early Exits:**

   ```swift
   // Avoid
   func processUser(user: User?) {
       if let user = user {
           if user.isActive {
               // Process active user
           } else {
               // Handle inactive user
           }
       } else {
           // Handle nil user
       }
   }

   // Preferred
   func processUser(user: User?) {
       guard let user = user else {
           // Handle nil user
           return
       }

       guard user.isActive else {
           // Handle inactive user
           return
       }

       // Process active user
   }
   ```

3. **Refactor Complex If-Else into Functions:**

   ```swift
   // Avoid
   if condition1 {
       if condition2 {
           // Handle case 1
       } else if condition3 {
           // Handle case 2
       } else {
           // Handle case 3
       }
   } else {
       // Handle else case
   }

   // Preferred
   func handleCondition1() {
       if condition2 {
           // Handle case 1
       } else if condition3 {
           // Handle case 2
       } else {
           // Handle case 3
       }
   }

   if condition1 {
       handleCondition1()
   } else {
       // Handle else case
   }
   ```

4. **Simplify Nested Conditions:**

   ```swift
   // Avoid
   if condition1 {
       if condition2 {
           if condition3 {
               // Handle deeply nested case
           }
       }
   }

   // Preferred
   func checkConditions() -> Bool {
       return condition1 && condition2 && condition3
   }

   if checkConditions() {
       // Handle case
   }
   ```

### 10. Check if There’s Any API Provided by Apple Which Can Make Things Simple

**Checkpoints:**

- Utilize Apple’s native frameworks and APIs to simplify tasks and improve performance.
- Regularly review Apple’s documentation for new or updated APIs.
- Prefer using built-in functionalities over custom implementations where applicable.

**Cheat Sheet:**

1. **Use URLSession for Networking:**

   ```swift
   // Avoid
   let url = URL(string: "https://api.example.com/data")!
   let request = NSMutableURLRequest(url: url)
   request.httpMethod = "GET"
   
   let task = URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
       // Handle response
   }
   task.resume()

   // Preferred
   let url = URL(string: "https://api.example.com/data")!
   let task = URLSession.shared.dataTask(with: url) { data, response, error in
       // Handle response
   }
   task.resume()
   ```

2. **Use Codable for JSON Parsing:**

   ```swift
   // Avoid
   let jsonString = "{\"name\": \"John\", \"age\": 30}"
   let data = jsonString.data(using: .utf8)!
   let json = try? JSONSerialization.jsonObject(with: data, options: [])
   if let json = json as? [String: Any] {
       let name = json["name"] as? String
       let age = json["age"] as? Int
   }

   // Preferred
   struct User: Codable {
       let name: String
       let age: Int
   }
   
   let jsonString = "{\"name\": \"John\", \"age\": 30}"
   let data = jsonString.data(using: .utf8)!
   let user = try? JSONDecoder().decode(User.self, from: data)
   ```

3. **Use UserDefaults for Simple Data Persistence:**

   ```swift
   // Avoid
   let preferences = UserDefaults.standard
   preferences.setValue("John", forKey: "username")
   preferences.synchronize()

   // Preferred
   UserDefaults.standard.set("John", forKey: "username")
   ```

4. **Use Keychain Services for Secure Data Storage:**

   ```swift
   // Avoid
   // Custom encryption and file storage for sensitive data

   // Preferred
   import Security
   let password = "my_secure_password"
   let passwordData = password.data(using: .utf8)!

   let query = [
       kSecClass: kSecClassGenericPassword,
       kSecAttrAccount: "userAccount",
       kSecValueData: passwordData
   ] as [String: Any]

   SecItemAdd(query as CFDictionary, nil)
   ```

5. **Use NotificationCenter for Observing Events:**

   ```swift
   // Avoid
   var observers: [NSObjectProtocol] = []

   func addObservers() {
       let observer = NotificationCenter.default.addObserver(forName: .someNotification, object: nil, queue: nil) { notification in
           // Handle notification
       }
       observers.append(observer)
   }

   func removeObservers() {
       for observer in observers {
           NotificationCenter.default.removeObserver(observer)
       }
       observers.removeAll()
   }

   // Preferred
   let observer = NotificationCenter.default.addObserver(forName: .someNotification, object: nil, queue: nil) { notification in
       // Handle notification
   }

   deinit {
       NotificationCenter.default.removeObserver(observer)
   }
   ```

6. **Use Core Data for Database Management:**

   ```swift
   // Avoid
   // Custom file-based storage for managing complex data

   // Preferred
   import CoreData

   let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
   let entity = NSEntityDescription.entity(forEntityName: "User", in: context)!
   let newUser = NSManagedObject(entity: entity, insertInto: context)
   newUser.setValue("John", forKey: "name")

   do {
       try context.save()
   } catch {
       print("Failed saving")
   }
   ```

## Code Safety

### 11. Swift and iOS Naming Conventions

#### Variables

**Best Practices:**

- **Use clear, descriptive names** reflecting the purpose of the variable.
- **Follow lowerCamelCase convention** for all variable names.
- **Use plural names** for collections (arrays, sets, dictionaries).
- **Include units** in the name where applicable (e.g., `timeoutInterval`, `maximumSpeedKmPerHour`).

**Booleans (Interrogative Form):**

- **Starting with `is` for states or conditions:**

  ```swift
  var isUserLoggedIn: Bool
  var isNetworkAvailable: Bool
  var isEnabled: Bool
  ```

- **Starting with `has` for possession or completion:**

  ```swift
  var hasFinishedLoading: Bool
  var hasUserAcceptedTerms: Bool
  var hasAdminPrivileges: Bool
  ```

- **Starting with `can` for abilities:**

  ```swift
  var canEditProfile: Bool
  var canSendMessage: Bool
  var canAccessLocation: Bool
  ```

- **Starting with `should` for advisability:**

  ```swift
  var shouldShowAlert: Bool
  var shouldLogOut: Bool
  var shouldSaveData: Bool
  ```

**Integers and Floats:**

- **Descriptive names** reflecting the content or purpose:

  ```swift
  var numberOfItems: Int
  var totalScore: Int
  var averageRating: Float
  var maximumSpeedKmPerHour: Double
  ```

**Strings:**

- **Descriptive names** reflecting the content or purpose:

  ```swift
  var userName: String
  var welcomeMessage: String
  var errorDescription: String
  var formattedDate: String
  ```

**Arrays:**

- **Plural names** reflecting the collection of items they hold:

  ```swift
  var users: [User]
  var scores: [Int]
  var names: [String]
  var dataEntries: [DataEntry]
  ```

**Dictionaries:**

- **Descriptive names** reflecting the key-value pairs they hold:

  ```swift
  var userInfo: [String: Any]
  var productPrices: [String: Double]
  var errorMessages: [Int: String]
  var configuration: [String: String]
  ```

#### Constants

**Best Practices:**

- **Use `let`** to define constants.
- **Use clear, descriptive names** that reflect the purpose of the constant.
- **Follow lowerCamelCase convention** for constant names.

**General Constants:**

- **Descriptive names** that clearly indicate what the constant represents:

  ```swift
  let maxRetries = 3
  let pi = 3.14159
  let timeoutInterval: TimeInterval = 30.0
  let defaultUserName = "Guest"
  ```

**UIColor Constants:**

- **Descriptive names** that clearly indicate the color usage:

  ```swift
  let primaryColor = UIColor.red
  let backgroundColor = UIColor.white
  let textColor = UIColor.black
  let highlightColor = UIColor.blue
  ```

**Notification Names:**

- **Use a clear naming pattern** including the subject and action:

  ```swift
  let userDidLoginNotification = Notification.Name("userDidLoginNotification")
  let dataDidUpdateNotification = Notification.Name("dataDidUpdateNotification")
  let didReceiveRemoteNotification = Notification.Name("didReceiveRemoteNotification")
  ```

#### Functions

**Best Practices:**

- **Use clear, descriptive names** that start with a verb.
- **Follow lowerCamelCase convention** for function names.
- **Use parameters and return types** that clearly indicate the function’s purpose.

**Action Functions:**

- **Start with verbs** indicating the action performed:

  ```swift
  func fetchUserData()
  func saveChanges()
  func deleteItem(at index: Int)
  func submitForm()
  ```

**Utility Functions:**

- **Start with verbs** indicating the action and describe what is being processed:

  ```swift
  func calculateTotalScore(from scores: [Int]) -> Int
  func format(date: Date, with format: String) -> String
  func validate(email: String) -> Bool
  func convertToJSON(data: Data) -> [String: Any]?
  ```

#### Classes

**Best Practices:**

- **Use UpperCamelCase convention** for class names.
- **Use descriptive names** that indicate the class’s responsibility.

**View Controllers:**

- **Descriptive names** reflecting the specific view or functionality:

  ```swift
  class LoginViewController: UIViewController { }
  class ProfileViewController: UIViewController { }
  class SettingsViewController: UIViewController { }
  class DetailViewController: UIViewController { }
  ```

**Models:**

- **Descriptive names** reflecting the data they represent:

  ```swift
  class User { }
  class Product { }
  class Order { }
  class Review { }
  ```

**Managers:**

- **Descriptive names** reflecting the management role they play:

  ```swift
  class NetworkManager { }
  class DataManager { }
  class LocationManager { }
  class SessionManager { }
  ```

#### Structs

**Best Practices:**

- **Use UpperCamelCase convention** for struct names.
- **Use descriptive names** that indicate the struct’s responsibility.

**Simple Data Containers:**

- **Descriptive names** reflecting the data they hold:

  ```swift
  struct UserProfile { }
  struct Address { }
  struct OrderItem { }
  struct ProductDetails { }
  ```

**Configuration:**

- **Descriptive names** reflecting the settings they configure:

  ```swift
  struct AppConfig { }
  struct DatabaseConfig { }
  struct APISettings { }
  struct UserSettings { }
  ```

#### Enums

**Best Practices:**

- **Use UpperCamelCase convention** for enum names.
- **Use singular names** unless the enum represents a collection of values.
- **Use associated values** for complex enums.

**User Roles:**

- **Descriptive names** reflecting the roles:

  ```swift
  enum UserRole {
      case admin
      case user
      case guest
  }
  ```

**API Status Codes:**

- **Descriptive names** reflecting the status:

  ```swift
  enum APIStatus {
      case success
      case failure
      case unknown
  }
  ```

**App Themes:**

- **Descriptive names** reflecting the theme:

  ```swift
  enum AppTheme {
      case light
      case dark
  }
  ```

**Network Response:**

- **Descriptive names** reflecting the response:

  ```swift
  enum NetworkResponse {
      case success(Data)
      case failure(Error)
  }
  ```

#### Patterns

**Best Practices:**

- **Follow Swift naming conventions** for protocols, delegates, singletons, factory methods, and extensions.

**Delegates:**

- **Use descriptive names** indicating the action or subject:

  ```swift
  protocol LoginDelegate { }
  protocol DataUpdateDelegate { }
  protocol NotificationDelegate { }
  protocol UserActionDelegate { }
  ```

**Protocols:**

- **Use descriptive names** indicating the behavior or capability:

  ```swift
  protocol DataConvertible { }
  protocol Formattable { }
  protocol Validatable { }
  protocol Configurable { }
  ```

**Singletons:**

- **Use descriptive names** indicating the shared instance:

  ```swift
  class AppSettings {
      static let shared = AppSettings()
      private init() {}
  }
  ```

**Factory Methods:**

- **Use descriptive names** indicating the creation process:

  ```swift
  class UserFactory {
      static func createUser(with name: String, age: Int) -> User {
          return User(name: name, age: age)
      }
  }
  ```

**Extensions:**

- **Use descriptive names** indicating the added functionality:

  ```swift
  extension String {
      func isValidEmail() -> Bool {
          let regex = "^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,4}$"
          return NSPredicate(format: "SELF MATCHES[c] %@", regex).evaluate(with: self)
      }
  }

  extension UIColor {
      static var themeBackground: UIColor {
          return UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
      }
  }
  ```

### 12. Check for Typos

**Checkpoints:**

- Review the code for typographical errors in variable names, function names, comments, and documentation.
- Use tools or integrated development environments (IDEs) with spell-check features.
- Ensure consistency in naming conventions and terminology throughout the codebase.

**Cheat Sheet:**

1. **Review Variable and Function Names for Typos:**

   ```swift
   // Avoid
   var usrName: String = "John"
   func calclateTotal() -> Int

   // Preferred
   var userName: String = "John"
   func calculateTotal() -> Int
   ```

2. **Review Comments and Documentation:**

   ```swift
   // Avoid
   // This funciton calculates the total score

   // Preferred
   // This function calculates the total score
   ```

3. **Use IDEs with Spell-Check Features:**
   - Enable spell-check in Xcode or other IDEs to catch common typographical errors in comments and documentation.
   - Use linting tools like SwiftLint to enforce consistency and catch potential typos in code.

4. **Consistent Naming Conventions:**
   - Ensure that naming conventions are followed consistently throughout the codebase.
   - Use code reviews to catch and correct any typographical errors.

**Examples:**

1. **Incorrect Variable Names:**

   ```swift
   // Avoid
   var temprature: Double

   // Preferred
   var temperature: Double
   ```

2. **Incorrect Function Names:**

   ```swift
   // Avoid
   func proccesData() -> [String: Any]

   // Preferred
   func processData() -> [String: Any]
   ```

3. **Incorrect Comments:**

   ```swift
   // Avoid
   // Retruns the formatted date string

   // Preferred
   // Returns the formatted date string
   ```

### 13. Wherever Accessing Values from an Array Is Involved, Check If There’s Any Possibility of Index Out of Bound Exception

**Checkpoints:**

- Ensure safe array access by validating indices before accessing elements.
- Use methods like `first`, `last`, `indices.contains(_:)`, and `prefix` to avoid out-of-bounds errors.
- Consider using optional chaining and guard statements for safer access.

**Cheat Sheet:**

1. **Validate Indices Before Accessing Array Elements:**

   ```swift
   // Avoid
   let element = array[index]

   // Preferred
   if array.indices.contains(index) {
       let element = array[index]
   }
   ```

2. **Use `first` and `last` for Safe Access to First and Last Elements:**

   ```swift
   // Avoid
   let firstElement = array[0]
   let lastElement = array[array.count - 1]

   // Preferred
   let firstElement = array.first
   let lastElement = array.last
   ```

3. **Use Optional Chaining to Safely Access Array Elements:**

   ```swift
   // Avoid
   let element = array[index]

   // Preferred
   let element = array.indices.contains(index) ? array[index] : nil
   ```

4. **Use Guard Statements for Early Exit:**

   ```swift
   // Avoid
   let element = array[index]

   // Preferred
   guard array.indices.contains(index) else {
       // Handle out-of-bounds access
       return
   }
   let element = array[index]
   ```

5. **Use `prefix` and `suffix` for Safe Subarray Access:**

   ```swift
   // Avoid
   let firstThreeElements = Array(array[0..<3])

   // Preferred
   let firstThreeElements = array.prefix(3)
   ```

**Examples:**

1. **Safe Array Access with Index Validation:**

   ```swift
   let index = 5
   if array.indices.contains(index) {
       let element = array[index]
   } else {
       print("Index out of bounds")
   }
   ```

2. **Safe Access to First and Last Elements:**

   ```swift
   if let firstElement = array.first {
       print("First element: \(firstElement)")
   }

   if let lastElement = array.last {
       print("Last element: \(lastElement)")
   }
   ```

3. **Optional Chaining for Safe Access:**

   ```swift
   let element = array.indices.contains(index) ? array[index] : nil
   if let element = element {
       print("Element: \(element)")
   } else {
       print("Index out of bounds")
   }
   ```

4. **Guard Statement for Safe Access:**

   ```swift
   func accessElement(at index: Int) {
       guard array.indices.contains(index) else {
           print("Index out of bounds")
           return
       }
       let element = array[index]
       print("Element: \(element)")
   }
   ```

### 14. YAGNI Principle (You Aren’t Gonna Need It)

**Checkpoints:**

- Avoid adding functionality until it is necessary.
- Focus on current requirements without over-engineering.
- Regularly review and remove unused code or features.

**Cheat Sheet:**

1. **Avoid Adding Unnecessary Features:**

   ```swift
   // Avoid
   func fetchData() {
       // Additional code for future feature
   }

   // Preferred
   func fetchData() {
       // Code for current requirements only
   }
   ```

2. **Remove Unused Code:**

   ```swift
   // Avoid
   func fetchData() {
       // Legacy code that is no longer used
   }

   // Preferred
   func fetchData() {
       // Clean and relevant code for current requirements
   }
   ```

3. **Avoid Over-Engineering:**

   ```swift
   // Avoid
   class DataManager {
       func fetchData(forEnvironment environment: String = "production") {
           if environment == "development" {
               // Development-specific code
           } else {
               // Production-specific code
           }
       }
   }

   // Preferred
   class DataManager {
       func fetchData() {
           // Code for current production environment
       }
   }
   ```

4. **Regularly Review Codebase for Redundant Features:**

   ```swift
   // Avoid
   class UserManager {
       func authenticateUser() {
           // Old authentication method
       }
       
       func newAuthenticateUser() {
           // New authentication method
       }
   }

   // Preferred
   class UserManager {
       func authenticateUser() {
           // New authentication method only
       }
   }
   ```

**Examples:**

1. **Removing Unused Parameters:**

   ```swift
   // Avoid
   func calculateTotal(price: Double, discount: Double = 0.0, futureParameter: Int) -> Double {
       return price - discount
   }

   // Preferred
   func calculateTotal(price: Double, discount: Double = 0.0) -> Double {
       return price - discount
   }
   ```

2. **Focusing on Current Requirements:**

   ```swift
   // Avoid
   class PaymentProcessor {
       func processPayment(amount: Double, currency: String = "USD", futureFeatureFlag: Bool = false) {
           // Payment processing logic
       }
   }

   // Preferred
   class PaymentProcessor {
       func processPayment(amount: Double, currency: String = "USD") {
           // Payment processing logic
       }
   }
   ```

3. **Removing Redundant Code:**

   ```swift
   // Avoid
   func fetchData() {
       // Legacy code block
       // ...
       // New code block
   }

   // Preferred
   func fetchData() {
       // New code block only
   }
   ```

I apologize for that oversight. Let's cover the dependency injection section now.

### 15. Inject Dependencies

**Checkpoints:**

- Use dependency injection to pass dependencies instead of creating them within the class.
- Prefer initializer injection over property injection for required dependencies.
- Use dependency injection frameworks or manual dependency injection as appropriate.

**Cheat Sheet:**

1. **Use Initializer Injection:**

   ```swift
   // Avoid
   class UserManager {
       private let networkService = NetworkService()

       func fetchUserData() {
           networkService.requestData()
       }
   }

   // Preferred
   class UserManager {
       private let networkService: NetworkService

       init(networkService: NetworkService) {
           self.networkService = networkService
       }

       func fetchUserData() {
           networkService.requestData()
       }
   }
   ```

2. **Use Property Injection When Necessary:**

   ```swift
   // Avoid
   class UserManager {
       private let networkService = NetworkService()

       func fetchUserData() {
           networkService.requestData()
       }
   }

   // Preferred
   class UserManager {
       private var networkService: NetworkService!

       func inject(networkService: NetworkService) {
           self.networkService = networkService
       }

       func fetchUserData() {
           networkService.requestData()
       }
   }
   ```

3. **Use Dependency Injection Frameworks:**
   - Consider using frameworks like Swinject or Resolver to manage dependencies in larger projects.

   ```swift
   // Example using Swinject
   let container = Container()
   container.register(NetworkService.self) { _ in NetworkService() }
   container.register(UserManager.self) { r in
       let networkService = r.resolve(NetworkService.self)!
       return UserManager(networkService: networkService)
   }

   let userManager = container.resolve(UserManager.self)!
   userManager.fetchUserData()
   ```

4. **Avoid Singleton Dependencies:**

   ```swift
   // Avoid
   class UserManager {
       private let networkService = NetworkService.shared

       func fetchUserData() {
           networkService.requestData()
       }
   }

   // Preferred
   class UserManager {
       private let networkService: NetworkService

       init(networkService: NetworkService) {
           self.networkService = networkService
       }

       func fetchUserData() {
           networkService.requestData()
       }
   }
   ```

5. **Use Protocols to Decouple Dependencies:**

   ```swift
   // Avoid
   class UserManager {
       private let networkService = NetworkService()

       func fetchUserData() {
           networkService.requestData()
       }
   }

   // Preferred
   protocol NetworkServiceProtocol {
       func requestData()
   }

   class NetworkService: NetworkServiceProtocol {
       func requestData() {
           // Implementation
       }
   }

   class UserManager {
       private let networkService: NetworkServiceProtocol

       init(networkService: NetworkServiceProtocol) {
           self.networkService = networkService
       }

       func fetchUserData() {
           networkService.requestData()
       }
   }
   ```

**Examples:**

1. **Initializer Injection:**

   ```swift
   class LoginViewModel {
       private let authService: AuthService

       init(authService: AuthService) {
           self.authService = authService
       }

       func login(username: String, password: String) {
           authService.authenticate(username: username, password: password)
       }
   }

   let authService = AuthService()
   let loginViewModel = LoginViewModel(authService: authService)
   loginViewModel.login(username: "user", password: "password")
   ```

2. **Property Injection:**

   ```swift
   class SettingsViewModel {
       private var settingsService: SettingsService!

       func inject(settingsService: SettingsService) {
           self.settingsService = settingsService
       }

       func loadSettings() {
           settingsService.load()
       }
   }

   let settingsService = SettingsService()
   let settingsViewModel = SettingsViewModel()
   settingsViewModel.inject(settingsService: settingsService)
   settingsViewModel.loadSettings()
   ```

3. **Using Protocols for Decoupling:**

   ```swift
   protocol DataServiceProtocol {
       func fetchData() -> [String]
   }

   class DataService: DataServiceProtocol {
       func fetchData() -> [String] {
           return ["Data1", "Data2"]
       }
   }

   class DataManager {
       private let dataService: DataServiceProtocol

       init(dataService: DataServiceProtocol) {
           self.dataService = dataService
       }

       func retrieveData() -> [String] {
           return dataService.fetchData()
       }
   }

   let dataService = DataService()
   let dataManager = DataManager(dataService: dataService)
   let data = dataManager.retrieveData()
   ```

## Code Maintainability

### 16. Follow Boy Scout Rule (See if Any Existing Bad Code Can Be Improved Even if It’s Not Written by the Developer Who Raised the PR)

**Checkpoints:**

- Always leave the codebase cleaner than you found it.
- Refactor and improve existing code where possible.
- Document improvements made to existing code.

**Cheat Sheet:**

1. **Identify and Refactor Bad Code:**

   ```swift
   // Before
   func processUserData(data: [String: Any]) {
       if let name = data["name"] as? String {
           print("User name: \(name)")
       }
       if let age = data["age"] as? Int {
           print("User age: \(age)")
       }
   }

   // After
   func processUserData(data: [String: Any]) {
       if let name = data["name"] as? String {
           print("User name: \(name)")
       }
       guard let age = data["age"] as? Int else {
           print("Age data is missing or invalid")
           return
       }
       print("User age: \(age)")
   }
   ```

2. **Improve Readability and Maintainability:**

   ```swift
   // Before
   func calculateDiscount(price: Double, discount: Double) -> Double {
       if discount > 0 {
           return price - (price * discount / 100)
       } else {
           return price
       }
   }

   // After
   func calculateDiscount(price: Double, discount: Double) -> Double {
       guard discount > 0 else { return price }
       return price - (price * discount / 100)
   }
   ```

3. **Remove Redundant or Unnecessary Code:**

   ```swift
   // Before
   func fetchUserData() {
       if isNetworkAvailable {
           networkService.requestData { data in
               // Handle data
           }
       }
   }

   // After
   func fetchUserData() {
       guard isNetworkAvailable else { return }
       networkService.requestData { data in
           // Handle data
       }
   }
   ```

4. **Use Modern Swift Features and APIs:**

   ```swift
   // Before
   let filteredData = data.filter { (item) -> Bool in
       return item.isValid
   }

   // After
   let filteredData = data.filter { $0.isValid }
   ```

5. **Document Improvements Made:**
   - Include comments explaining why a change was made to improve existing code.
   - Reference the Boy Scout Rule in PR descriptions or comments to indicate cleanup efforts.

**Examples:**

1. **Refactoring for Readability:**

   ```swift
   // Before
   func fetchUserDetails(userId: String) {
       networkService.requestData(for: userId) { (response) in
           if let data = response.data, response.statusCode == 200 {
               // Parse and handle data
           }
       }
   }

   // After
   func fetchUserDetails(userId: String) {
       networkService.requestData(for: userId) { response in
           guard let data = response.data, response.statusCode == 200 else { return }
           // Parse and handle data
       }
   }
   ```

2. **Simplifying Complex Logic:**

   ```swift
   // Before
   func displayWelcomeMessage(user: User) {
       if user.isNewUser {
           print("Welcome, new user!")
       } else {
           print("Welcome back, \(user.name)!")
       }
   }

   // After
   func displayWelcomeMessage(user: User) {
       let message = user.isNewUser ? "Welcome, new user!" : "Welcome back, \(user.name)!"
       print(message)
   }
   ```

3. **Updating to Modern Swift Syntax:**

   ```swift
   // Before
   let names = users.map { (user) -> String in
       return user.name
   }

   // After
   let names = users.map { $0.name }
   ```

### 18. Comment Complex Logic

**Checkpoints:**

- Add comments to explain complex or non-obvious logic.
- Ensure comments are concise and provide clear explanations.
- Use comments to document the reasoning behind specific decisions or algorithms.
- Avoid redundant or obvious comments.

**Cheat Sheet:**

1. **Comment Complex Algorithms and Logic:**

   ```swift
   // Avoid
   let sortedArray = array.sorted()

   // Preferred
   // Sorting the array to ensure elements are in ascending order for binary search
   let sortedArray = array.sorted()
   ```

2. **Explain Non-Obvious Code:**

   ```swift
   // Avoid
   if x != 0 {
       y = z / x
   }

   // Preferred
   // Check to prevent division by zero
   if x != 0 {
       y = z / x
   }
   ```

3. **Document the Reasoning Behind Decisions:**

   ```swift
   // Avoid
   let timeoutInterval: TimeInterval = 60.0

   // Preferred
   // Setting the timeout interval to 60 seconds to handle slow network conditions
   let timeoutInterval: TimeInterval = 60.0
   ```

4. **Use Comments for Complex Business Logic:**

   ```swift
   // Avoid
   func calculateUserScore() -> Int {
       return (posts.count * 10) + (comments.count * 5)
   }

   // Preferred
   // Calculating user score based on the number of posts and comments
   // Posts are weighted more heavily than comments
   func calculateUserScore() -> Int {
       return (posts.count * 10) + (comments.count * 5)
   }
   ```

5. **Avoid Redundant or Obvious Comments:**

   ```swift
   // Avoid
   // This function calculates the sum of two numbers
   func add(a: Int, b: Int) -> Int {
       return a + b
   }

   // Preferred
   func add(a: Int, b: Int) -> Int {
       return a + b
   }
   ```

**Examples:**

1. **Commenting Complex Algorithm:**

   ```swift
   // Preferred
   // Using the quicksort algorithm to sort the array for better performance on large datasets
   func quicksort<T: Comparable>(_ array: [T]) -> [T] {
       guard array.count > 1 else { return array }
       let pivot = array[array.count / 2]
       let less = array.filter { $0 < pivot }
       let equal = array.filter { $0 == pivot }
       let greater = array.filter { $0 > pivot }
       return quicksort(less) + equal + quicksort(greater)
   }
   ```

2. **Explaining Non-Obvious Logic:**

   ```swift
   // Preferred
   // Using a set to remove duplicates while preserving the original order of elements
   var seen = Set<Int>()
   let uniqueArray = array.filter { seen.insert($0).inserted }
   ```

3. **Documenting Reasoning Behind Decisions:**

   ```swift
   // Preferred
   // Setting the default buffer size to 1024 bytes based on average network packet size
   let defaultBufferSize = 1024
   ```

4. **Commenting Complex Business Logic:**

   ```swift
   // Preferred
   // Applying a discount only if the user is a premium member and the cart total exceeds $100
   if user.isPremium && cart.total > 100 {
       applyDiscount()
   }
   ```

### 19. Indentation

**Checkpoints:**

- Ensure consistent code indentation for readability.
- Follow the project's standard indentation style (typically 4 spaces or a tab).
- Use the same indentation style throughout the codebase.
- Configure your IDE to enforce consistent indentation.

**Cheat Sheet:**

1. **Use Consistent Indentation:**

   ```swift
   // Avoid
   func fetchData() {
   if let data = getData() {
       process(data)
   }
   }

   // Preferred
   func fetchData() {
       if let data = getData() {
           process(data)
       }
   }
   ```

2. **Follow Project's Indentation Style:**

   ```swift
   // Avoid (using tabs in a spaces project)
   func fetchData() {
    if let data = getData() {
     process(data)
    }
   }

   // Preferred (using spaces in a spaces project)
   func fetchData() {
       if let data = getData() {
           process(data)
       }
   }
   ```

3. **Indent Multi-line Statements and Expressions:**

   ```swift
   // Avoid
   let result = someFunction(with: parameter1, parameter2, parameter3,
   parameter4, parameter5)

   // Preferred
   let result = someFunction(
       with: parameter1,
       parameter2,
       parameter3,
       parameter4,
       parameter5
   )
   ```

4. **Use Indentation for Nested Structures:**

   ```swift
   // Avoid
   if condition {
   for item in items {
   process(item)
   }
   }

   // Preferred
   if condition {
       for item in items {
           process(item)
       }
   }
   ```

5. **Consistently Indent Comments:**

   ```swift
   // Avoid
   func calculateTotal() {
   // Calculate the sum of all items
   let total = items.reduce(0, +)
   }

   // Preferred
   func calculateTotal() {
       // Calculate the sum of all items
       let total = items.reduce(0, +)
   }
   ```

**Examples:**

1. **Consistent Indentation in Functions:**

   ```swift
   // Preferred
   func validateUserInput(username: String?, password: String?) -> Bool {
       guard let username = username, !username.isEmpty else {
           print("Invalid username")
           return false
       }
       guard let password = password, !password.isEmpty else {
           print("Invalid password")
           return false
       }
       return true
   }
   ```

2. **Indenting Multi-line Function Calls:**

   ```swift
   // Preferred
   someFunction(
       param1: value1,
       param2: value2,
       param3: value3
   )
   ```

3. **Indenting Nested Structures:**

   ```swift
   // Preferred
   if user.isLoggedIn {
       for item in items {
           if item.isAvailable {
               process(item)
           }
       }
   }
   ```

4. **Indenting Closure Expressions:**

   ```swift
   // Preferred
   let completionHandler: (Bool) -> Void = { success in
       if success {
           print("Operation succeeded")
       } else {
           print("Operation failed")
       }
   }
   ```

5. **Consistently Indented Comments:**

   ```swift
   // Preferred
   func calculateDiscount(price: Double, discount: Double) -> Double {
       // Ensure discount is not negative
       guard discount >= 0 else { return price }
       return price - (price * discount / 100)
   }
   ```

I apologize for that oversight. Let's cover the directory structure section now.

### 18. Follow Directory Structure

**Checkpoints:**

- Maintain a clear and organized project directory structure.
- Group related files and resources logically.
- Follow the team’s or project’s agreed-upon directory structure.
- Ensure new files are placed in the appropriate directories.

**Cheat Sheet:**

1. **Organize Files by Feature or Module:**

   ```swift
   // Preferred
   Project
   |-- Models
   |   |-- User.swift
   |   |-- Product.swift
   |-- Views
   |   |-- UserView.swift
   |   |-- ProductView.swift
   |-- ViewModels
   |   |-- UserViewModel.swift
   |   |-- ProductViewModel.swift
   |-- Controllers
   |   |-- UserController.swift
   |   |-- ProductController.swift
   |-- Resources
   |   |-- Assets.xcassets
   |   |-- Fonts
   |   |-- Colors.swift
   ```

2. **Separate Concerns by Directory:**

   ```swift
   // Avoid
   Project
   |-- User.swift
   |-- UserView.swift
   |-- UserViewModel.swift
   |-- UserController.swift
   |-- Product.swift
   |-- ProductView.swift
   |-- ProductViewModel.swift
   |-- ProductController.swift

   // Preferred
   Project
   |-- Models
   |   |-- User.swift
   |   |-- Product.swift
   |-- Views
   |   |-- UserView.swift
   |   |-- ProductView.swift
   |-- ViewModels
   |   |-- UserViewModel.swift
   |   |-- ProductViewModel.swift
   |-- Controllers
   |   |-- UserController.swift
   |   |-- ProductController.swift
   ```

3. **Use Directories for Resources:**

   ```swift
   // Avoid
   Project
   |-- Assets
   |-- Fonts
   |-- Colors.swift

   // Preferred
   Project
   |-- Resources
   |   |-- Assets.xcassets
   |   |-- Fonts
   |   |-- Colors.swift
   ```

4. **Follow Team’s Agreed-Upon Directory Structure:**
   - Ensure consistency by adhering to the directory structure agreed upon by the team or project guidelines.
   - Regularly review the directory structure for improvements and maintain organization.

**Examples:**

1. **Organized by Feature:**

   ```swift
   Project
   |-- Features
   |   |-- User
   |   |   |-- UserModel.swift
   |   |   |-- UserView.swift
   |   |   |-- UserViewModel.swift
   |   |   |-- UserController.swift
   |   |-- Product
   |   |   |-- ProductModel.swift
   |   |   |-- ProductView.swift
   |   |   |-- ProductViewModel.swift
   |   |   |-- ProductController.swift
   ```

2. **Organized by MVC Pattern:**

   ```swift
   Project
   |-- Models
   |   |-- UserModel.swift
   |   |-- ProductModel.swift
   |-- Views
   |   |-- UserView.swift
   |   |-- ProductView.swift
   |-- Controllers
   |   |-- UserController.swift
   |   |-- ProductController.swift
   ```

3. **Using Resource Directories:**

   ```swift
   Project
   |-- Resources
   |   |-- Assets.xcassets
   |   |-- Fonts
   |   |-- Colors.swift
   |-- Locales
   |   |-- en.lproj
   |   |-- es.lproj
   ```

4. **Consistent Directory Usage**

   ```swift
    // Ensure consistent usage of directories for various components
    Project
    |-- Network
    |   |-- API.swift
    |   |-- NetworkManager.swift
    |-- Utilities
    |   |-- Extensions.swift
    |   |-- Helpers.swift
    |-- Models
    |   |-- User.swift
    |   |-- Product.swift
   ```

### 21. See If the Guidelines Set by the Team Are Being Followed (e.g., SwiftLint)

**Checkpoints:**

- Ensure the code adheres to team coding standards and style guides.
- Use tools like SwiftLint to enforce code style and best practices.
- Regularly review and update coding guidelines to align with project needs.

**Cheat Sheet:**

1. **Use SwiftLint for Code Style Enforcement:**

   ```swift
   // Install SwiftLint and add a configuration file
   // .swiftlint.yml
   disabled_rules:
     - trailing_whitespace
     - force_cast
   opt_in_rules:
     - empty_count
     - missing_docs
   ```

2. **Adhere to Team Coding Standards:**

   ```swift
   // Follow naming conventions, indentation, and other style rules set by the team
   // Example: Using descriptive variable names and proper indentation
   let userName: String = "John"
   let isLoggedIn: Bool = true
   ```

3. **Regularly Review and Update Coding Guidelines:**
   - Ensure that the coding guidelines are up-to-date and reflect the current best practices.
   - Conduct periodic code reviews to reinforce adherence to the guidelines.

4. **Configure SwiftLint in the Project:**

   ```swift
   // Add SwiftLint to the build phases
   if which swiftlint >/dev/null; then
       swiftlint
   else
       echo "warning: SwiftLint not installed, download from https://github.com/realm/SwiftLint"
   fi
   ```

5. **Common SwiftLint Rules to Enforce:**

   ```yaml
   # Example SwiftLint configuration
   line_length: 120
   type_name:
     min_length: 3
     max_length: 40
   variable_name:
     min_length: 3
     max_length: 40
   identifier_name:
     excluded:
       - id
   ```

**Examples:**

1. **Consistent Code Style with SwiftLint:**

   ```swift
   // Before
   let  name  =  "John" // Incorrect spacing and indentation

   // After
   let name = "John" // Correct spacing and indentation enforced by SwiftLint
   ```

2. **Adhering to Naming Conventions:**

   ```swift
   // Before
   let nm = "John" // Unclear variable name

   // After
   let userName = "John" // Descriptive variable name as per team guidelines
   ```

3. **Using SwiftLint to Enforce Line Length:**

   ```swift
   // Before
   let longString = "This is a very long string that exceeds the maximum allowed line length according to the SwiftLint configuration."

   // After
   let longString = "This is a very long string that " +
                    "exceeds the maximum allowed line length " +
                    "according to the SwiftLint configuration."
   ```

4. **Configuring SwiftLint for a Project:**

   ```yaml
   # .swiftlint.yml
   disabled_rules:
     - trailing_whitespace
     - force_cast
   opt_in_rules:
     - empty_count
     - missing_docs
   included:
     - Source
   excluded:
     - Pods
   ```

### 22. Keep It Simple, Stupid (KISS)

**Checkpoints:**

- Aim for simplicity in design and implementation.
- Avoid over-engineering solutions.
- Ensure that the code is easy to understand and maintain.
- Break down complex problems into smaller, manageable pieces.

**Cheat Sheet:**

1. **Simplify Code Logic:**

   ```swift
   // Avoid
   func calculateDiscount(price: Double, discount: Double) -> Double {
       if discount > 0 {
           return price - (price * discount / 100)
       } else {
           return price
       }
   }

   // Preferred
   func calculateDiscount(price: Double, discount: Double) -> Double {
       guard discount > 0 else { return price }
       return price - (price * discount / 100)
   }
   ```

2. **Avoid Over-Engineering:**

   ```swift
   // Avoid
   class PaymentProcessor {
       func processPayment(amount: Double, currency: String = "USD", paymentMethod: String = "CreditCard") {
           // Complex logic for multiple payment methods
           if paymentMethod == "CreditCard" {
               // Process credit card payment
           } else if paymentMethod == "PayPal" {
               // Process PayPal payment
           }
       }
   }

   // Preferred
   class PaymentProcessor {
       func processPayment(amount: Double) {
           // Simple logic for processing payment
           // More complex logic can be added when needed
       }
   }
   ```

3. **Break Down Complex Functions:**

   ```swift
   // Avoid
   func performOperations() {
       // Step 1
       // Complex logic
       // Step 2
       // More complex logic
       // Step 3
       // Even more complex logic
   }

   // Preferred
   func performOperations() {
       performStep1()
       performStep2()
       performStep3()
   }

   private func performStep1() {
       // Logic for step 1
   }

   private func performStep2() {
       // Logic for step 2
   }

   private func performStep3() {
       // Logic for step 3
   }
   ```

4. **Use Descriptive Naming for Clarity:**

   ```swift
   // Avoid
   let x = calculate(a, b)

   // Preferred
   let totalCost = calculateTotalCost(price, quantity)
   ```

5. **Prefer Readable Code Over Clever Code:**

   ```swift
   // Avoid
   let result = items.reduce(0) { $0 + ($1.isValid ? $1.value : 0) }

   // Preferred
   var result = 0
   for item in items {
       if item.isValid {
           result += item.value
       }
   }
   ```

**Examples:**

1. **Simplified Logic:**

   ```swift
   // Before
   func getUserFullName(firstName: String?, lastName: String?) -> String {
       if let firstName = firstName {
           if let lastName = lastName {
               return "\(firstName) \(lastName)"
           } else {
               return firstName
           }
       } else {
           if let lastName = lastName {
               return lastName
           } else {
               return "No name provided"
           }
       }
   }

   // After
   func getUserFullName(firstName: String?, lastName: String?) -> String {
       switch (firstName, lastName) {
       case let (first?, last?):
           return "\(first) \(last)"
       case let (first?, nil):
           return first
       case let (nil, last?):
           return last
       default:
           return "No name provided"
       }
   }
   ```

2. **Breaking Down Complex Logic:**

   ```swift
   // Before
   func processOrder(order: Order) {
       // Validate order
       if !order.isValid {
           return
       }
       // Calculate total
       let total = order.items.reduce(0) { $0 + $1.price }
       // Apply discount
       let discountedTotal = applyDiscount(total)
       // Finalize order
       finalizeOrder(total: discountedTotal)
   }

   // After
   func processOrder(order: Order) {
       guard order.isValid else { return }
       let total = calculateTotal(for: order)
       let discountedTotal = applyDiscount(total)
       finalizeOrder(total: discountedTotal)
   }

   private func calculateTotal(for order: Order) -> Double {
       return order.items.reduce(0) { $0 + $1.price }
   }

   private func applyDiscount(_ total: Double) -> Double {
       // Discount logic
       return total * 0.9
   }

   private func finalizeOrder(total: Double) {
       // Finalize order logic
   }
   ```

## Error Handling

### 16. Check for Corner Cases (e.g., Error Handling, Backend Doesn't Send an Error Message)

**Checkpoints:**

- Ensure robust error handling for edge cases and unexpected scenarios.
- Validate all inputs and handle potential errors gracefully.
- Implement fallback mechanisms when backend responses are missing or invalid.
- Test code against various corner cases to ensure reliability.

**Cheat Sheet:**

1. **Implement Robust Error Handling:**

   ```swift
   // Avoid
   func fetchData() {
       networkService.requestData { data, error in
           if let data = data {
               // Process data
           }
       }
   }

   // Preferred
   func fetchData() {
       networkService.requestData { data, error in
           if let error = error {
               // Handle error
               print("Error occurred: \(error.localizedDescription)")
               return
           }
           guard let data = data else {
               // Handle missing data
               print("No data received")
               return
           }
           // Process data
       }
   }
   ```

2. **Validate Inputs and Handle Errors Gracefully:**

   ```swift
   // Avoid
   func saveUser(name: String, age: Int) {
       // Save user data
   }

   // Preferred
   func saveUser(name: String?, age: Int?) {
       guard let name = name, !name.isEmpty else {
           print("Invalid name")
           return
       }
       guard let age = age, age > 0 else {
           print("Invalid age")
           return
       }
       // Save user data
   }
   ```

3. **Handle Missing or Invalid Backend Responses:**

   ```swift
   // Avoid
   func fetchUserProfile() {
       networkService.requestUserProfile { data in
           // Assume data is always valid
           print("User profile: \(data.profile)")
       }
   }

   // Preferred
   func fetchUserProfile() {
       networkService.requestUserProfile { data, error in
           if let error = error {
               print("Failed to fetch user profile: \(error.localizedDescription)")
               return
           }
           guard let data = data, let profile = data.profile else {
               print("Invalid user profile data")
               return
           }
           print("User profile: \(profile)")
       }
   }
   ```

4. **Implement Fallback Mechanisms:**

   ```swift
   // Avoid
   func loadConfiguration() {
       if let config = remoteService.fetchConfiguration() {
           // Use remote configuration
           applyConfiguration(config)
       } else {
           // Use default configuration
           applyConfiguration(defaultConfig)
       }
   }

   // Preferred
   func loadConfiguration() {
       if let config = remoteService.fetchConfiguration() {
           applyConfiguration(config)
       } else {
           print("Failed to fetch remote configuration, using default")
           applyConfiguration(defaultConfig)
       }
   }
   ```

**Examples:**

1. **Error Handling in Network Requests:**

   ```swift
   func downloadImage(from url: URL) {
       networkService.downloadImage(url: url) { image, error in
           if let error = error {
               print("Failed to download image: \(error.localizedDescription)")
               return
           }
           guard let image = image else {
               print("Received empty image data")
               return
           }
           // Display image
       }
   }
   ```

2. **Handling Edge Cases in Input Validation:**

   ```swift
   func registerUser(name: String?, email: String?) {
       guard let name = name, !name.isEmpty else {
           print("Name is required")
           return
       }
       guard let email = email, email.isValidEmail() else {
           print("Invalid email address")
           return
       }
       // Register user
   }
   ```

3. **Fallback Mechanism for Missing Data:**

   ```swift
   func fetchSettings() {
       settingsService.fetchRemoteSettings { settings, error in
           if let error = error {
               print("Error fetching remote settings: \(error.localizedDescription)")
               applyDefaultSettings()
               return
           }
           guard let settings = settings else {
               print("No settings received, applying defaults")
               applyDefaultSettings()
               return
           }
           applySettings(settings)
       }
   }
   ```

### 17. Test Cases - Code Coverage of the New Code

**Checkpoints:**

- Ensure new code is well-tested and covered by unit tests.
- Aim for high code coverage, but prioritize testing critical paths and edge cases.
- Write clear and concise test cases that verify the correctness of the code.
- Use test frameworks like XCTest for writing and running tests.

**Cheat Sheet:**

1. **Ensure High Code Coverage:**

   ```swift
   // Ensure that unit tests cover most of the code, especially critical logic and edge cases.
   ```

2. **Write Clear and Concise Test Cases:**

   ```swift
   // Write tests that are easy to understand and maintain.
   // Each test should focus on a single aspect of the functionality being tested.
   ```

3. **Test Critical Paths and Edge Cases:**

   ```swift
   // Focus on testing the most important parts of your code.
   // Ensure that edge cases are covered to prevent unexpected behavior.
   ```

4. **Use XCTest for Unit Tests:**

   ```swift
   // Preferred
   import XCTest

   class UserTests: XCTestCase {
       func testUserInitialization() {
           let user = User(name: "John", age: 30)
           XCTAssertEqual(user.name, "John")
           XCTAssertEqual(user.age, 30)
       }

       func testUserAgeValidation() {
           let user = User(name: "John", age: -1)
           XCTAssertFalse(user.isValidAge)
       }
   }
   ```

5. **Mock Dependencies for Isolated Testing:**

   ```swift
   // Use mock objects to test classes in isolation and avoid dependencies on external systems.
   class NetworkServiceMock: NetworkServiceProtocol {
       func fetchData() -> Data? {
           return Data()
       }
   }

   class DataManagerTests: XCTestCase {
       func testFetchData() {
           let mockService = NetworkServiceMock()
           let dataManager = DataManager(networkService: mockService)
           let data = dataManager.fetchData()
           XCTAssertNotNil(data)
       }
   }
   ```

**Examples:**

1. **Basic Unit Test:**

   ```swift
   import XCTest

   class CalculatorTests: XCTestCase {
       func testAddition() {
           let calculator = Calculator()
           let result = calculator.add(2, 3)
           XCTAssertEqual(result, 5)
       }
   }
   ```

2. **Testing Edge Cases:**

   ```swift
   import XCTest

   class StringValidatorTests: XCTestCase {
       func testEmptyString() {
           let validator = StringValidator()
           XCTAssertFalse(validator.isValid(""))
       }

       func testValidString() {
           let validator = StringValidator()
           XCTAssertTrue(validator.isValid("ValidString"))
       }
   }
   ```

3. **Testing Asynchronous Code:**

   ```swift
   import XCTest

   class NetworkManagerTests: XCTestCase {
       func testFetchData() {
           let expectation = self.expectation(description: "FetchData")
           let networkManager = NetworkManager()

           networkManager.fetchData { data in
               XCTAssertNotNil(data)
               expectation.fulfill()
           }

           waitForExpectations(timeout: 5, handler: nil)
       }
   }
   ```

4. **Mocking Dependencies:**

   ```swift
   import XCTest

   class AuthServiceMock: AuthServiceProtocol {
       func login(username: String, password: String, completion: (Bool) -> Void) {
           completion(true)
       }
   }

   class LoginViewModelTests: XCTestCase {
       func testLoginSuccess() {
           let authService = AuthServiceMock()
           let viewModel = LoginViewModel(authService: authService)
           let expectation = self.expectation(description: "LoginSuccess")

           viewModel.login(username: "user", password: "password") { success in
               XCTAssertTrue(success)
               expectation.fulfill()
           }

           waitForExpectations(timeout: 1, handler: nil)
       }
   }
   ```

Would you like to add or modify any specific points or cases for writing test cases and ensuring code coverage?

### UI Elements

### 18. Fonts, Colors, etc. Shouldn’t Be Accessed Randomly. There Should Be a Separate File for Them

**Checkpoints:**

- Centralize fonts, colors, and other UI constants in a dedicated file.
- Use a struct or enum to organize these constants.
- Ensure consistent use of UI constants across the app.

**Cheat Sheet:**

1. **Centralize UI Constants:**

   ```swift
   // Avoid
   label.font = UIFont.systemFont(ofSize: 16)
   label.textColor = UIColor.red

   // Preferred
   label.font = UIFont.appFont(size: 16)
   label.textColor = UIColor.appRed
   ```

2. **Use a Struct or Enum for Fonts:**

   ```swift
   // Fonts.swift
   struct Fonts {
       static func appFont(size: CGFloat) -> UIFont {
           return UIFont.systemFont(ofSize: size)
       }

       static let titleFont = UIFont.boldSystemFont(ofSize: 18)
       static let bodyFont = UIFont.systemFont(ofSize: 14)
   }
   ```

3. **Use a Struct or Enum for Colors:**

   ```swift
   // Colors.swift
   struct Colors {
       static let appRed = UIColor.red
       static let appBlue = UIColor.blue
       static let appBackground = UIColor.white
   }
   ```

4. **Organize and Access UI Constants Consistently:**

   ```swift
   // Usage
   label.font = Fonts.titleFont
   view.backgroundColor = Colors.appBackground
   ```

**Examples:**

1. **Centralized Fonts:**

   ```swift
   // Fonts.swift
   struct Fonts {
       static func appFont(size: CGFloat) -> UIFont {
           return UIFont(name: "CustomFontName", size: size) ?? UIFont.systemFont(ofSize: size)
       }

       static let titleFont = appFont(size: 18)
       static let bodyFont = appFont(size: 14)
   }

   // Usage
   label.font = Fonts.titleFont
   ```

2. **Centralized Colors:**

   ```swift
   // Colors.swift
   struct Colors {
       static let appRed = UIColor(red: 0.95, green: 0.2, blue: 0.2, alpha: 1.0)
       static let appBlue = UIColor(red: 0.2, green: 0.2, blue: 0.95, alpha: 1.0)
       static let appBackground = UIColor(white: 0.95, alpha: 1.0)
   }

   // Usage
   view.backgroundColor = Colors.appBackground
   label.textColor = Colors.appRed
   ```

3. **Organized UI Constants:**

   ```swift
   // UIConstants.swift
   struct UIConstants {
       struct Fonts {
           static func appFont(size: CGFloat) -> UIFont {
               return UIFont(name: "CustomFontName", size: size) ?? UIFont.systemFont(ofSize: size)
           }

           static let titleFont = appFont(size: 18)
           static let bodyFont = appFont(size: 14)
       }

       struct Colors {
           static let appRed = UIColor(red: 0.95, green: 0.2, blue: 0.2, alpha: 1.0)
           static let appBlue = UIColor(red: 0.2, green: 0.2, blue: 0.95, alpha: 1.0)
           static let appBackground = UIColor(white: 0.95, alpha: 1.0)
       }
   }

   // Usage
   label.font = UIConstants.Fonts.titleFont
   view.backgroundColor = UIConstants.Colors.appBackground
   ```

4. **Consistent Access to UI Constants:**

   ```swift
   // Consistent usage throughout the app
   button.titleLabel?.font = UIConstants.Fonts.bodyFont
   headerLabel.textColor = UIConstants.Colors.appBlue
   ```

### 19. Follow Apple’s Human Interface Guidelines

**Checkpoints:**

- Ensure the app's UI and UX align with Apple's Human Interface Guidelines.
- Regularly review and update the app according to the latest guidelines.

**Resource:**

- [Apple's Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/)

### Review PRs

### 20. Review Unintended Changes

**Checkpoints:**

- Check for any unintended or unnecessary changes in the pull request.
- Ensure the PR focuses only on the intended changes and improvements.

**Example:**

```swift
// Avoid
// Unrelated code changes or commented out code

// Preferred
// Only the necessary code changes
```

This comprehensive checklist covers detailed steps and best practices for various aspects of iOS development, ensuring high-quality, maintainable, and robust code.
