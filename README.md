# MarvelApp 🚀

Welcome to MarvelApp, your go-to application for exploring Marvel characters! This app allows you to search for your favorite Marvel characters, view detailed information, and save your favorites for offline viewing.

## Architectural Overview 🏗️

MarvelApp follows a modular architecture to ensure scalability and maintainability. The architecture is divided into the following modules:

- **Domain Module**: Contains the business logic and use cases.
- **Data Module**: Manages data sources and repositories.
- **Core Module**: Houses shared components, style guides, and shared protocols.
- **Home Module**: Includes components for the home page, detail page, and favorite page.

<!-- ///TODO: add diagrams -->
<!-- ![Architectural Diagram](path_to_architectural_diagram.png) -->

## Features and TODOs 📝

### 1. Home Page 🏠
- **Feature**: Display a list of Marvel characters and enable search functionality.
- **TODOs**:
  - Create a home page tab that shows a list of Marvel characters.
  - Implement a search feature to find specific characters.
  - Add redirection to a detail page for each character.
  - **Home ViewModel**:
    - Use a use case to fetch the list and search results.
    - Manage different states: initial, loading, loaded, and error.

### 2. Detail Page 📜
- **Feature**: Display detailed information about a character and allow users to favorite them.
- **TODOs**:
  - Create a detail page with a favorite feature.
  - **Detail ViewModel**:
    - Manage character details and favorite status.

### 3. Favorite Page ❤️
- **Feature**: Display a list of favorited characters for offline viewing.
- **TODOs**:
  - Create a favorite page tab to visualize offline or stored favorite characters.
  - **Favorite ViewModel**:
    - Use a use case to fetch the favorite list from local storage.

## How to Run the Project 🛠️

1. **Clone the repository**:
    ```bash
    git clone https://github.com/jessicatarra/MarvelApp.git
    cd MarvelApp
    ```

2. **Set up Marvel API keys**:
    You need to include your Marvel API keys in the Environment Variables for Xcode.

    - Open Xcode.
    - Go to `Product` > `Scheme` > `Edit Scheme`.
    - Select the `Run` option from the left sidebar.
    - Go to the `Arguments` tab.
    - Under `Environment Variables`, add the following keys:


      ```env
      PUBLIC_KEY=your_public_key
      PRIVATE_KEY=your_private_key
      ```

3. **Run the project**

## Tools & Frameworks Used 🛠️

| Tool/Framework | Description |
|----------------|-------------|
| SwiftLint      | [SwiftLint](https://github.com/realm/SwiftLint) |
| Swinject       | [Swinject](https://github.com/Swinject/Swinject) |
| Moya           | [Moya](https://github.com/Moya/Moya) |
| Core Data      | [Core Data](https://developer.apple.com/documentation/coredata/) |


## Development Environment 🖥️

* Xcode 16.0
* Swift 6.0
* iOS Deployment Target 18


## License 📄

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

Happy coding! 🎉
