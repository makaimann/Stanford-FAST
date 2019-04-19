I: reset_done = False
I: push = 0_1
I: pop = 0_1
I: rst = 1_1

S1: reset_done = True
S1: rst = 0_1

# TRANS
I -> S1
S1 -> S1