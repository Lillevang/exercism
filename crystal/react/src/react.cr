module React
  abstract class Cell
    @listeners = [] of ComputeCell

    getter value
    getter listeners

    def notify_listeners(listeners : Array(ComputeCell))
      @listeners.each(&.update)
      @listeners.each(&.fire_callbacks)
    end
  end

  class InputCell < Cell
    def initialize(@value : Int32)
    end

    def value=(new_value : Int32)
      unless @value == new_value
        @value = new_value
        self.notify_listeners(@listeners)
      end
    end
  end

  class ComputeCell < Cell
    @value : Int32
    @old_value : Int32
    @function : -> Int32
    @callbacks = Hash(UInt64, (Int32 ->)).new

    def initialize(cell : Cell, &block : Int32 -> Int32)
      @function = ->{ block.call(cell.value) }
      @old_value = @value = @function.call
      cell.listeners << self
    end

    def initialize(cell_1 : Cell, cell_2 : Cell, &block : (Int32, Int32) -> Int32)
      @function = ->{ block.call(cell_1.value, cell_2.value) }
      @old_value = @value = @function.call
      cell_1.listeners << self
      cell_2.listeners << self
    end

    def update
      value = @function.call
      if value != @value
        @value = value
        self.listeners.each(&.update)
      end
    end

    def fire_callbacks
      unless @old_value == @value
        @callbacks.values.each(&.call(@value))
      end
      @listeners.each(&.fire_callbacks)
      @old_value = @value
    end

    def add_callback(&block : Int32 ->)
      id = block.hash
      @callbacks[id] = block
      id
    end

    def remove_callback(id : UInt64)
      @callbacks.delete(id)
    end
  end
end
