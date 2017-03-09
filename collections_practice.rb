require 'pry'
# your code goes here
def begins_with_r( array )
  array.all? do |word|
    word[0] == 'r'
  end
end

def contain_a( array )
  array.select do |word|
    word.include?( 'a' )
  end
end

def first_wa( array )
  array.detect do |word|
    word[0] + word[1] == "wa"
  end
end

def remove_non_strings( array )
  array.keep_if do |element|
    element.is_a? String
  end
end

def count_elements( array )
  elements_array = array.uniq
  return_array = []
  elements_array.each do |element|
    return_array << element.merge( { count: array.count( element ) } )
  end
  return_array
end

def merge_data( array1, array2 )
  result = []
  array1.each do |name_hash|
    array2[0].keys.each do |name|
      if name_hash[:first_name] == name

        result << name_hash.merge(array2[0][name])
      end
    end
  end

  result
end

def find_cool( hash )
  hash.keep_if do |element|
    element.has_value?( 'cool' )
  end
end

def organize_schools( schools )
  locations = []
  schools.each do |school|
    locations += [ school[1][:location] ]
  end
  locations.uniq!
  schools_hash = Hash[ locations.map { |location| [location, [] ] } ]
  schools.each do |school|
    locations.each do |city|
      if school[1][:location] == city
        schools_hash[city] += [school[0]]
      end
    end
  end
  schools_hash
end
