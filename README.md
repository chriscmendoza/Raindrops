*What Will Happen?*

*Rain drops will fall from the clouds created by processing.
*These raindrops will fall at intervals, one by one, or even multiple at a time.
*There will be a catcher at the bottome of the screen. To control this catcher, the player will use their mouse.
*The catcher will ONLY move in the x direction of the mouse (it has a predetermined Y value).
*Each time a raindrop hits the catcher, the score variable will increase. 
*Each time a raindrop is not catched, the player will lose a life.
*If a player loses all of her/her lives, they will lose the game.
*At the Winning or Losing Screen, the player will have the option of restarting the game or not.
*Music will play throughout the game. The music changes whether the player wins or loses the game.


*Algorithm*

*Create a Raindrop class.
*In the class, create an array of raindrops.
*Create a catcher class.
*Make the catcher display and follow your mouse in the x direction.
*Check to see if the raindrops touch the catcher.
*If the raindrops come in contact with the catcher, the score variable will increase and that same raindrop will disappear.
*After a ceratin interval, another raindrop will fall.
*Create a Cloud class.
*Make the cloud display and move only in the x direction (it has a predetermined Y value just as the catcher).
*Make the raindrops ONLY fall from the moving cloud.
*Create a Pause Button.
*The pause button will pause the game if the player has to take a break or is tired of playing.
*Create a Start Screen and with it a Starting Button.
*At the Start Screen, the Starting Button will be used to start the game so the player can play.
*Create Winner and Loser Screens.
*After a certain score, have a winner screen appear.
*After a certain amount of lives are lost, have a loser screan appear.
*Create a Restart Button.
*Have the Restart Button appear in both the Winner Screen and Loser Screen
*The Restart Button will allow the player to play again, if they choose to do so.
*Import Music Files.
*The Music Files will add more pizazz to the game. The music will help keep the player interested in the game and not fall asleep while playing.
*Have one song playing throughout the game, and then have different songs play depending on whether the player wins or loses the game.
*Find someone to play the game and see their reaction!


*Bugs/Glitces/Additional Information*

*The levels on the game do not do anything. They are just there as text. I had to delete that the acceleration would increase because it messed with my lives.
*Sometimes an error message comes such as:
             *==== JavaSound Minim Error ====
              ==== Don't know the ID3 code APIC
             *"NullPointerException"
*The Pause Button ONLY pauses the raindrops and cloud from moving. The Catcher still moves and it can still catch the raindrop if the raindrops is paused on the x axis of the catcher. The Score will still increase if the raindrop is caught even if the game is paused.
*When the actual code is open, maximize the screen to view the FULL comments.
*The Start and Restart Button do work, BUT if you click a little bit after, before, above, or below, the button still works. It's not a big difference, but it will work if you move a tad bit to the sides of it.
*Just as the Start and Restart button, the Catcher can catch the raindrops even if it falls a tad bit to its side.

