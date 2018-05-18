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

#Crea objetos Course
objetos_curso = lee_archivo('cursos.txt')
puts objetos_curso

#cursos antes de una fecha


#cursos despues de una fecha
