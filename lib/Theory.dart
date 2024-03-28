import "";

/// Business Logic Component (BLoC)
/// What is block in Flutter?
// BLoC stands for Business Logic Components; it aims to separate the application's
// business logic from User Interface, making the application code more unambiguous,
// scalable, and testable.

/// What is the difference between BLoC and setState in Flutter?
// Every event should correspond to a state. States are used to reflect changes in your
// variable and its associated data.

/// BLoC Events: Events are actions or triggers that
// lead to changes in your variable's state. Events are typically associated with user
// interactions or other external factors that affect your variable.
// There are several core concepts to understand when using BLoC in Flutter:

/// Events: events signify user activities or other actions that can alter the
// application’s state. Events are typically represented as simple data classes.

/// Bloc: a Bloc is a class that takes in events, processes them, and produces a
// new state. It is in charge of controlling the application’s state and responding
// to user input.

/// State: state represents the current state of the application. It is typically
// represented as an immutable data class.

/// Stream: a stream is a collection of asynchronous events that may be
// monitored for modifications. In the context of BLoC, Streams are used in
// BLoC to describe the application’s state at any given time.

/// Sink: a Sink is a Stream controller that can be used to send events to a
// stream. In the context of BLoC, a Sink is used to send events to the Bloc for
// processing.

/// StreamController: StreamController is used to construct and manage streams.
// In the context of BLoC, a StreamController is used to manage the stream(s) of
// events that are sent to the Bloc.

/// BlocBuilder: BlocBuilder is a widget provided by the flutter_bloc package that
// helps to connect the Bloc to the user interface. It listens to changes in the
// state of the Bloc and rebuilds the UI accordingly.

/// BlocProvider: The flutter_bloc package has a widget called BlocProvider that
// adds a Bloc to the widget tree. It ensures that the Bloc is created only once
// and is accessible to all the widgets in the subtree.

// These are some of the core concepts that are essential to understanding the
// BLoC pattern in Flutter. By understanding these concepts, you can create
// well-architected Flutter applications that are easy to maintain and test.

// BLoC (capitalized) refers to the Business Logic Component pattern, which is a
// state management pattern while bloc (lowercase) is a term that is often used
// to refer to an instance of the Bloc class that implements the BLoC pattern.

// So while the two terms are related, they refer to different concepts – BLoC
// refers to a design pattern, while bloc refers to an instance of a class that
// implements that pattern. We are going to be using both words so it’s good to
// recognize the difference.