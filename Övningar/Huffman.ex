defmodule Huffman do

  def sample do
    'the quick brown fox jumps over the lazy dog
    this is a sample text that we will use when we build
    up a table we will only handle lower case letters and
    no punctuation symbols the frequency will of course not
    represent english but it is probably not that far off'
  end

  def text()  do
    'this is something that we should encode'
  end

  def test do
    sample = sample()
    tree = tree(sample)
    encode = encode_table(tree)
    decode = decode_table(tree)
    text = text()
    seq = encode(text, encode)
    decode(seq, decode)
  end

  def tree(sample) do
    freq = freq(sample)
    huffman(freq)
  end

  def freq(sample) do freq(sample, []) end
  def freq([], freq) do freq end
  def freq([char|rest], freq) do freq(rest, count(char, freq)) end

  def count(char, []) do [{char, 1}] end
  def count(char, [{char,f}|t]) do [{char,f+1}|t] end
  def count(char, [h|t]) do [h|count(char,t)] end

  #  def count(char, [h|t]) do #Funkar ej?
  #   case h do
  #     [{char, f}] -> [{char, f+1}|t]
  #    _ -> [h|count(char, t)]
  #    end
  #   end

  def huffman(freq) do
    huff(isort(freq))
  end

  def huff([{tree, _}]) do tree end
  def huff([{t1,f1}, {t2,f2}|rest]) do
    huff(insert({t1, t2}, f1+f2, rest))
  end

  def insert(e,f,[]) do [{e,f}] end
  def insert(e,f,[{char,n}|t]) do
    if f > n do
      [{char,n}|insert(e,f,t)]
    else
      [{e,f},{char,n}|t]
    end
  end

  def isort([]) do [] end
  def isort([h|t]) do
    isort([h],t)
  end

  def isort(sorted,unsorted) do
    case unsorted do
      [{e,f}|t] -> insert(e,f, sorted) |> isort(t)
      [] -> sorted
    end
  end

#  def encode_table(tree) do
    # To implement...
#  end

#  def decode_table(tree) do
    # To implement...
#  end

#  def encode(text, table) do
    # To implement...
#  end

#  def decode(seq, tree) do
    # To implement...
#  end

end
