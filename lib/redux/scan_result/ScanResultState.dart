import 'package:meta/meta.dart';
import 'package:recap2019/local_storage/ScanResultStorage.dart';

@immutable
class ScanResultState{
  
  final List<String> scanResult;

  ScanResultState({
    @required
    this.scanResult
  });

  factory ScanResultState.initial() {
    ScanResultStorage storage = ScanResultStorage();
    return ScanResultState(
      scanResult: storage.value ?? [],
      // scanResult: storage.value,
      // scanResult: []
    );
  }

  ScanResultState copyWith({
    // String pageName,
    int pageIndex
  }) {
    return ScanResultState(
      scanResult: pageIndex ?? this.scanResult
    );
  }

  @override
  bool operator ==(Object other) =>
    identical(this, other) ||
      other is ScanResultState &&
        this.scanResult == other.scanResult;

  @override
  int get hashCode =>
    this.scanResult.hashCode;
}