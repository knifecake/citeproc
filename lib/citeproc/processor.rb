module CiteProc

  class Processor
    extend Forwardable

    include Abbreviate
    include Converters

    @defaults = {
      :locale => 'en-US',
      :style  => 'chicago-author-date',
      :engine => 'citeproc-ruby',
      :format => 'html'
    }.freeze

    class << self
      attr_reader :defaults
    end

    attr_reader :options, :items
    attr_writer :engine

    def_delegators :@items, :key?, :value?, :has_key?, :has_value?,
      :include?, :member?, :length, :empty?

    def initialize(options = {})
      @options, @items = Processor.defaults.merge(options), {}
      yield self if block_given?
    end

    def engine
      @engine ||= Engine.autodetect(options).new(self)
    end

    def [](id)
      items[id.to_sym]
    end

    def []=(id, item)
      items[id.to_sym] = Item(item)
    end

    def register(item)
      item = Item(item)
      items[item.to_sym] = item
    rescue => e
      raise "failed to register item #{item.inspect}: #{e.message}"
    end

    def <<(item)
      register(item)
      self
    end

    def update(*arguments)
      arguments.flatten(1).each do |argument|
        case argument
        when Item
          register(argument)
        when Array
          argument.each { |item| register(item) }
        when Hash
          argument.each do |id, item|
            id, item = id.to_sym, Item(item)

            if items.key?(id) && block_given?
              items[id] = yield items[id], item
            else
              items[id] = item
            end
          end
        else
          raise "failed to register items #{argument.inspect}"
        end
      end

      self
    ensure
      # notify engine
    end
    alias import update


    def process(*arguments)
      engine.process(CitationData.new(arguments.flatten(1)))
    end

    def append(*arguments)
      engine.append(CitationData.new(arguments.flatten(1)))
    end

    def bibliography(*arguments, &block)
      engine.bibliography(Selector.new(*arguments, &block))
    end

    def render(*arguments)
      engine.render(CitationData.new(arguments.flatten(1)))
    end

    def inspect
      "#<CiteProc::Processor style=#{options[:style].inspect} locale=#{options[:locale].inspect} items=[#{items.length}]>"
    end
  end
end
