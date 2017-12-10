class BeerSong
  VERSE0 = "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  VERSE1 = "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
  VERSE2 = "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
  FIRST_THREE = [VERSE0, VERSE1, VERSE2]
  
  def verse(bottles)
    if bottles > 2
      basic_string(bottles)
    else
      FIRST_THREE[bottles]
    end
  end
  
  def lyrics
    verses(99, 0)
  end

  def verses(max, min)
    lyrics = []
    counter = 0
    max.downto(min).each do |number|
      counter += 1
      lyrics << verse(number)
    end
    lyrics.join("\n")
  end
  
  private
  
  def basic_string(bottles)
    "#{bottles} bottles of beer on the wall, #{bottles} bottles of beer.\n" \
      "Take one down and pass it around, #{bottles-1} bottles of beer on the wall.\n"
  end
end

#Great solution by Nick:

#Bonus - using a Hash and Hash#default_proc instead of conditionals:

class BeerSong
  VERSES = {
    0 => "No more bottles of beer on the wall, no more bottles of beer.\n" \
         "Go to the store and buy some more, 99 bottles of beer on the wall.\n",
    1 => "1 bottle of beer on the wall, 1 bottle of beer.\n" \
         "Take it down and pass it around, no more bottles of beer on the wall.\n",
    2 => "2 bottles of beer on the wall, 2 bottles of beer.\n" \
         "Take one down and pass it around, 1 bottle of beer on the wall.\n"
  }
  VERSES.default_proc = proc do |_, num|
    "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
    "Take one down and pass it around, #{num - 1} bottles of beer on the wall.\n"
  end

  def verse(start_num, end_num = start_num)
    start_num.downto(end_num).map { |num| VERSES[num] }.join("\n")
  end
  alias verses verse

  def lyrics
    verses(99, 0)
  end
end
