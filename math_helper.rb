class MathHelper

  # [1,1] , [2,3]  ->  1^2 * 2^2  ->  5
  def self.distance_between(vector_a, vector_b)
    delta_vector = []
    vector_a.each_with_index do |a, index|
      b = vector_b[index]
      delta_vector << distance_between_digits(a, b) ** 2
    end
    delta_vector.sum
  end

  # 1 , 9  ->  2
  def self.distance_between_digits(a,b)
    return 0 if a == b
    min, max = a < b ? [a,b] : [b,a]
    [
        (max - min),
        (min + 10 - max)
    ].min
  end

  # [3,3]  ->  [4,3] [3,4] [2,3] [3,2]
  def self.next_vectors_from(vector)
    results = []
    increment_iteration = true
    (vector.count * 2).times.each do |index|
      item = vector.dup
      target_index = increment_iteration ? index : index - vector.count
      item[target_index] += 1 if increment_iteration
      item[target_index] -= 1 unless increment_iteration
      item[target_index] = 0 if item[target_index] == 10
      item[target_index] = 9 if item[target_index] == -1
      results << item

      increment_iteration = false if index == vector.count - 1
    end
    results
  end
  
  def self.order_vectors(target, vectors)
    vectors.sort_by { |vector| distance_between(target, vector) }
  end

end