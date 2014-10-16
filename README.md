Transliteratr
=============

Language is an endlessly fascinating phenomenon.  Essentially, spoken language is just patterns of sound that we have given associative and correlative meaning, signifiying everything and anything about the world.  Because we are initiated into our particular cults of language from birth, those patterns are an inherent part of us, and we recognize them immediately.  What I wanted to experiment with when I built Translitatr was deconstructing the language patterns we are familiar with and transforming them into another kind of language that is completely new and beautiful.  The initial inspiration came from an image I saw on Tumblr:

![ Color Typewriter ](http://media.boingboing.net/wp-content/uploads/2012/01/7145_6693148987_9ec3bdbed0_o.jpg)

How it works.
-------------

Transliteratr takes user-inputted text and transforms it into a mosaic of tiles, where each character in the text, excluding spaces, is represented by a specific color.  The text can be anything, but I prefer to pick selections from novels, short-stories, poems, songs, or other artistic texts, if only because I like the idea of "translating" art from one form/medium to another.  There are options to control the shape, size, and color palette of the mosaic that is generated, which is made up of dynamically styled elements.

One of the compelling color palette options is a random color palette, which is algorithmically generated every time a user submits the text to be translated. The algorithm defines a random RGB value to every character member of a YAML file, whose contents are passed via Sinatra route parameters to the "canvas," where the actual construction of the mosaic is handled by an ERB script.