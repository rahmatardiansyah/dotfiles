#define CMDLENGTH 45
#define DELIMITER " "
#define CLICKABLE_BLOCKS

const Block blocks[] = {
	/* BLOCK("cat /tmp/recordingicon 2>/dev/null",    0,    10), */
	BLOCK("bar-nettraf.sh",    2,    0),
	// BLOCK("bar-screenkey.sh",    0,    14),
	BLOCK("bar-ram.sh",    3,    0),
	BLOCK("bar-cpu.sh",    3,    0),
	/* BLOCK("bar-newsboat.sh",    0,    12), */
	/* BLOCK("bar-pacupdate.sh",    1800,    13), */
	BLOCK("bar-notification.sh",    60,    11),
	BLOCK("bar-presentation.sh",    60,    9),
	BLOCK("bar-mic.sh",    10,    8),
	BLOCK("bar-volume.sh",    10,    7),
	BLOCK("bar-battery.sh",    10,    0),
	BLOCK("bar-date.sh",    30,    0),
	BLOCK("bar-internet.sh",    5,    0),
	BLOCK("bar-username.sh",    0,    0),
};
