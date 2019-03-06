# capabilities_tracker
Capabilities Tracker

This is a quick modification to container_check.stp (originally by
William Cohen), so that it can tap on a set of containers that are
running in privileged mode, to see what capabilities they really need.

1. Install stap and start dockerd
2. Run ./systap_test.sh <output.log>
3. Start your containers in privileged mode or with seccomp disabled
4. Test out the services running inside your containers
5. Send ^C or kill the stap process, don't kill your containers
6. Check out the capabilities you need in your <output.log>
