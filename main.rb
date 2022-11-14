require './lock'

start_vector = [0,0,0]
target_vector = [1,1,1]
stop_list = [
    [0,0,1],
    [1,0,0]
]

lock = Lock.new(start_vector, target_vector, stop_list)

target_state = lock.find_target

puts target_state.path if target_state
puts 'Solution not found =(' unless target_state