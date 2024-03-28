import "";

/// State management

/// ● State management in Flutter is a critical concept for building
// robust, responsive, and efficient mobile applications.

/// ● It refers to the management and manipulation of data within
// an app to ensure that the user interface (UI) accurately
// reflects the current state of the application.

/// What does a state management use?
// In back-end state management, an application component uses an external data
// structure or database to record the final state when it's done processing activities.
// Processing the next message starts with retrieving the previous state from the
// database.

/// Which state management is best for Flutter?
// Bloc and GetX are the most popular packages by far, with Riverpod in third place
// with half the stars. All three are growing at approximately the same rate, with GetX
// growing just a hair faster and possibly overtaking Bloc in a few years.

// As you explore Flutter, there comes a time when you need to share application state
// between screens, across your app. There are many approaches you can take, and
// many questions to think about.

// If you’re coming to Flutter from an imperative framework (such as Android SDK or
// iOS UIKit), you need to start thinking about app development from a new perspective.

// Many assumptions that you might have don’t apply to Flutter. For example, in Flutter
// it’s okay to rebuild parts of your UI from scratch instead of modifying it. Flutter is fast
// enough to do that, even on every frame if needed.

/// Flutter is declarative. This means that Flutter builds its user interface to reflect the
/// current state of your app:

// When the state of your app changes (for example, the user flips a switch in the
// settings screen), you change the state, and that triggers a redraw of the user
// interface. There is no imperative changing of the UI itself (like widget.setText)—you
// change the state, and the UI rebuilds from scratch.

// Read more about the declarative approach to UI programming in the get started
// guide.

// The declarative style of UI programming has many benefits. Remarkably, there is only
// one code path for any state of the UI. You describe what the UI should look like for
// any given state, once—and that is it.

// At first, this style of programming might not seem as intuitive as the imperative style.

/// Differentiate between ephemeral state and app state
// This doc introduces app state, ephemeral state, and how you might manage each in a
// Flutter app.

// In the broadest possible sense, the state of an app is everything that exists in memory
// when the app is running. This includes the app’s assets, all the variables that the
// Flutter framework keeps about the UI, animation state, textures, fonts, and so on.
// While this broadest possible definition of state is valid, it’s not very useful for
// architecting an app.

// First, you don’t even manage some state (like textures). The framework handles those
// for you. So a more useful definition of state is “whatever data you need in order to
// rebuild your UI at any moment in time”. Second, the state that you do manage yourself
// can be separated into two conceptual types: ephemeral state and app state.

/// Ephemeral state
// Ephemeral state (sometimes called UI state or local state) is the state you can neatly
// contain in a single widget.

/// App state
// State that is not ephemeral, that you want to share across many parts of your app, and
// that you want to keep between user sessions, is what we call application state
// (sometimes also called shared state).

/// Examples of application state:
/// ● User preferences
/// ● Login info
/// ● Notifications in a social networking app
/// ● The shopping cart in an e-commerce app
/// ● Read/unread state of articles in a news app

// For managing app state, you’ll want to research your options. Your choice depends on
// the complexity and nature of your app, your team’s previous experience, and many
// other aspects.

/// There is no clear-cut rule
// To be clear, you can use State and setState() to manage all of the state in your app.
// In fact, the Flutter team does this in many simple app samples (including the starter
// app that you get with every flutter create).

// It goes the other way, too. For example, you might decide that—in the context of your
// particular app—the selected tab in a bottom navigation bar is not ephemeral state. You
// might need to change it from outside the class, keep it between sessions, and so on.
// In that case, the _index variable is app state.

// There is no clear-cut, universal rule to distinguish whether a particular variable is
// ephemeral or app state. Sometimes, you’ll have to refactor one into another. For
// example, you’ll start with some clearly ephemeral state, but as your application grows
// in features, it might need to be moved to app state.

/// List of state management approaches
// State management is a complex topic. If you feel that some of your questions
// haven’t been answered, or that the approach described on these pages is not viable
// for your use cases, you are probably right.

/// Learn more at the following links, many of which have been contributed by the Flutter
/// community:

/// Provider
// Managing State using setState() starts becoming horrific as the code grows.
// because whenever you need to change the widget’s UI, you have to call setState()
// inside the changing widget, so that it gets rebuilt, and since application is composed
// of hundreds of different widgets, so there could be hundred different points where
// you have to take care of calling setState(), and managing state. Moreover, your front
// end logic will be scattered in different places in UI code. So, using this raw technique
// to manage state is not a good option, we have a better approach to manage state,
// which is not just Easy but Effective, called Provider State Management.

/// Provider
// Provider State Management, which is recommended by Google a
// well, mainly provides you a central point to manage the state, and to
// write front end logic.

/// Provider Components
// There are three components related to this Provider State
// Management that we need to understand.
/// 1. ChangeNotifier.
/// 2. ChangeNotifierProvider
/// 3. Consumer

/// Riverpod
// Riverpod works in a similar fashion to Provider. It offers compile safety and testing
// without depending on the Flutter SDK.

/// setState
// The low-level approach to use for widget-specific, ephemeral state.

/// Redux
// A state container approach familiar to many web developers.

/// Fish-Redux
// Fish Redux is an assembled flutter application framework based on Redux state
// management. It is suitable for building medium and large applications.

/// BLoC / Rx
// A family of stream/observable based patterns.

/// GetIt
// A service locator based state management approach that doesn’t need a
// BuildContext.

/// MobX
// A popular library based on observables and reactions.

/// Flutter Commands
// Reactive state management that uses the Command Pattern and is based on
// ValueNotifiers. Best in combination with GetIt, but can be used with Provider or
// other locators too.

/// Binder
// A state management package that uses InheritedWidget at its core. Inspired in part
// by recoil. This package promotes the separation of concerns.

/// GetX
// A simplified reactive state management solution.
// states_rebuilder
// An approach that combines state management with a dependency injection solution
// and an integrated router. For more information,

/// Triple Pattern (Segmented State Pattern)
// Triple is a pattern for state management that uses Streams or ValueNotifier. This
// mechanism (nicknamed triple because the stream always uses three values: Error,
// Loading, and State), is based on the Segmented State pattern.

/// solidart
// A simple but powerful state management solution inspired by SolidJS.

/// flutter_reactive_value
// The flutter_reactive_value library might offer the least complex solution for state
// management in Flutter. It might help Flutter newcomers add reactivity to their UI,
// without the complexity of the mechanisms described before. The
// flutter_reactive_value library defines the reactiveValue(BuildContext)
// extension method on ValueNotifier. This extension allows a Widget to fetch the
// current value of the ValueNotifier and subscribe the Widget to changes in the value
// of the ValueNotifier. If the value of the ValueNotifier changes, Widget rebuilds.