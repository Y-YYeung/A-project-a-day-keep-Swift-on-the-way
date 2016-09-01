# Notes for Project-2

## Everything said here is about Swift

### Access `class` property like in Objective-C
- Use `<Class Name>.self`

### Class and Struct
- Instances of classes are passed by references
- struct is passed by value

### Protocol and Delegate
- All custom delegate methods declared in protocol must be implemented
- Want to add optional delegate methods to protocol like Objective-C
	- add `@objc` before the keyword `protocol`
	- and add `optional` before the keyword `func` of the delegate methods
	- when using optional delegate methods, implementation of the optional delegate methods should be checked

		```swift
		// Method should be seen as a object.
		if ((delegate?.playButtonDidPress) != nil) {
		  delegate?.playButtonDidPress!(self)
		}
		```

	- **Most of the time, no need to declare the optional delegate method**, so, delegate methods can be invoked directly without checking implementation, like

		```swift
		delegate?.playButtonDidPress(self)
		```


- A protocol can be adopted by a class, structure, or enumeration
	- So, when declare a protocol something like UITableView, `: class` should be added in the first place, because the property of `delegate` should be `weak`, and `weak` can only be applied to class
- It's convience to declare a protocol inherited from `NSObjectProtocol`

### Access Control
- The default access level of swift properties and methods is `internal`
	- which means the properties and methods can be accessed in a module
	- A module means an app, so `internal` means properties and methods can be accessed within an app just like properties and methods declared in .h files in Objective-C


### Extension (Category in Objective-C)
- It is recommended implementing delgate methods in an extension

