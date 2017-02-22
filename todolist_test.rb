require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  # Your tests go here. Remember they must start with "test_"

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(@todos.size, @list.size)
  end

  def test_first
    assert_same(@todo1, @list.first)
  end

  def test_last
    assert_same(@todo3, @list.last)
  end

  def test_shift
    assert_same(@todo1, @list.shift)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    assert_same(@todo3, @list.pop)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done?
    assert_equal(false, @list.done?)
    @todo1.done!
    @todo2.done!
    assert_equal(false, @list.done?)
    @todo3.done!
    assert_equal(true, @list.done?)
  end

  def test_add_wrong_object
    assert_raises(TypeError) { @list.add("Drink water") }
    assert_raises(TypeError) { @list.add(1) }
  end

  def test_shovel_left
    new_todo = Todo.new("Wash dishes")
    @list << new_todo
    @todos << new_todo

    assert_equal(@todos, @list.to_a)
  end

  def test_add
    new_todo = Todo.new("Wash dishes")
    @list.add(new_todo)
    @todos << new_todo

    assert_equal(@todos, @list.to_a)
  end

  def test_item_at
    assert_same(@todo1, @list.item_at(0))
    assert_same(@todo2, @list.item_at(1))
    assert_raises(IndexError) { @list.item_at(3) }
  end

  def test_mark_done_at
    @list.mark_done_at(0)
    assert_equal(true, @list.item_at(0).done?)
    assert_equal(false, @list.item_at(1).done?)
    assert_equal(false, @list.item_at(2).done?)

    assert_raises(IndexError) { @list.mark_done_at(3) }
  end

  def test_mark_undone_at
    @todos.each { |todo| todo.done! }
    @list.mark_undone_at(1)

    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(true, @todo3.done?)

    assert_raises(IndexError) { @list.mark_undone_at(3) }
  end

  def test_done
    @list.done!

    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(10) }

    todo = @list.remove_at(1)
    assert_same(@todo2, todo)
    assert_equal([@todo1, @todo3], @list.to_a)
  end

  def test_to_s
    output = <<-OUTPUT.chomp.gsub(/^\s+/, "")
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_first_done
    output = <<-OUTPUT.chomp.gsub(/^\s+/, "")
    ---- Today's Todos ----
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    @todo1.done!
    assert_equal(output, @list.to_s)
  end

  def test_to_s_all_done
    output = <<-OUTPUT.chomp.gsub(/^\s+/, "")
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    @list.done!
    assert_equal(output, @list.to_s)
  end

  def test_each
    todos = []
    @list.each do |todo|
      todos << todo
    end

    assert_equal(todos, @todos)
  end

  def test_each_returns_original_list
    assert_same(@list.each { |todo| nil }, @list)
  end

  def test_select
    @todo1.done!
    output = @list.select { |todo| todo.done? }

    assert_instance_of(TodoList, output)
    assert_equal(@list.title, output.title)
    assert_equal([@todo1], output.to_a)
  end

  def test_all_done
    @todo1.done!
    list = @list.all_done
    assert_equal([@todo1], list.to_a)
  end

  def test_all_not_done
    @todo1.done!
    list = @list.all_not_done
    assert_equal([@todo2,@todo3], list.to_a)
  end

  def test_mark_done
    @list.mark_done("Buy milk")
    assert(@todo1.done?)
  end

  def test_mark_all_undone
    @todo1.done!
    @todo2.done!
    @list.mark_all_undone
    @todos.each { |todo| assert_equal(false, todo.done?) }
  end
end