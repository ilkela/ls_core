class Element
  attr_reader :datum
	attr_accessor :next

  def initialize(datum, next_datum = nil)
    @datum = datum
    @next = next_datum
  end

  def tail?
    @next.nil?
  end
end

class SimpleLinkedList
  def self.from_a(array)
    array = [] if array == nil
    SimpleLinkedList.new(array)
  end

	def initialize(array = [])
		@list = array.map { |ele| Element.new(ele) }
		@list.each_with_index { |ele, index| ele.next = @list[index + 1] }
	end

  def push(datum)
    element = Element.new(datum)
    @list.prepend(element)

    if @list.size == 1
      @list[0].next = nil
    else
      @list[0].next = @list[1]
    end
  end

  def size
    @list.size
  end

  def empty?
    @list.empty?
  end

  def peek
    return nil if empty?
    head.datum
  end

  def head
    @list.first
  end

  def pop
    @list.shift.datum
  end

  def to_a
    @list.map { |ele| ele.datum }
  end

  def reverse
		reversed_list = @list.reverse.map { |el| el.datum }
		SimpleLinkedList.new(reversed_list)
  end
end

