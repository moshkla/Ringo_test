// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';


class BaseState extends Equatable {
  final int selectedIndex;

  const BaseState(
    this.selectedIndex,
  );

  @override
  List<Object> get props => [
        selectedIndex,
      ];

  BaseState copyWith({
    int? selectedIndex,
  }) {
    return BaseState(
      selectedIndex ?? this.selectedIndex,
    );
  }
}
