extends Node

# Global Script for signals

# listened to in Global. 
# made it a signal so we can do other stuff in 
# there. Maybe trigger player to do something 
signal add_biscuit(n: int)
signal lose_biscuits(n: int)