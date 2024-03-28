import "";

/// Lifecycle of a Stateful Widget
// A stateful widget in Flutter is a component that can maintain state and update
// its appearance in response to changes. The lifecycle of a stateful widget
// consists of a series of methods that are invoked at different stages of its
// existence.

/// Overview
/// First, let’s have an overview of the stages in the lifecycle of a stateful widget, and
/// which method is invoked at which stage of the lifecycle.

/// 1. createState(): Upon creation of the stateful widget, its constructor is
// called, which initialises the widget. The createState() method is then
// invoked, which creates the state object for the widget.

/// 2. initState: This method is called after the widget is inserted into the widget
// tree, when the object is created for the first time.

/// 3. didChangeDependencies: This method is called when a dependency of
// this widget changes. It is useful when the widget depends on some
// external data or inherits data from its parent widget. It is also called
// immediately after initState().

/// 4. build: Builds the widget’s user interface based on its current state. This
// method is called initially when the widget is first inserted into the widget
// tree, and may be called repeatedly during the lifecycle whenever the
// widget needs to be rebuilt.

/// 5. setState: Triggers a rebuild of the widget when the state changes and the
// associated methods are called again.

/// 6. didUpdateWidget: Triggered when the widget is rebuilt with updated
// properties. It is called after build() and allows you to compare the
// previous and current widget properties.

/// 7. deactivate: Called when the widget is removed from the tree but might be
// inserted again.

/// 8. dispose: Called when the widget is removed from the widget tree
// permanently, allowing you to release resources held by the widget.

/// 9. reassemble: Called when the application is reassembled during hot
// reload.