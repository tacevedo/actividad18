# r = (1..10).to_a.sample
class Roulette
  # attr_accessor :random

  def initialize
    @random = (1..10).to_a.sample
    @ganador = nil
  end
  def play(num)
    @ganador = num
    if @random == num
      puts "Ganaste"
    else
      puts "Perdiste"
    end
  end

  def history
    File.open( "roulette_history.txt", "a") do |f|
        f.puts "#{@random}"
        f.close
    end
    if @ganador == @random
      File.open( "winners.txt", "a") do |f|
          f.puts "#{@random}"
          f.close
      end
    end
  end

end

def read_history
  data = []
  valores = {}
  File.open('roulette_history.txt', 'r') { |file| data = file.readlines.map(&:chomp) }
  data.each do |value|
    if valores[value]
      valores[value] += 1
    else
      valores[value] = 1
    end
  end
  max = valores.max_by{ |k, v| v}
  aaa = valores.select{ |k, v| v == max[1]}

end

juega1 = Roulette.new()
juega1.play(2)
juega1.history()

print "el o los numeros mas repetidos son: "
valores = read_history
valores.each { |dato| puts "#{dato[0]} se repite #{dato[1]} veces" }
