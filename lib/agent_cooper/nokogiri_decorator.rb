module AgentCooper

  # Based on https://gist.github.com/335286

  class Nokogiri::XML::Document
    def to_hash
      root.to_hash
    end
  end

  class Nokogiri::XML::Element
    def to_hash
      ({}).tap do |hash|

        attributes.each_pair do |key, attribute|
          hash[key] = attribute.value
        end

        children.each do |child|
          result = child.to_hash

          if child.name == 'text'
            if hash.empty?
              return result
            else
              hash['__content__'] = result
            end
          elsif hash[child.name]
            if hash[child.name].is_a?(Array)
              hash[child.name]  << result
            else
              hash[child.name] = [hash[child.name]] << result
            end
          else
            hash[child.name] = result
          end
        end
      end
    end
  end

  class Nokogiri::XML::Text
    def to_hash
      content.to_s
    end
  end
end
