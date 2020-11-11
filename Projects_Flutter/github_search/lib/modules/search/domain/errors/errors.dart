abstract class FailureSearch implements Exception {}

class InvalidTextError implements FailureSearch{}

class DataSourceSearchError implements FailureSearch{}