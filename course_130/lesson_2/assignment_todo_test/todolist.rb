# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone?
    !done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end
end

# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def <<(obj)
    raise TypeError.new("Can only add Todo objects") unless obj.instance_of?(Todo)

    @todos << obj
  end
  alias_method :add, :<<

  def all_done
    select(&:done?)
  end

  def all_not_done
    select(&:undone?)
  end 

  def done!
    @todos.each_index do |idx|
      mark_done_at(idx)
    end
  end

  def done?
    @todos.all? { |todo| todo.done? }
  end

  def each
    idx = 0
    while idx < @todos.size
      yield(@todos[idx])
      idx += 1
    end
    self
  end

  def find_by_title(todo_title)
    select { |object| object.title =~ /#{todo_title}/i }.first
  end

  def first
    @todos[0]
  end

  def item_at(idx)
    raise IndexError if idx > self.size

    @todos[idx]
  end

  def last
    @todos[-1]
  end

  def mark_done(todo_title)
    find_by_title(todo_title).done!
  end

  def mark_all_done
    each { |todo| todo.done! }
  end

  def mark_all_undone
    each { |todo| todo.undone! }
  end

  def mark_done_at(idx)
    item_at(idx).done!
  end

  def mark_undone_at(idx)
    item_at(idx).undone!
  end

  def pop
    @todos.delete_at(-1) # or #.pop
  end

  def remove_at(idx)
    raise IndexError if idx > self.size

    @todos.delete_at(idx)
  end

  def select
    selection = TodoList.new(title)
    self.each do |element|
      selection.add(element) if yield(element) 
    end
    selection
  end

  def shift
    @todos.delete_at(0) # or #.shift
  end 

  def size
    @todos.size
  end

  def to_a
    @todos
  end

  def to_s
    text = "---- #{title} ----\n"
    text << @todos.map(&:to_s).join("\n")
    text
  end
end

# given
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")

# ---- Adding to the list -----

# add
list.add(todo1)
list.add(todo2)
list.add(todo3)

#p list.all_not_done