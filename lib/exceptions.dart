class GooglePlayScraperException extends Error {
  final String message;
  GooglePlayScraperException(this.message);
}

class NotFoundError extends GooglePlayScraperException {
  NotFoundError(String message) : super(message);
}

class ExtraHTTPError extends GooglePlayScraperException {
  ExtraHTTPError(String message) : super(message);
}
