class PublicacionesPeriodicas
    attr_accessor :autor, :titulo, :sitio_pub, :num_pag, :f_pub
    
    def  initialize(args)
        @autor = args[:autor]
        @titulo = args[:titulo]
        @sitio_pub = args[:sitio_pub]
        @num_pag = args[:num_pag]
        @f_pub = args[:f_pub]
    end
end  