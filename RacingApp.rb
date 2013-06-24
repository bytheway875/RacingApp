class Car
@@number_of_cars=0

	attr_accessor :name,
		:acceleration, :maxspeed, :distance, :speed

	def initialize
		@@number_of_cars +=1
		@name = "Car #{@@number_of_cars}"
		@acceleration=rand(4)+1
		@speed = 0
		@maxspeed=rand(5)+5
		@distance = 0
		@crash_number = rand(50)
	end

		def crash?(race_crash_number)
		@crash_number == race_crash_number
	end

end

class Race
	attr_accessor :laps, :total_distance

	def initialize(laps)
			@Car1 = Car.new
			@Car2 = Car.new
			@Car3 = Car.new
			@Car4 = Car.new
			@Car5 = Car.new
			@Cars = [@Car1, @Car2, @Car3, @Car4, @Car5]
			@total_laps = laps
			@total_distance = laps*20
			@current_lap = 0
			@place = ["First Place: ", "Second Place: ", "Third Place: ", "Fourth Place: ", "Fifth Place: "]
			@current_place = 0

			puts "All 5 cars are at the starting line!"
			puts

			while gets.chomp
				lap
			end

	end

	def lap
		@current_lap +=1
		if @current_lap <= @total_laps
			@Cars.map do |car|
				if car.speed < car.maxspeed
					if car.speed+car.acceleration > car.maxspeed
						car.speed = car.maxspeed
					else
						car.speed +=car.acceleration
					end
				end
				if car.crash?(rand(50))
					car.speed =0
					car.acceleration =0
					puts "#{car.name} crashed!!!"
				else
					car.distance +=car.speed
					puts "#{car.name} is going #{car.speed}, and has gone #{car.distance}!"
				end
			end

			@Cars.each do |car|
				print "|"
				car.distance.times{print "-"}
				print car.name
				puts
			end

			if @current_lap == @total_laps
					@Cars.sort! {|x,y|  y.distance <=>x.distance}

				puts "Results:"
				puts

				@Cars.chunk{ |car|
					car.distance
					}.map  { |value, ary|
						puts "#{@place[@current_place]} #{ary.map{|x|x.name.to_s}}"
						@current_place+=1
						}
				abort("GAME OVER")
			end
		end
	end
end