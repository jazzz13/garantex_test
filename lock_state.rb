
class LockState

  def initialize(vector, target_vector, parent_state)
    @vector = vector
    @target_vector = target_vector
    @parent_state = parent_state
  end

  def key
    key_by_vector(@vector)
  end

  def key_by_vector(vector)
    vector.join('|')
  end

  def vector
    @vector
  end

  def parent_state
    @parent_state
  end

  def target?
    @vector == @target_vector
  end

  def path
    path = [key]
    _parent_state = parent_state
    while _parent_state
      path << _parent_state.key
      _parent_state = _parent_state.parent_state
    end
    path.reverse.join(' -> ')
  end

end