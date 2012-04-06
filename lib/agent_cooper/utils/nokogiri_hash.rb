module Nokogiri::XML

  class Document

    def to_hash
      self.root.element? ? self.root.to_hash : {self.root.name => self.root.text}
    end

  end

  class Element

    def to_hash
      { self.name => self.collect_attributes }
    end

    def collect_attributes
      ({}).tap do |hash|
        self.children.each do |child|
          next if child.text?
          if child.element?
            if child.children.length > 1
              hash[child.name] = child.collect_attributes
            else
              hash[child.name] = child.text.strip
            end
          end
        end
      end
    end

  end
end
