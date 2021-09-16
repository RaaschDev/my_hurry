import 'package:hurry/app/modules/home/domain/models/event_model.dart';
import 'package:mobx/mobx.dart';
part 'event_controller.g.dart';

class EventController = _EventControllerBase with _$EventController;

abstract class _EventControllerBase with Store {
  @observable
  EventModel? eventModel;
}
