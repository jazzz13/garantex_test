require './math_helper'

RSpec.describe MathHelper do

  context '#distance_between' do

    context 'two digits' do

      it '[2,1] <> [5,4] = 18' do
        expect(MathHelper.distance_between([2, 1], [5, 4])).to eq(18)
      end
      it '[5,1] <> [5,4] = 9' do
        expect(MathHelper.distance_between([5, 1], [5, 4])).to eq(9)
      end
      it '[5,9] <> [5,4] = 25' do
        expect(MathHelper.distance_between([5, 9], [5, 4])).to eq(25)
      end
      it '[0,9] <> [0,9] = 0' do
        expect(MathHelper.distance_between([0, 9], [0, 9])).to eq(0)
      end
    end

    context 'three digits' do

      it '[2,1,9] <> [5,4,1] = 22' do
        expect(MathHelper.distance_between([2, 1, 9], [5, 4, 1])).to eq(22)
      end
      it '[2,1,9] <> [5,4,2] = 27' do
        expect(MathHelper.distance_between([2, 1, 9], [5, 4, 2])).to eq(27)
      end
      it '[1,1,1] <> [1,1,1] = 0' do
        expect(MathHelper.distance_between([1, 1, 1], [1, 1, 1])).to eq(0)
      end
    end
  end

  context '#distance_between_digits' do

    it '4 - 5 -> 1' do
      expect(MathHelper.distance_between_digits(4, 5)).to eq(1)
    end

    it '2 - 2 -> 0' do
      expect(MathHelper.distance_between_digits(2, 2)).to eq(0)
    end

    it '6 - 2 -> 0' do
      expect(MathHelper.distance_between_digits(6, 2)).to eq(4)
    end

    it '0 - 9 -> 1' do
      expect(MathHelper.distance_between_digits(0, 9)).to eq(1)
    end

    it '9 - 0 -> 1' do
      expect(MathHelper.distance_between_digits(9, 0)).to eq(1)
    end

    it '8 - 1 -> 3' do
      expect(MathHelper.distance_between_digits(8, 1)).to eq(3)
    end


  end

  context '#next_vectors_from' do

    context 'two digits' do

      it '[2,1]' do
        expect(MathHelper.next_vectors_from([2, 1])).to eq(
                                                           [
                                                               [3,1],
                                                               [2,2],
                                                               [1,1],
                                                               [2,0]
                                                           ]
                                                       )
      end
    end

    context 'four digits' do

      it '[2,3,4,5]' do
        expect(MathHelper.next_vectors_from([2, 3, 4, 5])).to eq(
                                                                 [
                                                                     [3,3,4,5],
                                                                     [2,4,4,5],
                                                                     [2,3,5,5],
                                                                     [2,3,4,6],
                                                                     [1,3,4,5],
                                                                     [2,2,4,5],
                                                                     [2,3,3,5],
                                                                     [2,3,4,4]
                                                                 ]
                                                             )
      end
    end

    context 'from 9 to 0' do

      it '[0,5,9]' do
        expect(MathHelper.next_vectors_from([0, 5, 9])).to eq(
                                                           [
                                                               [1,5,9],
                                                               [0,6,9],
                                                               [0,5,0],
                                                               [9,5,9],
                                                               [0,4,9],
                                                               [0,5,8],
                                                           ]
                                                       )
      end
    end

  end

  context '#order_vectors' do

    context 'two digits' do

      it '[1,2] [3,3] [4,5] -> [5,5]' do

        vectors = [[1,2], [3,3], [4,5]]

        expect(MathHelper.order_vectors([5, 5], vectors)).to eq(
                                                                [
                                                                    [4,5],
                                                                    [3,3],
                                                                    [1,2]
                                                                ]
                                                            )
      end

      it '[7,7] [0,0] [4,5] -> [9,9]' do

        vectors = [[7,7], [0,0], [4,5]]

        expect(MathHelper.order_vectors([9, 9], vectors)).to eq(
                                                                [
                                                                    [0,0],
                                                                    [7,7],
                                                                    [4,5]
                                                                ]
                                                            )
      end
    end

    context 'three digits' do

      it '[3,3] [5,5] -> [9,9]' do

        vectors = [[3,3], [5,5]]

        expect(MathHelper.order_vectors([9, 9], vectors)).to eq(
                                                                [
                                                                    [3,3],
                                                                    [5,5],
                                                                ]
                                                            )
      end
    end

  end
end