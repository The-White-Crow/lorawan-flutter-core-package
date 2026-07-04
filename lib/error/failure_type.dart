/// Types of failure that can occur in the application
enum FailureType {
  /// Full page error display
  fullPage,

  /// Pop-up/dialog error display
  popUp,

  /// Inline error display (e.g., in a form field)
  inline,

  /// Silent error (logged but not shown to user)
  silent,
}

/// Tags for categorizing failures
enum FailureTag {
  network,
  server,
  cache,
  database,
  fileSystem,
  permission,
  validation,
  authentication,
  authorization,
  graphql,
  custom,
  unexpected,
}
