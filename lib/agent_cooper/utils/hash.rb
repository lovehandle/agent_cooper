module AgentCooper
  module Utils
    class Hash
      def self.from_xml(xml, options)
        unless xml.is_a?(Nokogiri::XML::Node)
          raise ArgumentError, "`xml` must be an instance of Nokogiri::XML::Node"
        end

        doc = XMLDocumentDecorator.new(xml, options)

        doc.to_hash
      end

      class XMLDocumentDecorator
        def initialize(document, options)
          @document, @options = document, options
        end

        def to_hash
          root.to_hash
        end

        def root
          XMLNodeDecorator.new(document.root, options)
        end

        def method_missing(m, *args)
          document.send(m, *args)
        end

        private

        attr_reader :document, :options
      end

      class XMLNodeDecorator
        CONTENT_ROOT = '__content__'.freeze

        def initialize(node, options)
          @node, @options = node, options
        end

        def to_hash(hash = {})
          node_hash = {}

          # Insert node hash into parent hash correctly
          case hash[name]
            when Array then hash[name] << node_hash
            when Hash  then hash[name] = [hash[name], node_hash]
            when nil   then hash[name] = node_hash
          end

          # Handle child elements
          children.each do |c|
            child = XMLNodeDecorator.new(c, options)

            if child.element?
              child.to_hash(node_hash)
            elsif child.text? || child.cdata?
              unless preserve_attributes?
                hash[name] = child.content
              else
                node_hash[CONTENT_ROOT] ||= ''
                node_hash[CONTENT_ROOT] << child.content
              end
            end
          end

          # Remove content node if it is blank and there are child tags
          if node_hash.length > 1 && node_hash[CONTENT_ROOT].empty?
            node_hash.delete(CONTENT_ROOT)
          end

          # Handle attributes
          attribute_nodes.each {|a| node_hash[a.node_name] = a.value }

          hash
        end

        def method_missing(m, *args)
          node.send(m, *args)
        end

        private

        def preserve_attributes?
          options.fetch(:preserve_attributes) { false }
        end

        attr_reader :node, :options
      end
    end
  end
end
