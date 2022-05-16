# QB64-Collection
Collection of separate QB64 programs I've made

## ascii art.bas
Proof of concept for a guy on reddit, post here https://old.reddit.com/r/qbasic/comments/u7o3e7/how_to_make_something_like_the_8bit_guys_intro_in/

Allows you to set a string that the program will iterate over, each iteration goes to the next index in the string
We can't do nested arrays so instead we treat strings as our array of variable lengths + a main 2d array for the display

## colour.bas
Mix of some hacky stuff to make neat image generation

Takes in an unchecked RGB input, (0,255)

Can change the constant 0/8 values in the first 2 for loops to add black streaks into the program -> The higher the number the greater the black streak

Can take out or add in the randomize timer in the function to do an interesting line-esque output, otherwise it's wavier

It's relatively commented if you're interested in what tomfoolery is going on in there, just a small fun project
