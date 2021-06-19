function send_event(eventCategory, eventAction, eventLabel) {
	ga('send', 'event', eventCategory, eventAction, eventLabel);
}