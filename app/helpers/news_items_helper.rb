module NewsItemsHelper

  ALPHABET = ((0..9).to_a + ('a'..'z').to_a + ('A'..'Z').to_a).shuffle
 
  def bijective_encode(i)
    i += 1000 * 1000
    s = ''
    base = ALPHABET.length
    while i > 0
      s << ALPHABET[i.modulo(base)]
      i /= base
    end
    s.reverse
  end
   
  def bijective_decode(s)
    i = 0
    base = ALPHABET.length
    s.each_char { |c| i = i * base + ALPHABET.index(c) }
    i - 1000 * 1000
  end

end
