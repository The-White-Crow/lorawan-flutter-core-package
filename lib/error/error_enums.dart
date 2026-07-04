/// File operation error types
enum FileError {
  writeError,
  readError,
  deleteError,
  fileNotFound,
  tooLarge,
  unsupportedExtension,
}

/// Permission error types
enum PermissionError {
  notificationPermission,
  storagePermission,
  cameraPermission,
  locationPermission,
  microphonePermission,
}

/// Database operation error types
enum DatabaseError {
  connectionError,
  queryError,
  transactionError,
  tableNotFound,
  constraintViolation,
}

