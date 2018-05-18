require 'date'
class Course
  attr_reader :name, :inicio, :termino
  def initialize(nombre, inicio, termino)
    @name = nombre
    @inicio = inicio
    @termino = termino
  end
end

def lee_archivo(archivo)
  lista_cursos = []
  data = []
  File.open(archivo, 'r') { |file| data = file.readlines}
  data.each do |datos|
    ls = datos.split(', ')
    lista_cursos << Course.new(ls[0], ls[1], ls[2])
  end
  lista_cursos
end
#curso inicia antes de
def before_date(cursos, fecha = Date.today)
  cursos_filter = []
  cursos.each do |curso|
    if Date.parse(curso.inicio) < fecha
      cursos_filter.push(curso.name)
    end
  end
  cursos_filter
end

#curso finaliza despues de
def after_date(cursos, fecha = Date.today)
  cursos_filter = []
  cursos.each do |curso|
    if Date.parse(curso.termino) < fecha
      cursos_filter.push(curso.name)
    end
  end
  cursos_filter
end
#Crea objetos Course
objetos_cursos = lee_archivo('cursos.txt')

#cursos antes de una fecha
fecha1 = "2017-05-17";
puts "cursos que inician antes de #{fecha1}:"
puts before_date(objetos_cursos, Date.parse(fecha1))

#cursos despues de una fecha
fecha2 = "2017-08-13";
puts "cursos que terminan después de #{fecha2}:"
puts after_date(objetos_cursos, Date.parse(fecha2))
