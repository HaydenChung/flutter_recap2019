abstract class BottomNavEvent {}

class SetBottomNavEvent extends BottomNavEvent {
  final int value;
  
  SetBottomNavEvent(this.value);
}