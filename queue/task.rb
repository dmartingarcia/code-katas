class Task
  class << self
    def enqueue(delay, &block)
      queue << [delay, block] if block
    end

    def work
      sorted_queue.each do |delay, block|
        block.call
      end
    end

    def reset
      queue = []
    end

    private

    def sorted_queue
      queue.sort_by { |delay, _v| delay }
    end

    def queue
      @@queue ||= []
    end
  end
end
