require './math_helper'
require './lock_state'

class Lock

  MAX_DEEP_LEVEL = 1000

  def initialize(start_vector, target_vector, stop_list)
    @start_vector = start_vector
    @target_vector = target_vector
    @stop_list = stop_list
  end

  def find_target

    root_state = LockState.new(@start_vector, @target_vector, nil)
    cache[key_for_vector(root_state.vector)] = root_state

    return root_state if root_state.target? # https://memepedia.ru/ache-vsmysle/

    find_target_in_next_states(@start_vector, root_state)
  end

  def find_target_in_next_states(from_vector, parent_state, deep_level = 0)

    # so deep, need try others paths
    return nil if deep_level > MAX_DEEP_LEVEL

    # find optimal next vectors
    vectors = MathHelper.next_vectors_from(from_vector)
    vectors = MathHelper.order_vectors(@target_vector, vectors)

    # clear already calculated and forbidden vectors
    vectors.delete_if { |vector| @stop_list.include?(vector) }
    vectors.delete_if { |vector| cache[key_for_vector(vector)] }

    # select ony perspective directions
    vectors = vectors[0..(@start_vector.count - 1)]

    # create next LockState instances
    states = vectors.map do |vector|
      key = key_for_vector(vector)
      cache[key] = LockState.new(vector, @target_vector, parent_state)
      cache[key]
    end

    # maybe we found target?
    states.each do |state|
      return state if state.target?
    end

    # find deeper...
    states.each do |state|
      target_state = find_target_in_next_states(state.vector, state, deep_level + 1)
      return target_state if target_state
    end

    nil
  end

  def key_for_vector(vector)
    vector.join('|')
  end

  def cache
    @cashed_states ||= {}
  end


end