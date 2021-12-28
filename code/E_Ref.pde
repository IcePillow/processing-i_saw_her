//level settings []
  int[][] levelPresets = {
    //plXti, plYti, loXti, loYti, caXti, caYti, guXti, guYti, zoXti, zoYti . . .
  //story 1
    {8,24, 24,24}, //0
    {10,24, 26,24, 4,24}, //1
    {26,8, 14,8, 12,26}, //2
    {4,10, 26,10, 25,18}, //3
    {14,25, 24,13, 14,20}, //4
    {14,26, 3,16, 8,26}, //5
    
    {3,18, 28,14, 8,26, 100,100, 20,26}, //6
    {1,28, 26,14, 29,28, 100,100, 8,11, 27,14, 20,24}, //7
    {2,14, 22,20, 7,14, 100,100, 24,14, 10,20, 27,20}, //8
    {4,15, 26,17, 20,23, 3,20, 22,17, 24,17, 28,17}, //9
    {30,22, 30,9, 24,28, 1,13, 25,9, 4,12, 7,17, 15,17, 3,22, 16,22, 20,22, 9,28, 18,28, 16,28}, //10
    
    {3,21, 28,26, 6,26, 100,100, 2,6, 5,6, 28,8, 2,26}, //11
    {28,27, 2,5, 8,27, 5,22, 26,10, 5,15, 2,21, 10,21, 14,21, 5,27}, //12
    {12,22, 26,22, 7,28, 30,19, 3,10, 9,10, 10,10, 16,10, 26,10, 30,10}, //13
    {4,10, 27,10, 10,26, 16,22, 29,10, 15,16, 21,16, 23,16, 27,16, 2,21, 14,21, 18,21, 22,21, 29,21, 6,26, 17,26, 24,26}, //14
    {10,20, 24,20, 14,20}, //15
  //story 2
    {10,24, 26,24, 4,24}, //16
    {26,8, 14,8, 14,26}, //17
    {2,10, 30,10, 25,18}, //18
    {14,25, 22,12, 9,20}, //19
    {14,26, 3,16, 8,26}, //20
    
    {3,18, 28,14, 8,26, 100,100, 20,26, 26,14, 14,26}, //21
    {1,28, 26,14, 29,28, 100,100, 6,11, 8,11, 27,14, 23,14, 20,24, 17,24}, //22
    {2,10, 22,20, 7,14, 100,100, 24,14, 10,18, 27,20}, //23
    {4,15, 26,17, 20,23, 3,20, 22,17, 24,17, 28,17}, //24
    {30,22, 30,9, 24,28, 2,14, 25,9, 4,13, 7,17, 15,17, 3,22, 16,22, 20,22, 9,28, 18,28, 16,28}, //35
    
    {3,21, 28,26, 6,26, 100,100, 3,6, 5,6, 27,8, 29,8, 3,26, 14,26, 23,26}, //26
    {28,27, 2,5, 8,27, 5,22, 26,10, 5,15, 2,21, 10,21, 14,21, 6,27}, //27
    {12,22, 26,22, 7,28, 30,19, 1,10, 3,10, 9,10, 10,10, 16,10, 26,10, 30,10, 28,22, }, //28
    {4,10, 27,10, 10,26, 16,22, 29,10, 15,16, 21,16, 23,16, 27,16, 2,21, 14,21, 19,21, 22,21, 29,21, 6,26, 17,26, 24,26}, //29
    {8,20, 24,20, 4,20}, //30
  };

//text at top of levels
String[][] levelText;

