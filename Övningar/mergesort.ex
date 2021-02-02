def qsort([]) do
  []
end

#Sorts on the way down
def qsort([{char,freq}|list]) do
  {small,large} = qsplit({char,freq},list,[],[])
  small = qsort(small)
  large = qsort(large)
  append(small,[{char,freq}|large])
end

#Cannot split an empty list
def qsplit(_,[],small,large) do
  {small,large}
end

#One list gets broken into two lists If smaller than privot then small else large list
def qsplit({char1,freq},[{char2,freq2}|t],small,large) do
  if freq > freq2 do
    qsplit({char1,freq},t,[{char2,freq2}|small],large)
  else
    qsplit({char1,freq},t,small,[{char2,freq2}|large])
  end
end

# Nothing to do
def append([],[]) do
  []
end

#Adds an element to the list
def append(element,[])do
  [element]
end

#Flattens two lists
def append(small,large) do
  small ++ large
end
