require './lock'

RSpec.describe Lock do

  context 'two digits' do

    it 'simple case' do

      start = [1,1]
      target = [5,5]
      stop = []

      lock = Lock.new(start, target, stop)
      target_state = lock.find_target
      expect(target_state).not_to be(nil)
    end

    it 'no solution' do

      start = [1,1]
      target = [5,5]
      stop = [[4,5],[5,4],[6,5],[5,6]]

      lock = Lock.new(start, target, stop)
      target_state = lock.find_target
      expect(target_state).to be(nil)
    end

    it 'solution with difficult path' do
      start = [1,1]
      target = [5,5]
      stop = [[4,5],[5,4],[6,5], [4,6], [4,7], [4,8], [4,9], [6,6], [6,7], [6,8], [6,9]]

      lock = Lock.new(start, target, stop)
      target_state = lock.find_target
      expect(target_state).not_to be(nil)
      expect(target_state.path).to include('5|0 -> 5|9 -> 5|8 -> 5|7 -> 5|6 -> 5|5')
      # pp target_state.path
    end

  end

  context 'five digits' do

    it 'no solution' do

      start = [0,0,0,0,0]
      target = [5,5,5,5,5]
      stop = MathHelper.next_vectors_from(target)

      lock = Lock.new(start, target, stop)
      target_state = lock.find_target
      expect(target_state).to be(nil)
    end

  end

  context 'six digits' do

    it 'simple case' do

      start = [8,3,7,1,5,0]
      target = [0,5,1,7,3,8]
      stop = []

      lock = Lock.new(start, target, stop)
      target_state = lock.find_target
      expect(target_state).not_to be(nil)
    end

    it 'solution with one entary point' do
      start = [8,3,7,1,5,0]
      target = [0,5,1,7,3,8]
      stop = [
          [1,5,1,7,3,8],
          [0,6,1,7,3,8],
          [0,5,2,7,3,8],
          [0,5,1,8,3,8],
          [0,5,1,7,4,8],
          # [0,5,1,7,3,9], <- entary
          [9,5,1,7,3,8],
          [0,4,1,7,3,8],
          [0,5,0,7,3,8],
          [0,5,1,6,3,8],
          [0,5,1,7,2,8],
          [0,5,1,7,3,7],
      ]

      lock = Lock.new(start, target, stop)
      target_state = lock.find_target
      expect(target_state).not_to be(nil)
      expect(target_state.path).to include('0|5|1|7|3|9 -> 0|5|1|7|3|8')

    end

  end

end