# clean-analytics-architecture-ios
Building an analytics module in Swift

This project implements the analytics system described in Sundell's post [Building an enum-based analytics system in Swift](https://www.swiftbysundell.com/articles/building-an-enum-based-analytics-system-in-swift/). Using enum to manage events will eventually be messy when the number of event grows to hundreds. Therefore, I used structure instead to better manage events. Since events are added, modified, deleted frequently, there is a high possibility to automate the process of generating events. It would be great to keep the events-related code simple.

## Architecture
![Architecture](architecture.jpg)