String[][] levelTextHer = {
//story 1
  {"i saw her standing there", "but then she was a zombie."},
  {"i loved her but she was a zombie", "so i put her in a cage."},
  {"i knew she loved me too", "because she always tried to hug me."},
  {"sometimes the cage was hard to reach", "i'm glad she likes to follow me."},
  {"she liked to escape from her cage", "but i'd always put her back."},
  {"she was sneaky and got into sneaky places", "i love her 'cuz of her mischief."},
  
  {"there were other zombies too", "i didn't love them at all."},
  {"they were mean and got in my way", "but i was a lot smarter than them."},
  {"there were lots of other zombies", "lucky i'm a really good jumper."},
  {"sometimes i'd even find a gun", "take that, other zombies!"},
  {"if bullets ran out, i'd find another gun", "nothing's going to keep me from my girl."},
  
  {"the other zombies got very angry", "that was when it got prety scary."},
  {"my love was stronger than my fear", "zombies aren't really that bad anyway."},
  {"they always stopped when she was safe", "maybe they're happy for our love."},
  {"i loved her and she loved me", "but then she was a zombie"},
  {"i saw her standing there", "and then i was a zombie"},
//story 2
  {"i saw her standing there", "but then she was a zombie."},
  {"the earthquake changed the land", "but it couldn't change our love"},
  {"the land was harder to jump around","but i would do anything for her"},
  {"i had to be careful we didn't fall","i kept her safe in her cage"},
  {"i don't know how she got into these places","i love a mysterious girl"},
  
  {"the earthquake had brought more zombies","but i tricked them all to be with her"},
  {"i was always scared","until i was able to look into her eyes"},
  {"the terrain was rugged","but when we were together it was worth it"},
  {"when i found a gun i knew what to do","i had to save her from those other zombies!"},
  {"i traveled far to bring her back","maybe someday i won't need a cage..."},
  
  {"i love her even though she's a zombie","it doesn't matter what's on the outside"},
  {"she looked like a monster","but i could see her internal beauty"},
  {"all these other zombies mean nothing","i only have a heart for her"},
  {"and she only has a heart for me","luminous beings we are,\nnot this crude matter"},
  {"i saw her standing there","and then she was a human"},
};

String[][] levelTextHim = {
//story 1
  {"i saw him standing there", "but then he was a zombie."},
  {"i loved him but he was a zombie", "so i put him in a cage."},
  {"i knew he loved me too", "because he always tried to hug me."},
  {"sometimes the cage was hard to reach", "i'm glad he likes to follow me."},
  {"he liked to escape from his cage", "but i'd always put him back."},
  {"he was sneaky and got into sneaky places", "i love him 'cuz of his mischief."},
  
  {"there were other zombies too", "i didn't love them at all."},
  {"they were mean and got in my way", "but i was a lot smarter than them."},
  {"there were lots of other zombies", "lucky i'm a really good jumper."},
  {"sometimes i'd even find a gun", "take that, other zombies!"},
  {"if bullets ran out, i'd find another gun", "nothing's going to keep me from my boy."},
  
  {"the other zombies got very angry", "that was when it got prety scary."},
  {"my love was stronger than my fear", "zombies aren't really that bad anyway."},
  {"they always stopped when he was safe", "maybe they're happy for our love."},
  {"i loved him and he loved me", "but then he was a zombie"},
  {"i saw him standing there", "and then i was a zombie"},
//story 2
  {"i saw him standing there", "but then he was a zombie."},
  {"the earthquake changed the land", "but it couldn't change our love"},
  {"the land was harder to jump around on", "but i would do anything for him"},
  {"i had to be careful we didn't fall","i kept him safe in his cage"},
  {"i don't even know how she got into these places","i love a mysterious boy"}, 
  
  {"the earthquake had brought more zombies","but i tricked them all to be with him"},
  {"i was always scared","until i was able to look into his eyes"},
  {"the terrain was rugged and the zombies angry","but when we were together it was worth it"},
  {"when i found a gun i knew what to do","i had to save him from those other zombies!"},
  {"i traveled far to bring him back","maybe someday i won't need a cage"},
  
  {"i love him even though he's a zombie","it doesn't matter what's on the outside"},
  {"he looked like a monster","but i could see his internal beauty"},
  {"all these other zombies mean nothing","i only have a heart for him"},
  {"and he only has a heart for me","luminous beings we are, not this crude matter"},
  {"i saw him standing there","and then he was a human"},
};
