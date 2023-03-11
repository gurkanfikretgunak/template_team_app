abstract class PageEvent {}

class ChangePage extends PageEvent {
  final int index;

  ChangePage(this.index);
}

class ResetPage extends PageEvent {}
