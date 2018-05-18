class Table
  attr_reader :name, :recaudaciones
  def initialize(nombre, *recaudaciones)
    @name = nombre
    @recaudaciones = recaudaciones.map(&:to_i)
  end
end

def lee_archivo(archivo)
  lista_recaudaciones = []
  data = []
  File.open(archivo, 'r') { |file| data = file.readlines}
  data.each do |datos|
    ls = datos.split(', ')
    lista_recaudaciones << Table.new(*ls)
  end
  lista_recaudaciones
end

def maximo_dia(mesas)
  mesas.each do |mesa|
    aux = 0
    dia = 0
    mesa.recaudaciones.each_with_index do |dato, i|
      if dato > aux
        aux = dato
        dia = i + 1
      end
    end
    puts "mesa #{mesa.name} el dia #{dia} mas recaudaciones: #{aux}"
  end
end

def promedio(mesas)
  suma = 0
  dias = 0;
  mesas.each do |mesa|
    dias = mesa.recaudaciones.length
    mesa.recaudaciones.each_with_index do |dato, i|
        dato = dato.to_i
        suma += dato
    end
  end

  return promedio = suma / (mesas.length.to_f * dias)
end

#Crea objetos Table
objetos_mesa = lee_archivo('casino.txt')

#mayor valor recaudado por mesa
maximo_dia(objetos_mesa)

#promedio de todos los dias todas las mesas
print "promedio todas las mesas todos los dias: "
puts promedio(objetos_mesa)
