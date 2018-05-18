class Table
  attr_accessor :name, :recaudaciones
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

objetos_mesa = lee_archivo('casino.txt')
print "promedio todas las mesas todos los dias: "
puts promedio(objetos_mesa)
