// State interface (abstract class in Dart)
abstract class PhoneState {
  void onReceiveCall(Phone context);
}

// Concrete State: Normal mode (ring loudly)
class NormalState implements PhoneState {
  @override
  void onReceiveCall(Phone context) {
    print("Incoming call: Ring ring! 📢 (Normal mode)");
    // In normal mode, the phone rings loudly.
    // (No state change occurs automatically in this mode.)
  }
}

// Concrete State: Vibrate mode
class VibrateState implements PhoneState {
  int _vibrateCount = 0;  // example of internal state (e.g., count calls)

  @override
  void onReceiveCall(Phone context) {
    _vibrateCount++;
    print("Incoming call: Bzzzt bzzzt... 🤫 (Vibrate mode)");
    // Perhaps if too many calls come in vibrate, switch to silent automatically:
    if (_vibrateCount >= 3) {
      print("No answer after $_vibrateCount vibrations, switching to Silent mode.");
      context.setState(SilentState());
      // Note: This is just to demonstrate a state triggering a transition.
      // In real life, phones don't usually do this on their own!
    }
  }
}

// Concrete State: Silent mode
class SilentState implements PhoneState {
  @override
  void onReceiveCall(Phone context) {
    print("Incoming call: (Silent mode, no sound) 🤐");
    print("The phone stays silent. You might see a missed call later.");
    // In silent mode, maybe log a missed call in context (omitted for simplicity).
  }
}

// Context: Phone
class Phone {
  // start in Normal mode by default
  PhoneState _state = NormalState();

  void setState(PhoneState newState) {
    _state = newState;
    // You could also print or log the mode change here if desired.
  }

  void receiveCall() {
    // Delegate behavior to the current state object
    _state.onReceiveCall(this);
  }
 
  // (Optional) A helper to show current state as a string, for logging:
  String get modeName => _state.runtimeType.toString();
}

void main() {
  Phone phone = Phone();
  print("Phone is now in ${phone.modeName}.");

  // Simulate incoming calls in Normal mode
  phone.receiveCall();  // should ring loudly

  // Change to Vibrate mode
  phone.setState(VibrateState());
  print("\nPhone is now in ${phone.modeName}.");
  phone.receiveCall();  // vibrate
  phone.receiveCall();  // vibrate again
  phone.receiveCall();  // vibrate third time, triggers switch to Silent

  // Now phone should have switched to Silent mode automatically
  print("\nPhone is now in ${phone.modeName}.");
  phone.receiveCall();  // silent, no sound

  // Manually switch back to Normal mode
  phone.setState(NormalState());
  print("\nPhone is now in ${phone.modeName}.");
  phone.receiveCall();  // rings loudly again
}