include Comparable
class PublicacionesPeriodicas
    
    attr_accessor :referencia, :autor, :titulo, :num_pag, :f_pub
    
    def  initialize(args)
        @referencia = args[:referencia]
        @autor = args[:autor]
        @titulo = args[:titulo]
        @num_pag = args[:num_pag]
        @f_pub = args[:f_pub]
    end
    
    def each 
      yield @referencia
    end
    
    def <=>(other)
        self.referencia <=> other.referencia
    end 
end  