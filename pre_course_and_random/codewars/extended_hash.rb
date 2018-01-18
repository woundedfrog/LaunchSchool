#For this kata you will be extending the Hash class to support a new method called 'flattened_keys'. The purpose of this method is to return a new hash that has any nested values flattened so that there is only the single root hash structure. The keys from the nested hash will be merged into the parent, separated by underscores.
#
#Basic example

#unflat = {id: 1, info: {name: 'example'}}.flattened_keys
#unflat.flattened_keys # equals {id: 1, info_name: 'example'}
# notice the info_name flattened key


unflat = {
  id: 1, 
  info: { 
    name: 'example', 
    more_info: {
      count: 1
      }
    }
  }

class Hash
  def flattened_keys(keys = [])
    flat_map do |key, value|
      if value.is_a?(Hash)
        value.flattened_keys([*keys, key])
      else
        new_key = [*keys, key].join('_')
        new_key = new_key.to_sym if [*keys, key].all? { |k| k.is_a? Symbol }
        { new_key => value }
      end
    end.reduce(:merge)
  end
end
#OR

class Hash
  def flattened_keys
    given_hash = self
    new_hash = {}
    loop do
      given_hash.each do |k, v|
        if not_flattened?(v)
          new_key = nil
          v.each do |sub_k, sub_v|

            new_key = flatten_helper(k, sub_k)
            new_hash[new_key] = sub_v
          end
        else
          new_hash[k] = v
        end
      end
      given_hash = new_hash
      new_hash = {}
      return given_hash unless given_hash.values.any? {|vals| vals.class == Hash}
    end
  end

  def not_flattened?(val)
    val.class == Hash
  end

  def flatten_helper(*keys)
    if keys.any? {|k| k.class == String }
      return keys.map(&:to_s).join("_")
    else
      key = keys.map(&:to_s).join("_")
      key.to_sym
    end
  end
end

flat = unflat.flattened_keys
p flat == {id: 1, info_name: 'example', info_more_info_count: 1}
#Notice that so far only symbols have been used as hash keys. If at any point in the path one of the keys is a string then the resulting flattened key should be a string as well.

#For example:

unflat = {a: 1, 'b' => 2, info: {id: 1, 'name' => 'example'}}
flat = unflat.flattened_keys
p flat == {a: 1, 'b' => 2, info_id: 1, 'info_name' => 'example'}